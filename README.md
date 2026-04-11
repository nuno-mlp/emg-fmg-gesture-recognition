# EMG–FMG Gesture Recognition  
Signal processing and classification  

This repository contains a workflow for hand gesture recognition using EMG (electromyography) and FMG (force myography).  

It implements a MATLAB pipeline for preprocessing raw biosignals, extracting features, and building datasets for gesture classification, based on data acquired with BITalino and OpenSignals. These datasets are then used to train and evaluate classification models in the MATLAB Classification Learner app.  

This work was developed as part of a final-year biomedical engineering project, and its results were later published in [*A Bimodal EMG/FMG System Using Machine Learning Techniques for Gesture Recognition Optimization*](https://doi.org/10.3390/signals6010008), *Signals*, 2025.  

> **Note**  
> The hardware and data acquisition setup (sensors, placement, and signal conditioning) will be added in a future update.  
> This repository focuses on the downstream signal processing pipeline and dataset construction.  

## Workflow
Given the acquired data, the workflow includes the following stages:

- Signal preprocessing (filtering and denoising)  
- Muscle activation detection (onset/offset)  
- Feature extraction from EMG and FMG  
- Dataset construction
- Model fitting and evaluation in MATLAB Classification Learner (interactive)
  - 5-fold cross-validation for training and hyperparameter optimization  
  - Testing on a separate hold-out dataset (80/20 split)  
  - Model comparison based on performance metrics (accuracy, F1 score, ROC-AUC), as well as confusion matrix and ROC curve analysis

The data was collected under controlled conditions from 3 subjects, each performing 5 hand gestures: open, close, ok, pinch, and point.  

The dataset construction process is deterministic: given the same input data, identical datasets are generated across runs.

## Repository navigation
- `build_dataset.m` — main script for dataset construction  
- `src/` — auxiliary functions used by `build_dataset.m`  
- `data/raw/` — raw EMG/FMG recordings (txt, h5)  
- `data/processed/` — generated datasets  
- `results/` — model artifacts (Classification Learner sessions and CSV exports)  
- `docs/` — report and publication materials

## Getting started
Run `build_dataset.m` to generate the dataset, then load it into the MATLAB Classification Learner app to train models and assess their performance.

## Limitations
- Model training is interactive and not fully reproducible from code.
- The dataset is based on a limited number of subjects.

## Future work
- Add detailed hardware and data acquisition documentation
- Improve reproducibility of the the MATLAB Classification Learner workflow
- Explore more discriminative features for EMG and FMG signals
