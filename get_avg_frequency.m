% This function returns the average frequency amplitudes 
% from the signal data that matches 
% target_freq - 0.5 and target_freq + 0.5
function z = get_avg_frequency(x, Fs, target_freq)
% x is the vector of signal data
% Fs is the sampling frequency of the data 
% target_freq is the frequency of interest

x = detrend(x,0);
xdft = fft(x);
freq = 0:Fs/length(x):Fs/2;

y = fft(x);
ly = length(y)

;
f = (-ly/2:ly/2-1)/ly*Fs;
a = abs(fftshift(y));

x1 = f(f>0); % extract all the positive frequencies
y1 = a(f>0); % get the amplitudes of all the positive frequencies
left = y1(x1 == target_freq - 0.5); % return the amplitudes that match the target_freq - 0.5
right = y1(x1 == target_freq + 0.5); % return the amplitudes that match the target_freq + 0.5
z = (left + right) / 2
end