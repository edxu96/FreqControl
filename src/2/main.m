
%%
load Pitch_initial
load MPPT_Table.txt

%% Thermal Units data
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

Power_wt0 = 500 * 10^6;  % initial wind power output

Nwt = 100;  % number of wind turbines

%% Power system data
fn = 50; % hz
D = 0.4; % pu

droop = 0.04;
TCH = 5; %s
Kp = 2;
Ki = 0.2;

%% Initial conditions
PL0 = 1080 * 10^6;  % Initial system load [W]
wind_init = 15.1;  % initial wind speed
Pbase_wt = Pn_wt;  % norminal wind power per unit


Pref = [0.4 0.4 0.65] .* Pn_units;

%%
pitch_init_num = interp1( pitch_initial(:,1), pitch_initial(:,2), wind_init);

% Nominal tip speed at rated power
v_nom = 79.81; %[m/s]

% Nominal speed of rotor
omega_rotor_nom = v_nom / R;

% Nominal speed of generator
omega_gen_nom = omega_rotor_nom * Ngear;

% Omega Generator Base
omega_gen_base = 2 * pi * fn / Npp;

% Omega Rotor Base
omega_rotor_base = omega_gen_base / Ngear;

% Pu Value of omega generator nominal
omega_gen_nom_pu = omega_gen_nom / omega_gen_base;

% Pu value of nominal rotor speed
omega_rotor_nom_pu = omega_rotor_nom / omega_rotor_base;

omega_gen_base = 125.66;  %???

omega_rotor_base = omega_gen_base / Ngear; 
Igen_base = Pbase_wt / omega_gen_base^2; 
Irot_base = Pbase_wt / omega_rotor_base^2; 

Iechiv = Igen + Irot/Ngear^2;

Iechiv_base = Iechiv / Igen_base;

%%
Pbase_ps = sum(Pn_units);
online = [1 1 1];

% system inertia without wind power per unit
M = (sum(online .* Iconv_units .* Pn_units) + 200e6 * 8) / (Pbase_ps + 200e6);

Nwt = 2 * 200e6 / Pn_wt;  % ???
Kwt2pu = Nwt / Pbase_ps;

%%
SimStartTime = -50; 
SimStopTime = 150;
sim('model')
