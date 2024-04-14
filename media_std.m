nacidos_edad = load('nacidos_edad.txt');
[nacidos_edad,I] = sort(nacidos_edad);
nacidos_RRprom = load('nacidos_RRprom.txt');
nacidos_RRprom = nacidos_RRprom(I);
nacidos_STD = load('nacidos_STD.txt');
nacidos_STD = nacidos_STD(I);

noNatos_semana = load('noNatos_semana.txt');
noNatos_RRprom = load('noNatos_RRprom.txt');
noNatos_STD = load('noNatos_STD.txt');
options = fitoptions('poly1', 'Robust', 'Bisquare');
% Ajustar un modelo a los datos
fittedrr = fit(log10(nacidos_edad), log10(nacidos_RRprom), 'poly1', 'Robust','bisquare');
fittedstd = fit(log10(nacidos_edad), log10(nacidos_STD), 'poly1', 'Robust','bisquare');

% save("STDfittedmodel.mat","STDfittedmodel","-mat")
% save("STDgoodness.mat","STDgoodness","-mat")
% save("STDoutput.mat","STDoutput","-mat")
figure, plot(log10(nacidos_edad), log10(nacidos_RRprom), 'ok', 'MarkerSize', 12, 'MarkerFaceColor','none'); % Grafica los datos
hold on
plot(log10(noNatos_semana), log10(noNatos_RRprom),'ok','MarkerSize', 12, 'MarkerFaceColor','black')
h = plot(fittedrr,"predobs", 0.9);
set(h,'Color','k','LineWidth',4)
ylabel('$\mathrm{log}_{10}\mathrm{<RR>}$', 'Interpreter','latex');
xlabel('$\mathrm{log}_{10}\mathrm{Age}$', 'Interpreter', 'latex');
set(gca, 'FontSize', 42);
set(gca, 'LineWidth', 4);
xlim([1.2 2.6])

figure, RR=plot(log10(nacidos_edad), log10(nacidos_STD), 'ok', 'MarkerSize', 12, 'MarkerFaceColor','none'); % Grafica los datos
hold on
plot(log10(noNatos_semana), log10(noNatos_STD), 'ok','MarkerSize', 12, 'MarkerFaceColor','black')
h1 = plot(fittedstd,"predobs", 0.9);
set(h1,'Color','k','LineWidth',4)
xlim([1.24 2.6])
ylabel('$\mathrm{log}_{10}\mathrm{SD}$',Interpreter='latex');
xlabel('$\mathrm{log}_{10}\mathrm{Age}$',Interpreter='latex');
set(gca, 'FontSize', 42);
set(gca, 'LineWidth', 4);
