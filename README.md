# EMG–FMG Gesture Recognition

Proof of Concept · Capstone Project (BSc in Biomedical Engineering)

Integration of electromyography (EMG) and force myography (FMG) signals for low-cost prosthetic hand control.  
Developed by Nuno Lourenço Pires — supervised by Milton P. Macedo, PhD (University of Coimbra).

----
Overview  
This repository presents a proof-of-concept system combining EMG and FMG signals from forearm muscle groups to recognize hand gestures for prosthetic control.  
The work validates the feasibility of a low-cost bimodal biosignal interface using BITalino and FSR-402 sensors, implemented in MATLAB.

Features  
- Acquisition of synchronized EMG and FMG signals  
- Signal conditioning circuit (LM358 amplifier)  
- MATLAB-based preprocessing and classification pipeline  
- Evaluation across 30+ classifiers (Quadratic SVM ≈ 88% accuracy)  
- Open documentation (report and peer-reviewed Signals paper)

Results  
- Best model: Quadratic SVM (~88% accuracy)  
- ~13 pp improvement over EMG-only  
- Dataset: 5 gestures × 3 subjects × multiple repetitions

Citation  
Pires, N. M. L.; Macedo, M. P. (2025).  
A Bimodal EMG/FMG System Using Machine Learning Techniques for Gesture Recognition Optimization.  
Signals, 6(8), 1–13. DOI:10.3390/signals06000008

License  
MIT License — see LICENSE file.

Author  
Nuno Lourenço Pires  
Biomedical Engineer | Viana do Castelo, Portugal  
LinkedIn: https://linkedin.com/in/nuno-lourenco-pires  

## 📄 Published Paper
This project led to a peer-reviewed publication in the open-access journal *Signals* (MDPI):

**Pires, N. M. L.; Macedo, M. P. (2025).**  
*A Bimodal EMG/FMG System Using Machine Learning Techniques for Gesture Recognition Optimization.*  
**Signals**, 6(8), 1–13.  
[DOI:10.3390/signals06000008](https://doi.org/10.3390/signals6010008)

➡️ [Download PDF](docs/Signals_Paper.pdf)
