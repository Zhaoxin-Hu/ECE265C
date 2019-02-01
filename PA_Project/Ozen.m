clc
clf
close all
clearvars

Vmax = 28;
Imax = 2;
gamma_dB = 9;
gamma = 10^(gamma_dB/10);
% vbk = 0:0.01:1;
vbk = 0.23;
M = abs((vbk*sqrt(1-vbk^2)-acos(vbk)))/(1-vbk);
theta = deg2rad(41);

z11 = 1/vbk;
z12 = pi*(vbk-1)/(2*vbk*M);
z21 = z12;
z22 = pi*(2*vbk*M-pi*(vbk-1))/(4*vbk*M^2);
Z2P = Vmax/Imax*[z11, z12; z21, z22];
z22_const = pi*2*vbk*M/(4*vbk*M^2);

% at gamma backoff
left = 0.25*Vmax*abs(Im(1, Imax)+Ia(1, vbk, theta, Imax));
right = 0.25*gamma*Vmax*abs(Im(vbk, Imax));

% plot
% plot(vbk, left)
% hold on
% plot(vbk, right)
% hold off
% legend('left', 'right')

function im = Im(vi, Imax)
im = -1j*vi*Imax/2;
end

function ia = Ia(vi, vbk, theta, Imax)
ia = 1j*Imax*(vbk.*sqrt(1-(vbk./vi).^2)-vi*acos(vbk./vi))./(pi*(1-vbk))*exp(-1j*theta);
end