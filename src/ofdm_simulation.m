clc;
clear;
close all;

%% Parameters
N = 64;                  % Number of subcarriers
cp_len = 16;             % Cyclic Prefix Length
numSymbols = 1000;       % Number of OFDM symbols
snr = 0:2:20;            % SNR range in dB

ber = zeros(size(snr));

for k = 1:length(snr)

    %% Generate Random Bits
    bits = randi([0 1], 2*N*numSymbols, 1);

    %% QPSK Modulation
    bitPairs = reshape(bits, 2, [])';

    qpskSymbols = (2*bitPairs(:,1)-1) + ...
                  1j*(2*bitPairs(:,2)-1);

    qpskSymbols = qpskSymbols / sqrt(2);

    %% OFDM Modulation
    txData = reshape(qpskSymbols, N, []);

    ifftData = ifft(txData, N);

    cp = ifftData(end-cp_len+1:end, :);

    ofdmSignal = [cp; ifftData];

    tx = ofdmSignal(:);

    %% Manual AWGN Channel
    signal_power = mean(abs(tx).^2);

    snr_linear = 10^(snr(k)/10);

    noise_power = signal_power / snr_linear;

    noise = sqrt(noise_power/2) * ...
           (randn(size(tx)) + 1j*randn(size(tx)));

    rx = tx + noise;

    %% Receiver
    rxMatrix = reshape(rx, N+cp_len, []);

    % Remove Cyclic Prefix
    rxMatrix = rxMatrix(cp_len+1:end, :);

    % FFT
    fftData = fft(rxMatrix, N);

    receivedSymbols = fftData(:);

    %% QPSK Demodulation
    rxBits = zeros(length(receivedSymbols)*2,1);

    rxBits(1:2:end) = real(receivedSymbols) > 0;
    rxBits(2:2:end) = imag(receivedSymbols) > 0;

    %% BER Calculation
    errors = sum(bits ~= rxBits);

    ber(k) = errors / length(bits);

end

%% BER Plot
figure;
semilogy(snr, ber, '-o', 'LineWidth', 2);

grid on;
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('OFDM System BER Performance over AWGN Channel');

%% Display BER Values
disp('SNR(dB)    BER');
disp([snr' ber']);
