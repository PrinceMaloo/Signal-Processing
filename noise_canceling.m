% Load the recorded audio file
filename = 'E:\snsReport\audio_sen4_16000.wav'; % insert the address of audio file 
[y, fs] = audioread(filename);

% Plot the original waveform
t = (0:length(y)-1)/fs;
figure;
subplot(2,1,1);
plot(t, y);
title('Original Audio');

% Apply a lowpass filter to remove high-frequency noise
fc = 7000; % cutoff frequency, all noises above the cutoff frequency will be cancelled 
[b, a] = butter(4, fc/(fs/2), 'low');
y_filtered = filter(b, a, y);

% Plot the filtered waveform
subplot(2,1,2);
plot(t, y_filtered);
title('Filtered Audio');

% Save the filtered audio file
audiowrite('filtered_audio.wav', y_filtered, fs);   % address of filtered audio file 
