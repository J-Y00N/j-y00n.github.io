---
title: "EEG Motor Imagery Classification"
date: 2026-01-01
summary: "An EEG motor imagery study comparing classical, geometric, and deep baselines across within-subject, LOSO, and transfer protocols."
status: Completed
area: "EEG / BCI / Machine Learning"
repo_url: "https://github.com/J-Y00N/EEG-Motor-Imagery-Classification"
report_url: "https://github.com/J-Y00N/EEG-Motor-Imagery-Classification/blob/main/docs/report.md"
thumbnail_url: "/assets/images/research/eeg/evaluation-pipeline.png"
---
## Overview

This project studies EEG-based motor imagery classification with an emphasis on reproducible evaluation and clearly separated protocol families.
It focuses on binary left-versus-right motor imagery decoding and compares multiple baseline families under within-subject, subject-independent, and transfer settings.

## Why This Project Matters

I see this project as one of the clearest bridges between my interests in machine learning, biosignals, and BCI-oriented research.
It is not only about training a model, but about asking how different evaluation settings change what a result actually means.

## Scope

- Dataset: `BNCI2014_001`
- Task: binary motor imagery classification
- Signal type: EEG
- Protocols: within-subject, LOSO, and cross-subject transfer
- Baseline families: classical, Riemannian, and deep learning

![EEG evaluation pipeline]({{ '/assets/images/research/eeg/evaluation-pipeline.png' | relative_url }})

*Figure. Evaluation pipeline used to separate within-subject, LOSO, and cross-subject transfer settings under a shared preprocessing and baseline framework.*

## What I Focused On

- comparing how model rankings change across within-subject, LOSO, and transfer settings
- examining how classical, Riemannian, and deep baselines differ once protocols are separated
- treating protocol separation as part of the interpretation rather than mixing incompatible claims
- checking whether EEGNet's transfer advantage remains stable under repeated-seed validation

## Current Notes

The main result of the project is that model ranking is protocol-dependent.
`FBCSP` is strongest in within-subject evaluation, while `EEGNet` is strongest in LOSO and transfer settings, with the Riemannian baseline remaining the strongest non-deep alternative in transfer analysis.

## Links

- [GitHub Repository](https://github.com/J-Y00N/EEG-Motor-Imagery-Classification)
- [Project Report](https://github.com/J-Y00N/EEG-Motor-Imagery-Classification/blob/main/docs/report.md)
