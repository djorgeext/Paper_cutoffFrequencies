edad = load('edad_semana.txt');
[edad,I] = sort(edad);
lf_vlf = load('LF_VLF.txt'); lf_vlf = lf_vlf(I);

y = zeros(length(edad),1); y(39:164) = 0.7872;
xcord = [edad(39) edad(39)];
ycord = [0.07 0.7872];
xcord1 = [edad(164) edad(164)];
ycord1 = [0.7872 0.07];
figure, plot(log10(edad), log10(lf_vlf), 'ok', 'MarkerSize', 12, 'MarkerFaceColor','black');
hold on
plot(log10(edad),log10(y), 'k', LineWidth=5);
plot(log10(xcord),log10(ycord), 'k', LineWidth=5);
plot(log10(xcord1),log10(ycord1), 'k', LineWidth=5);
ylabel('$\mathrm{log}_{10}(\mathrm{LF/VLF})$','Interpreter','latex');
xlabel('$\mathrm{log}_{10}\mathrm{Age}$',Interpreter='latex');
set(gca, 'FontSize', 42);
set(gca, 'LineWidth', 4);
xlim([1.4 3.8])
ylim([-1.6 0.5])