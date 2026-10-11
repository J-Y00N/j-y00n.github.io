# Lists links and images inside the built site that point to a file that was not built.
# Only addresses that start with a single "/" are checked. Links to other websites are skipped.
# Usage: ruby bin/check-site.rb [site folder, _site by default]
require "uri"

site = ARGV[0] || "_site"
abort "#{site}/ does not exist. Run ./bin/build first." unless Dir.exist?(site)

# File names are compared exactly as they were built, because GitHub Pages tells upper and lower case apart even where the computer does not.
# They are also put in one Unicode form, because macOS may store accented letters differently from how they are written in a link.
normalize = ->(name) { name.dup.force_encoding(Encoding::UTF_8).scrub.unicode_normalize(:nfc) }
built = {}
Dir.glob("**/*", File::FNM_DOTMATCH, base: site).each do |name|
  built[normalize.call(name)] = true if File.file?(File.join(site, name))
end

pages = Dir.glob(File.join(site, "**", "*.html")).sort
missing = []
checked = 0

pages.each do |page|
  # Code samples and HTML comments are text, not links, so they are left out.
  html = File.read(page, encoding: "UTF-8").gsub(%r{<!--.*?-->|<(pre|code)\b.*?</\1>}im, "")
  targets = html.scan(/\s(?:href|src)\s*=\s*(["'])(.*?)\1/im).map(&:last)
  html.scan(/\ssrcset\s*=\s*(["'])(.*?)\1/im).each do |_, srcset|
    targets += srcset.split(",").map { |candidate| candidate.strip.split(/\s+/).first.to_s }
  end

  targets.each do |target|
    next unless target.start_with?("/") && !target.start_with?("//")

    checked += 1
    path = target.sub(/[?#].*\z/m, "").gsub("&amp;", "&")
    begin
      path = URI.decode_uri_component(path)
    rescue ArgumentError
      # A broken %XX sequence is checked as written.
    end
    path += "index.html" if path.end_with?("/")
    file = normalize.call(path.delete_prefix("/"))
    next if built[file] || built["#{file}.html"] || built["#{file}/index.html"]

    missing << "#{page.delete_prefix("#{site}/")}: #{target}"
  end
end

if missing.empty?
  puts "Link check OK: #{checked} internal links and images in #{pages.size} pages point to built files."
else
  puts "Link check failed. These internal links and images point to files that were not built:"
  missing.uniq.each { |line| puts "  #{line}" }
  exit 1
end
