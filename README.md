# PSB: Power System Balancing in MATLAB

## Frequency Control



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
