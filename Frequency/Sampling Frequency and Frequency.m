clear all
%close all
clc

%Provide the Sampling Frequency and Frequency.............
fs = 8;
t = (0+(1/fs)):(1/fs):1;
f = 1;
f1 = 10;

%Generate the Cosine Singnal.................
x = sin(2*pi*5*t + (pi/3));
plot(x, '-b', 'LineWidth', 2), grid on;
title('A Stationary Signal', 'FontWeight', 'Bold')
xlabel('Time', 'FontWeight', 'Bold')
ylabel('Amplitude', 'FontWeight', 'Bold')

% Take fft...............
x_fft = abs(fft(x));
% figure,
subplot(2,2,2)
x_feq = 0:1/(fs/2):1-(1/(fs/2));
stem(x_feq, x_fft(1:length(x_fft)/2), '-k', 'LineWidth', 2)
grid on
title('DFT of Stationary Signal', 'FontWeight', 'Bold')
xlabel('Normalized Frequency (One-Side)', 'FontWeight', 'Bold')
ylabel('Fourier Coefficient', 'FontWeight', 'Bold')

%% ..............Generation of Non-Stationary Signal.......
%Select another Sampling Frequency......
fs1 = 1000;
t1 = (0+(1/fs1)):(1/fs1):1;
sig = zeros(1,1000);

%frequency = 5, for first 300 time span.............
fa = 5;
t2 = t1(1,1:300);
sig1 = cos(2*pi*fa*t2);


%frequency = 10, for next 300 time span.............
fb = 50;
t3 = t1(1,301:600);
sig2 = cos(2*pi*fb*t3);

%frequency = 100, for next 200 time span.............
fc = 100;
t4 = t1(1,601:800);
sig3 = cos(2*pi*fc*t4);

%frequency = 250, for last 200 time span.............
fd = 250;
t5 = t1(1,801:1000);
sig4 = cos(2*pi*fd*t5);

sig = [sig1 sig2 sig3 sig4];
% figure,
subplot(2,2,3)
plot(sig, '.-b', 'LineWidth', 2) %Plot the non-stationary signal....
title(['Non-Stationary Signal', ' Freq. = ', num2str(fa), ', ', num2str(fb), ', ', num2str(fc), ', ', '&', ', ', num2str(fd)], 'FontWeight', 'Bold')
xlabel('Time', 'FontWeight', 'Bold')
ylabel('Amplitude', 'FontWeight', 'Bold')

% Take fft...............
sig_fft = abs(fft(sig));
x_feq1 = 0:1/(fs1/2):1-(1/(fs1/2));
% figure,
subplot(2,2,4)
stem(x_feq1, sig_fft(1:length(sig_fft)/2))
grid on
title('DFT of Non-Stationary Signal', 'FontWeight', 'Bold')
xlabel('Normalized Frequency (One-Side)', 'FontWeight', 'Bold')
ylabel('Fourier Coefficient', 'FontWeight', 'Bold')

% STFT 
stft = STFT_fun(sig, 2, 100);
figure,
surf(stft)
xlabel('Frequency in Hz');
ylabel('Time in sec');
zlabel('Amplitude');


