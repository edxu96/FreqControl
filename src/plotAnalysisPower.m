function plotAnalysisPower(vecXx, vecYy, strTitle, strFileName)
%% Plot response of mechanical power in dynamic simulation
figure()
h1 = plot(vecXx, vecYy, 'color', 'r');
hold on
grid on
pbaspect([2 1 1])

%% Plot
[yMax, iMax] = max(vecYy);
xMax = vecXx(iMax);
txt = sprintf(' overshoot maximum value \n x = %.2f, y = %.2f', xMax, yMax);
text(xMax, yMax - 20, txt);

%% Plot the new steady state
ySteady = vecYy(end);
h2 = plot([-50, 150], [ySteady ySteady], 'b--');
txt = sprintf('new steady state %.2f', ySteady);
text(35, ySteady + (ySteady) * 0.05, txt);

%% Plot the 5% error band around the new the steady state value
% h3 = plot([-50, 150], ...
%   [ySteady + (ySteady) * 0.05, ySteady + (ySteady) * 0.05], 'k:');
% plot([-50, 150], ...
%   [ySteady - (ySteady) * 0.05, ySteady - (ySteady) * 0.05], 'k:');

%% Plot the settling point
% iSettle = find(abs(vecYy - ySteady) >= 0.00000001, 1, 'last');
% xSettle = vecXx(iSettle);
% plot([xSettle xSettle], ...
%   [ySteady + (ySteady) * 0.2, ySteady - (ySteady) * 0.2], 'k');
% txt = sprintf(' settling point \n x = %.2f, y = %.2f', ...
%   xSettle, ySteady - (ySteady) * 0.05);
% text(xSettle, ySteady - (ySteady) * 0.2, txt);

xSettle = vecXx(7688);
txt = sprintf(' settling point \n x = %.2f, y = %.2f', ...
  xSettle, ySteady);
plot([xSettle xSettle], ...
  [ySteady + 20, ySteady - 20], 'k');
text(xSettle, ySteady - 50, txt);


%% Decorations
% legend([h1 h2 h3], {'Simulation Result', 'Theoretical New Steady State', ...
%   '10% Error Band'}, 'Location', 'southeast');
legend([h1 h2], {'Simulation Result', 'New Steady State in Simulation Result'}, 'Location', 'southeast');
xlabel('Time [sec]');
ylabel('\Delta Pmech [N m]');
xlim([-5 50]);
ylim([0 600]);
title(strTitle);

hold off
saveas(h1, [strFileName, '.png']);

end
