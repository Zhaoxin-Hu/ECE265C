```matlab
clc
clf
close all

load('HW3_waveforms')
% t = t(1:1000);
% vIN = vIN(1:1000);
% vL = vL(1:1000);
len = length(t);
omega_IF = 2*pi*103.68e6;
% analytic signals
vINa = hilbert(vIN);
vLa = hilbert(vL);
% equivalent baseband signals
vIN_bb = vINa.*exp(-1i*omega_IF*t);
vL_bb = vLa.*exp(-1i*omega_IF*t);
% short-term average power
pIN = abs(vIN_bb).^2/(2*50);
pL = abs(vL_bb).^2/(2*50);
pIN_dBm = 30+pow2db(pIN);
pL_dBm = 30+pow2db(pL);
% peak of short-term average power
pIN_max = max(pIN);
pL_max = max(pL);
pIN_min = min(pIN);
pL_min = min(pL);
pIN_min_dBm = 30+pow2db(pIN_min);
pIN_max_dBm = 30+pow2db(pIN_max);
pL_min_dBm = 30+pow2db(pL_min);
pL_max_dBm = 30+pow2db(pL_max);
% average of short-term average powers
% version 1: average the Watt power, then convert to dBm
disp('averager power version 1')
pIN_avg = mean(pIN);
pL_avg = mean(pL);
pIN_avg_dBm = 30+pow2db(pIN_avg);
pL_avg_dBm = 30+pow2db(pL_avg);
disp(['P_IN_avg = ', num2str(pIN_avg_dBm)])
disp(['P_L_avg = ', num2str(pL_avg_dBm)])
% version 2: average the dBm power
% disp('averager power version 2')
% pIN_dBm_avg = mean(pIN_dBm);
% pL_dBm_avg = mean(pL_dBm);
% disp(['P_IN_avg = ', num2str(pIN_dBm_avg)])
% disp(['P_L_avg = ', num2str(pL_dBm_avg)])
% estimated pdf
edges = [-14:0.2:4];
figure()
histogram(pIN_dBm, edges, 'Normalization','probability')
xlabel('P_{in} (dBm)')
ylabel('Probability')
title('Probability Distribution of P_{in}')
edges = [13:0.2:35];
figure()
histogram(pL_dBm, edges, 'Normalization','probability')
xlabel('P_{L} (dBm)')
ylabel('Probability')
title('Probability Distribution of P_{L}')
% instantaneous PA gain
gain = pL_dBm - pIN_dBm;
% average PA gain
gain_avg = pL_avg_dBm - pIN_avg_dBm;
% plot gain
figure()
plot(pIN_dBm, gain, '-ro')
hold on
plot(pIN_dBm, gain_avg*ones(len,1), 'k')
hold off
xlabel('P_{IN} (dBm)')
ylabel('Gain (dB)')
title('PA Gain vs Input Power and Average Gain')
legend('PA Gain vs Input Power', 'Average Gain')
% plot phase distortion
figure()
plot(abs(vIN_bb), rad2deg(angle(vL_bb./vIN_bb)))
xlabel('v_{IN} (mag)')
ylabel('phase distortion (deg)')
title('AM-PM')
```
