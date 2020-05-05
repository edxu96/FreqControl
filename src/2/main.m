
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
Irot = 35444067;
Igen = 534;

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
% Nominal tip speed at rated power
v_nom = 79.81; %[m/s]

% Nominal speed of rotor

omega_rotor_nom = v_nom / R;

% Nominal speed of generator
omega_gen_nom = omega_rotor_nom * Ngear;

% Base Values

% Omega Generator Base
omega_gen_base = 2 * pi * fn / Npp;
% Result: omega_gen_base = 157.0796 rad/s

% Omega Rotor Base
omega_rotor_base = omega_gen_base / Ngear;
% Result: omega_rotor_base = 1.6362 rad/s

% Pu Value of omega generator nominal
omega_gen_nom_pu = omega_gen_nom / omega_gen_base;
% Result: omega_gen_nom_pu = 1.0695 pu

% Pu value of nominal rotor speed
omega_rotor_nom_pu = omega_rotor_nom / omega_rotor_base;
% Result: omega_rotor_nom_pu = 1.0695 pu





%%
omega_gen_base=2*pi*fn/Npp; 
omega_rotor_base=omega_gen_base/Ngear; 
Igen_base=Pbase_wt/omega_gen_base^2; Irot_base=Pbase_wt/omega_rotor_base^2; 
Igen_pu=Igen/Igen_base;
Irot_pu=Irot/Irot_base; 
Iwt_pu=Igen_pu+Irot_pu;
% The inertia in per-unit of a wind farm is equal with the inertia in per-unit of % a wind turbine, when an individual power based is used
% Iwf_pu=Iwf/Iwf_base=(N*Iwt)/(N*Iwt_base)=Iwt_pu
Iwf_pu=Iwt_pu;

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
