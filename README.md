# OFDM Wireless System Simulation

## Project Overview

This project implements an Orthogonal Frequency Division Multiplexing (OFDM) wireless communication system using MATLAB/Octave. The simulator evaluates Bit Error Rate (BER) performance under different Signal-to-Noise Ratio (SNR) conditions and demonstrates core concepts used in LTE and 5G physical layer communication systems.

## Features

* Random Bit Generation
* QPSK Modulation/Demodulation
* OFDM Transmission using IFFT
* Cyclic Prefix Insertion and Removal
* AWGN Channel Modeling
* FFT-Based Receiver Processing
* BER Performance Evaluation

## Communication Chain

Random Bits → QPSK → IFFT → Cyclic Prefix → AWGN Channel → Remove CP → FFT → QPSK Demodulation → BER Calculation

## Technologies

* MATLAB
* GNU Octave
* Digital Signal Processing
* Wireless Communication

## Results

The simulation demonstrates that BER decreases as SNR increases, validating the robustness of OFDM transmission in noisy wireless environments.

## Applications

* LTE Networks
* 5G NR Systems
* Software Defined Radio
* Wireless PHY Layer Research

## Future Enhancements

* Rayleigh Fading Channel
* MIMO-OFDM
* 16-QAM and 64-QAM Modulation
* Channel Estimation Techniques
* 5G Link-Level Simulation

## Author

Sri Harshini S
Electronics and Communication Engineering
