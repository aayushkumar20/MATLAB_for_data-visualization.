clear all
close all
clc

% 2D Line Plot
%Provide the Sampling Frequency and Frequency.............
fs = 150;
t = (0+(1/fs)):(1/fs):1;
f = 5;
f1 = 10;

%Generate the Cosine Singnal.................
x = cos(2*pi*f*t) + cos(2*pi*f1*t);
figure, 
plot(t, x), grid on;

%Generate the Sine Singnal.................
x1 = sin(2*pi*f*t) + sin(2*pi*f1*t);
hold on,
plot(t, x1), grid on;
