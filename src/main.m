addpath('~/GitHub/FreqControl/src')
clear; clc

KOnline =
TCH =
dP =
Kp =
Ki =
M =
D =
R =

resultSim = sim('modLoad_1', 'StartTime', '-50', 'StopTime', '150', ...
  'FixedStep', '5');
  
figure(1)
plot(resultSim.d_omega.time, ...
  (resultSim.d_omega.signals.values) / (2 * pi) * 60)
xlabel('Time [s]');
ylabel('Rotational Speed [rpm]')
