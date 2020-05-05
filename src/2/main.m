
%%
load Pitch_initial
load MPPT_Table.txt

%% Units data
Pn_units = [400 400 200] * 10^6; % nominal power of the units [W]
Iconv_units = [16 16 8]; % Inertia of conventional units!

%% Wind turbines data
Pn_wt = 5 * 10^6;   % wind turbine nominal power [W]
Npp = 2;            % number of pole pairs  ???
Ngear = 99.2;  % gear ratio
Diam = 126;
R = Diam / 2;
I_rotor = 35444067;
I_gen = 534;

% Pitch Control Data
Kp = 2;
Ti = 2.2;

% Maximum and Minimum pitch
pitch_max = 30;
pitch_min = 0;

% Maximum and Minimum pitch rate
pitch_rate_max = 10;
pitch_rate_min = -10;

Tservo = 0.3;

Power_wt0 = 500 * 10^6;

Nwt = 100;  % number of wind turbines

%% Power system data
fn = 50; % hz
D = 0.4; % pu

droop = 0.04;
TCH = 5; %s
Kp = 2;
Ki = 0.2;

%% Initial conditions
PL0 = 1080 * 10^6;
wind_init = 15.1;  % initial wind speed
Pbase_wt = Pn_wt;
% initial system load [W] % initial wind speed [m/s]
% Base for the individual wind turbine [W]
Pref = [0.4 0.4 0.65] .* Pn_units;

%%
pitch_init_num = interp1( pitch_initial(:,1), pitch_initial(:,2), wind_init);

%%
Pbase_ps = sum(Pn_units);

Kwt2pu = Nwt / Pbase_ps;
online = [1 1 1];
Konline = sum(online .* Pn_units) / Pbase_ps;

Iwf_pu_ps = Iwf_pu * Pn_units(8) / Pbase_ps; % Iwf_pu individual wind turbine base
del_Plost = Pref_4567/Pbase_ps;

%% Calculation of M without wind farm
M = sum(online .* Iconv_units .* Pn_units(1:7)) / Pbase_ps + 0 * Iwf_pu_ps;
Nwt = 0;
Kwt2pu = Nwt / Pbase_ps;

%%
M = sum(online.*Iconv_units.*Pn_units(1:7))/Pbase_ps+2*Iwf_pu_ps
Nwt = 2 * Pn_units(8) / Pn_wt;
Kwt2pu = Nwt / Pbase_ps;
