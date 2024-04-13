nacidos_edad = load('nacidos_edad.txt');
nacidos_RRprom = load('nacidos_RRprom.txt');
nacidos_STD = load('nacidos_STD.txt');

noNatos_semana = load('noNatos_semana.txt');
noNatos_RRprom = load('noNatos_RRprom.txt');
noNatos_STD = load('noNatos_STD.txt');

% save("STDfittedmodel.mat","STDfittedmodel","-mat")
% save("STDgoodness.mat","STDgoodness","-mat")
% save("STDoutput.mat","STDoutput","-mat")

figure,plot(log10(nacidos_edad),log10(nacidos_RRprom), 'o', LineWidth=4)
hold on
plot(log10(noNatos_semana),log10(noNatos_RRprom), '*', LineWidth=4)
plot(fittedmodel, "predobs", 0.9)

ylabel('$SD$',Interpreter='latex');
xlabel('$Age$',Interpreter='latex');
set(gca, 'FontSize', 42);
set(gca, 'LineWidth', 4);
%xlim([0 0.8])