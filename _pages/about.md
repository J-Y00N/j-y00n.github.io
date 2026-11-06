---
title: About
description: "Background, research motivation, and current direction of J. Yoon."
permalink: /about/
heading: About Me
---
{% comment %}
Internal editing note:
- Keep this page public-facing and narrative-driven.
- Maintenance guidance belongs primarily in README.md.
{% endcomment %}
## Background

I came to statistics from clinical practice.
For five years I worked as a registered nurse, mostly in orthopaedics, including six weeks seconded to neurosurgery.
While nursing, I studied management at Korea National Open University (KNOU), where economics and financial management reminded me how much I enjoyed mathematics, and I then returned to KNOU for a BSc in Statistics and Data Science, with a double major in Computer Science.

## Motivation

At the bedside I saw the same operation lead to very different recoveries, most of all in patients with neurological deficits or cognitive impairment.
I wanted to understand such variation quantitatively rather than only respond to it, and during my degree that interest settled on neural signals and brain–computer interfaces, which aim to restore movement or communication for people with paralysis.

Two projects, both prize-winners in the KNOU Statistics and Data Analysis Competition and later rebuilt, turned this clinical question into a statistical one.
In ECG arrhythmia classification, holding out whole patients rather than single heartbeats cut the macro F1 score from 0.963 to 0.592, and because beats from one patient are correlated, beat-level confidence intervals were about 24 times too narrow.
In EEG motor-imagery decoding, EEGNet beat a Riemannian decoder for all nine held-out subjects, yet with one session's worth of training data it was the least accurate of five decoders.
In both, what decided the answer was evaluation and inference rather than model architecture.

## Current Direction

These projects taught me to detect variation between individuals and correct for it, but not yet to model it.
I want to work on models that share information across people, such as hierarchical and probabilistic latent-variable models, and on quantifying uncertainty for a new person rather than an average one.
I am preparing for an MSc in statistics or machine learning, followed by a PhD on statistical machine learning for data that vary across individuals, with computational neuroscience and brain–computer interfaces as my main applications.
The question I want to help answer is when what is learned from many people can be trusted for the next one, and when it cannot, above all for those who differ most from the average.