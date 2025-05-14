# 🚗 Radar-Based Longitudinal Motion Estimation using a Generalized High-Gain Observer

This MATLAB project implements a **Generalized High-Gain Observer (GHGO)** for estimating the **longitudinal dynamics** (position, velocity, acceleration) of a vehicle using noisy radar measurements. It is based on the 2024 paper:

> **"Radar Sensor-Based Longitudinal Motion Estimation by Using a Generalized High-Gain Observer"**  
> Bessafa et al., American Control Conference (ACC), 2024.

## 📄 Features

- Estimation of vehicle longitudinal dynamics using radar-based position & speed data
- LMI-based gain design for ISS stability
- CARLA-simulated dataset
- Comparison with standard high-gain observer

## 🧠 Theory

The observer design is based on a generalized high-gain structure that accounts for an additional measurement (speed) and handles noise through a novel LMI formulation ensuring exponential Input-to-State Stability (ISS).

## 📁 File Structure
<pre> RadarObserverEstimation/
    ├── src/ │
    ├── main.m # Main simulation script │
    ├── HighGainObserver.m # Observer implementation │ 
    ├── Proj.m # Projection function (if used) 
    ├── data/ │ 
        ├── Ground_Truth_data.mat │ 
        └── Measurement_data.mat 
    └── README.md </pre>
## ▶️ Getting Started

### Prerequisites

- MATLAB R2020+ (with Optimization Toolbox)
- YALMIP toolbox (https://yalmip.github.io/)
- A solver (e.g., SeDuMi, SDPT3)

### Run Simulation

1. Clone this repo:
    ```bash
    git clone https://github.com/your-username/RadarObserverEstimation.git
    cd RadarObserverEstimation
    ```

2. Open MATLAB and set the path:
    ```matlab
    addpath(genpath('src'))
    ```

3. Run the main file:
    ```matlab
    main
    ```

## 📈 Results

The simulation compares the true state (from CARLA ground truth) with estimated states using the generalized observer, demonstrating:

- High estimation accuracy
- Fast convergence
- Superior noise robustness

## 📝 Citation
@inproceedings{bessafa2024radar,
title={Radar Sensor-Based Longitudinal Motion Estimation by Using a Generalized High-Gain Observer},
author={Bessafa, H. and Belkhatir, Z. and Delattre, C. and others},
booktitle={American Control Conference (ACC)},
year={2024}
}
## 📬 Contact

For questions, reach out to:
- [hichem.bessafa@gmail.com](mailto:hichem.bessafa@gmail.com)
