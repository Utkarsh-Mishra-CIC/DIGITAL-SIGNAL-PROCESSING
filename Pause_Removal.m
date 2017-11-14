%Program to remove silences from speech recording
clc;
clear all;
prompt = 'What Is The Time Limit Of Your Recording ? ';
n = input(prompt);    %Input The Value Of n
recObj = audiorecorder;
disp('Start speaking.')
recordblocking(recObj,n);   %Record Your Audio (Say The Digits )
disp('End of Recording.');
y = getaudiodata(recObj);
figure(1)
subplot(211),plot(y);
title('Recorded Audio Plot')
sound(y,8000)  % Sample Rate or Fs = 8000, as it is the default Fs of audiorecorder
pause(n+1);   % A n+1 Seconds Pause To Hear Your Recorded Data
%Wait a Couple Of Seconds And The silence removed output will appear
f_duration=0.2;   %Frame Duration set to 0.2 Sec
f_len=f_duration*8000; %8000 = Fs
N=length(y); 
number_f = floor(N/f_len);
%We will divide our signal into frames, whose number is given by the
%variable number_f (number of frames) and the division is done using f_len(frame length)
%forloop for above procedure
voice_2 = zeros(N,1);
c = 0;
for j = 1 : number_f
    %Extracting the frames
    %Example : Frame 1 Will Be From 0+1 : frame_length*1
    %Similarly, Frame 2 Will Be From (1*frame_lenth)+1 : frame_length*2
    %And So on.
    frame = y((j-1)*f_len + 1: f_len*j);
    max_Fval = max(frame);  
    %To compute the maximum value (or frequncy) present in the Frame 
    if(max_Fval>0.1)
        %0.1 Is a Parameter To Determine Whether The Frame contains data or
        %not
        c = c +1;
        voice_2( (c - 1)*f_len + 1 : f_len*c)=frame;
        %Adding Frame In voice_2
    end
end
figure(1)
subplot(212),plot(voice_2); % Plotting signal without non voice segments
title('Audio After Processing!')
sound(voice_2,8000);

