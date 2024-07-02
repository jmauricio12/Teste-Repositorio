clc
close all
clear
N = 20;
f = 1;
fs = 20;
Ts = 1/fs;
n = 0:(N-1);
x = cos(2*pi*f*n*Ts);
figure
stem(n,x,'LineWidth',3)
xlabel('n')
ylabel('x[n]')
grid

%% DFT de x[n]

X = fft(x);
k =0:(N-1);
omega = (2*pi/N)*k;  
fHz = omega*fs/(2*pi);

figure
stem(omega(1:N),abs(X(1:N)),'.','LineWidth',3)
xlabel('\Omega')
ylabel('|X(\Omega)|')
title('Modulo da DFT')
axis([0 7 0 11])
grid

hold on
a = [pi pi 2*pi 2*pi];
b = [0  10 0    10];
stem(a,b,'.--r')
hold off

%% Circulo Unitario 
theta = omega;
rho = abs(X);
figure
%polarplot(angulo,raio)
%hold on
polarplot(theta,rho,'r')
%hold off

angulo = omega*360/(2*pi)

%%
figure
stem(fHz(1:N/2),abs(X(1:N/2)),'.','LineWidth',3)
xlabel('Hz')
ylabel('|X(f)|')
axis([0 11 0 11])
grid

hold on
a = [10 10 ];
b = [0  10 ];
stem(a,b,'.--r')
hold off