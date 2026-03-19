---
title: "ECG Arrhythmia Classification"
date: 2025-01-01
summary: "A five-class ECG arrhythmia classification study examining augmentation settings and class-imbalance behavior on MIT-BIH beat-level data."
status: Completed
area: "ECG / Biomedical Signals / Deep Learning"
repo_url: "https://github.com/J-Y00N/ECG-Arrhythmia-Classification-ResNet"
report_url: "https://github.com/J-Y00N/ECG-Arrhythmia-Classification-ResNet/blob/main/docs/report.md"
thumbnail_url: "/assets/images/research/ecg/model-architecture.png"
---
## Overview

This project focuses on heartbeat classification using beat-level ECG data and a refactored deep learning pipeline for five-class arrhythmia prediction.
The repository reorganizes a previously notebook-driven workflow into a cleaner, reusable codebase with experiment outputs, evaluation artifacts, and report material.

![ECG model architecture]({{ '/assets/images/research/ecg/model-architecture.png' | relative_url }})

*Figure. Refactored 1D CNN architecture and end-to-end training workflow used for the ECG arrhythmia classification experiments.*

## Why This Project Matters

This work shows how I think about biomedical signal problems beyond a single notebook experiment.
It combines modeling, evaluation, and pipeline organization in a way that is useful for longer-term technical and research-oriented work.

## Scope

- Dataset: MIT-BIH beat-level ECG data
- Task: five-class arrhythmia classification
- Signal type: ECG
- Model family: 1D CNN / ResNet-style heartbeat classification pipeline
- Focus: training workflow, evaluation, and augmentation comparison

![ECG augmentation comparison]({{ '/assets/images/research/ecg/augmentation-comparison.png' | relative_url }})

*Figure. Comparison of augmentation settings across the main ECG evaluation metrics, with materialized augmentation giving the strongest overall result.*

## What I Focused On

- comparing no augmentation, on-the-fly augmentation, and materialized augmentation
- examining how class imbalance affects recall and precision across heartbeat classes
- interpreting why materialized augmentation gives a modest but consistent improvement

## Current Notes

All three augmentation settings achieved strong performance above `0.97` test accuracy, with materialized augmentation producing the best overall result.
The project was especially useful for understanding how augmentation mode and class imbalance interact in biomedical signal classification.

## Links

- [GitHub Repository](https://github.com/J-Y00N/ECG-Arrhythmia-Classification-ResNet)
- [Project Report](https://github.com/J-Y00N/ECG-Arrhythmia-Classification-ResNet/blob/main/docs/report.md)
