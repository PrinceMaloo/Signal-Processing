% Define the sampling frequency
Fs = 16000; % in Hz and we can change as our requirment 

% Define the duration of the recording
duration = 10; % in seconds

% Initialize the audio recording object
recObj = audiorecorder(Fs, 16, 1);

% Record the audio for the specified duration
recordblocking(recObj, duration);

% Get the audio data from the recording object
audioData = getaudiodata(recObj);

% Plot the waveform of the recorded audio
plot(audioData);
xlabel('Time (samples)'); % x-axis denoting the time axis 
ylabel('Amplitude'); % y-axis denoting the Amplitude axis 
title('Recorded Audio');

% Play the recorded audio
sound(audioData, Fs);

% Save the audio file
audiowrite('recorded_audio.wav', audioData, Fs);  % address of recorded audio 
