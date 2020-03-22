close all, clear, clc

addpath('~/GitHub/FreqControl/src')

Punit=[1100 900 700 600];% Nominal Power
I_pu=[0.28 1.33 1 1.49];% Inertia p.u in system base
Runit=[0.05 0.05 0.05 0.05];% Droop
Pbase=sum(Punit);% power system base in MW
Pset=[660 540 400 400];
kset=[1 1 0 1];%Unit#3 offline
KOnline=sum(kset.*Punit)/Pbase;
PL=sum(Pset)/Pbase;%initial system loading in power system base
D=0.4*PL;%damping
M=sum(kset.*I_pu);% system moment pu in power system base
StartTime=-50;% simulation time
StopTime=900;% simulation time
TCH=2;%prime mover time constant
Kp=20;
Ki=2;
R=0.05;% droop
dP=Pset(3)/Pbase;% load change in MW
fHz=50;

%% Q3 a-e
sim('modPowerSys');
plotAnalysis(del_omega.time, fHz*(1+del_omega.signals.values), 49.62, ...
  'Frequency Response when G3 Trips', 'Q3d')
plotAnalysisPower(del_omega.time, Pbase*del_Pmech.signals.values, 400, ...
  '\Delta Pmech Response when G3 Trips', 'Q3e')

%% Q3 a-e
D = 2 * D;
sim('modPowerSys');
plotAnalysis(del_omega.time, fHz*(1+del_omega.signals.values), 49.62, ...
  'Frequency Response when G3 Trips with Double Inertia', 'Q3f')
D = 0.5 * D;

%% Q3 f-g
M = 2 * M;
sim('modPowerSys');
plotAnalysis(del_omega.time, fHz*(1+del_omega.signals.values), 49.62, ...
  'Frequency Response when G3 Trips with Double Damping', 'Q3g')
M = 0.5 * M;

%% Q3 h
figure()
sim('modPowerSys');
hold on
h = plot(del_omega.time, fHz*(1+del_omega.signals.values),'b');
grid on 
pbaspect([2 1 1])

%
R = 0.02;% droop
sim('modPowerSys'); 
R = 0.05;% droop
plot(del_omega.time, fHz*(1+del_omega.signals.values),'r');

plot([StartTime StopTime], [49.62 49.62],'b--');
plot([StartTime StopTime], [49.85 49.85],'r--');
legend({'droop = 5%', 'droop = 2%', ...
  'theoretical value when droop = 5%', ...
  'theoretical value when droop = 2%'}, 'Location', 'southeast');
xlabel('Time [sec]');
ylabel('Freq. [Hz]');
xlim([-5 50]);
ylim([48 50.4]);
title('Frequency Response with Different Droops When G3 trips');
hold off
saveas(h, 'Q3h.png');

plotAnalysis2(del_omega.time, fHz*(1+del_omega.signals.values), 49.85, ...
  'Frequency Response when G3 Trips', 'Q3h-2')

%%
close all

%% Q3 i j
Iwind_pu = 150*0.02;%Wind farm inertia in pu
Iwind_contribution = Iwind_pu/(Iwind_pu+sum(I_pu));
Mnew=Iwind_pu+sum(I_pu);% angular momentum in p.u with all unit online.

%% Q4 
% Gain_FRP = -0.2;
% Act_time_FRP = 60;%activate aftet 1 min
% sim('Assignment1Q4Model');
% figure('name','Q4a')
% plot(del_omega.time, fHz*(1+del_omega.signals.values),'r')
% hold on
% plot([StartTime StopTime], [50 50],'b--')
% plot([Act_time_FRP Act_time_FRP], ylim,'b--')
% plot([StartTime StopTime], [49.62 49.62],'b--')
% xlabel('Time [sec]'),ylabel('Freq. [Hz]')
% xlim([-20 600])
% title('Frequency Response when Unit#3 Trip at time = 0 [sec] with FRP')
% hold off
% 
% figure('name','Q4b')
% plot(del_omega.time, fHz*(1+del_omega.signals.values),'r')
% hold on
% Act_time_FRP = 1000;%activate time
% sim('Assignment1Q4Model');
% plot(del_omega.time, fHz*(1+del_omega.signals.values),'k')
% plot([StartTime StopTime], [50 50],'b--')
% plot([Act_time_FRP Act_time_FRP], ylim,'b--')
% plot([StartTime StopTime], [49.62 49.62],'b--')
% legend('With FRP','Without FRP')
% xlabel('Time [sec]'),ylabel('Freq. [Hz]')
% xlim([-20 600])
% title('Frequency Response when Unit#3 Trip at time = 0 [sec] with and without FRP')
% hold off
% 
% 
% Act_time_FRP = 60;%activate time
% figure('name','Q4c')
% Gain_FRP = -0.1;
% sim('Assignment1Q4Model');
% plot(del_omega.time, fHz*(1+del_omega.signals.values))
% 
% hold on
% Gain_FRP = -0.2;
% sim('Assignment1Q4Model');
% plot(del_omega.time, fHz*(1+del_omega.signals.values))
% 
% Gain_FRP = -0.3;
% sim('Assignment1Q4Model');
% plot(del_omega.time, fHz*(1+del_omega.signals.values))
% 
% plot([StartTime StopTime], [50 50],'b--')
% plot([Act_time_FRP Act_time_FRP], ylim,'b--')
% plot([StartTime StopTime], [49.62 49.62],'b--')
% legend('Gain FRP = -0.1','Gain FRP = -0.2','Gain FRP = -0.3')
% xlabel('Time [sec]'),ylabel('Freq. [Hz]')
% xlim([-20 600])
% title('Frequency Response when Unit#3 Trip at time = 0 [sec] Gain FRP Comprison')
% hold off