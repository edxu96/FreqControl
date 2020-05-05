function plotAnalysis(vecXx, vecYy, ySteady, strTitle, strFileName)
% Plot frequency response in dynamic simulation

%% Plot figure
figure()
h1 = plot(vecXx, vecYy, 'color', 'r');
hold on
grid on
pbaspect([2 1 1])

%% Plot the minimum value
[yMin, iMin] = min(vecYy);
xMin = vecXx(iMin);
txt = sprintf(' overshoot minimum value \n x = %.2f, y = %.2f', xMin, yMin);
text(xMin, yMin, txt);

%% Plot the new steady state
h2 = plot([-50, 150], [ySteady ySteady], 'b--');
txt = sprintf('new steady state %.2f', ySteady);
text(35, ySteady + 0.1, txt);

%% Plot the 5% error band around the new the steady state value
h3 = plot([-50, 150], ...
  [ySteady + (50 - ySteady) * 0.05, ySteady + (50 - ySteady) * 0.05], 'k:');
plot([-50, 150], ...
  [ySteady - (50 - ySteady) * 0.05, ySteady - (50 - ySteady) * 0.05], 'k:');

%% Plot the settling point
iSettle = find(vecYy - (ySteady - (50 - ySteady) * 0.05) <= 0, 1, 'last');
iSettle
xSettle = vecXx(iSettle);
plot([xSettle xSettle], ...
  [ySteady + (50 - ySteady) * 0.5, ySteady - (50 - ySteady) * 0.5], 'k');
txt = sprintf(' settling point \n x = %.2f, y = %.2f', ...
  xSettle, ySteady - (50 - ySteady) * 0.05);
text(xSettle, ySteady - (50 - ySteady) * 0.5, txt);

%% Decorations
legend([h1 h2 h3], {'Simulation Result', 'Theoretical New Steady State', ...
  '10% Error Band', '10% Error Band'}, 'Location', 'southeast');
xlabel('Time [sec]');
ylabel('Freq. [Hz]');
xlim([-5 50]);
ylim([48 50.4]);
title(strTitle);

hold off
saveas(h1, [strFileName, '.png']);

end
