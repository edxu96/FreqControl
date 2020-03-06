# PSB: Power System Balancing in MATLAB

$$
\begin{align}
  \Delta P_{\text{mech}} - \Delta P_{\text{elec}} = I \omega_0 \mathrm{d} \omega / \mathrm{d} t = M_0 \mathrm{d} f / \mathrm{d} t \\
  \Delta P_{\text{mech, pu}} - \Delta P_{\text{elec, pu}} = M_{0, \text{pu}} \mathrm{d} f_{\text{pu}} / \mathrm{d} t
\end{align}
$$


## Programmatic Model Editing

https://se.mathworks.com/help/simulink/ug/using-the-sim-command.html

https://se.mathworks.com/help/simulink/programmatic-modeling.html?s_tid=CRUX_lftnav

### Set System Parameters

```matlab
set_param('vdp','Solver','ode15s','StopTime','3000')
```

### Add Blocks

```matlab
add_block('simulink/Sources/Step', 'filname/step_1')
add_block('simulink/Continuous/Sine Wave', 'filname/sine_1')
```
