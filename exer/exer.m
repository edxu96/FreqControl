addpath('~/GitHub/FreqControl/src')
clear; clc

inertia = 100;
tStep = 0;  % time when the step occurs
c = 2;  % friction factor
torqueDriveSet = 314;

resultSim_1 = sim('modLoad_1', 'StartTime', '0', 'StopTime', '300', ...
  'FixedStep', '5');

% % resultSim_2 = sim('modLoad_2', 'StartTime', '0', 'StopTime', '300', ...
% %   'FixedStep', '5');

figure(1)
plot(resultSim_1.omega.time, ...
  (resultSim_1.omega.signals.values) / (2 * pi) * 60) 
xlabel('Time [s]');
ylabel('Rotational Speed [rpm]')

figure(2)
plot(resultSim_2.omega.time, ...
  (resultSim_2.omega.signals.values) / (2 * pi) * 60) 
xlabel('Time [s]');
ylabel('Rotational Speed [rpm]')