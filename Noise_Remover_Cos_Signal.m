clc;
clear all;
%Generating A Noisy Cos Signal And Filter It By Butterworth Filter (Low
%Pass) Noise Generation By :- Gaussian Noise
t = 0:0.001:1;
y = cos(2*pi*5*t);
x = awgn(y,5,'measured') ; %Adding 5 White Gaussian Noise
figure(1)
subplot(211),plot(x)
title('Noisy signal')
xlabel('Samples');
ylabel('Amplitude')
 
%Magnitude Spectrum Of The Signal 
X_mags = abs(fft(x));
figure(2)
plot(X_mags)
xlabel('DFT')
ylabel('Magnitude')

%Normalized Frequency Of DFT
num_bins = length(X_mags);
plot([0:1/(num_bins/2 -1):1],X_mags(1:num_bins/2))
xlabel('Normalised Frequency (\pi Rads/Sample)')
ylabel('Magnitude')

%Butterworth Filter With n=20 and Wn=0.2 (According to Normalized Frequency Of DFT)
[B A] = butter(20, 0.2, 'low');
   
LowPass_filter = filter(B,A,x);
figure(1)
subplot(212),plot(LowPass_filter,'r') %Filtered Signal Plot (Red color)
title('Filtered Signal(Using 20th Order Butterworth)')
xlabel('Samples');
ylabel('Amplitude')
 