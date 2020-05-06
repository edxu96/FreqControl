
Igen_pu = Igen / Igen_base;
Irot_pu = Irot / Irot_base;
Iwt_pu = Igen_pu + Irot_pu;
% The inertia in per-unit of a wind farm is equal with the inertia in per-unit of
% a wind turbine, when an individual power based is used
% Iwf_pu=Iwf/Iwf_base=(N*Iwt)/(N*Iwt_base)=Iwt_pu
Iwf_pu = Iwt_pu;

%%

Konline = sum(online .* Pn_units) / Pbase_ps;

Iwf_pu_ps = Iwf_pu * Pn_units(8) / Pbase_ps; % Iwf_pu individual wind turbine base
del_Plost = Pref_4567/Pbase_ps;

%% Calculation of M without wind farm

Nwt = 0;
Kwt2pu = Nwt / Pbase_ps;

Kwt2pu = Nwt / Pbase_ps;

%%
M = sum(online.*Iconv_units.*Pn_units(1:7))/Pbase_ps+2*Iwf_pu_ps
Nwt = 2 * Pn_units(8) / Pn_wt;
Kwt2pu = Nwt / Pbase_ps;
