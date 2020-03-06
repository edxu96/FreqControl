
function [] = init_mod_1()

fic1 = 'filname';
new_system(fic1)



add_block('simulink/Sources/Step','filname/step1')
add_block('simulink/Continuous/Transfer Fcn','filname/syst1')
set_param('filname/step1', 'Position', [10 150 40 180 ] )
set_param('filname/syst1','Denominator','[1000 1]')
add_block('simulink/Sinks/To Workspace','filname/tw1')
set_param('filname/tw1','SaveFormat','array')
set_param('filname/tw1','VariableName','y')
add_line('filname','step1/1','syst1/1');
add_line('filname','syst1/1','tw1/1');
set_param('filname','StopTime','inf')
add_block('simulink/Sources/Clock','filname/tim')
add_block('simulink/Sinks/To Workspace','filname/tw2')
add_line('filname','tim/1','tw2/1');
set_param('filname/tw2', 'Position', [200 350 230 380 ] )
set_param('filname/tw2', 'SaveFormat','array')
set_param('filname/tw2', 'VariableName','t')

end
