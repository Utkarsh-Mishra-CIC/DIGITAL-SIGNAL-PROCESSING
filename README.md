# Digital_Signal_Processing (MATLAB)



## Pause_Removal.m

Run the code, enter the duration till which you want to record(n). After start speaking is displayed, speak 1-10 (or till any limit you want) with some pauses. After the voice has been recorded for ‘n’ seconds, your audio playback will start and a graph depicting your audio will be plotted. After the playback is completed, the new audio signal with pause removed will be plotted and the playback will start (without silence).  

## Noise_Remover_Cos_Signal.m

The code already contains a noisy cosine signal with noise added through Gaussian Noise. (5 White Gaussian Noise in code). The noise can be changed in the equation “x = awgn(y,5,'measured')”. First 
subplot of figure 1 depicts the noisy signal and the 2nd subplot depicts the noise removed signal. X_mags computes the magnitude spectrum of the signal or otherwise the absolute Fourier transform of the signal. Now, figure 2 is generated which depicts the normalized frequencies of the DFT (Discrete Fourier Transform) plotted against the magnitude. This helps us to determine the cut-off frequency for our Butterworth Filter i.e. the value of Wn. Since it’s a 20th order filter, so n=20. Using the filter command subplot 2 of figure 1 is generated which is the noise removed signal or wave.