% Load the audio file
[x,Fs] = audioread('E:\snsReport\Mota_Ram\audio_sen_1_16000.wav');% insert the address of audio file 

N = length(x); % counting the length of audio file 
X = zeros(N, 1);
% DFT by using formula 
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + audioData(n+1)*exp(-1i*2*pi*k*n/N); 
    end
end

% Compute the magnitude spectrum of the DFT 
X_mag = abs(X(1:N/2+1));
f = Fs*(0:N/2)/N;

% Plot between the magnitude of DFT and frequency 
plot(f, X_mag);
xlabel('Frequency (Hz)'); % x-axis denoting the frequency 
ylabel('Magnitude'); % y-axis denoting the magnitude of DFT 
title('Magnitude of DFT ');

% Find the frequency corresponding to the maximum magnitude in the DFT
[~, maxIdx] = max(X_mag);
freq = f(maxIdx);

disp(['Fundamental Frequency is: ', num2str(freq), ' Hz']);
