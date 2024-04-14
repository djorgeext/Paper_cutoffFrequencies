edad = load('edad_gestacional.txt');
[edad,I] = sort(edad);
beta = load('Beta.txt'); beta = beta(I);
edad_2 = load("edad_gestacional_2.txt");
[edad_2,C] = sort(edad_2);
hf_vlf = load('HF_VLF.txt'); hf_vlf = hf_vlf(C);

% Ajustar un modelo a los datos
%fittedbeta = fit(log10(edad(90:end)), beta(90:end), 'poly1');
fittedhf = fit(log10(edad_2(105:end)), log10(hf_vlf(105:end)), 'poly1');
y = zeros(length(edad),1); y(70:110) = 1;


figure, plot(log10(edad), beta, 'ok', 'MarkerSize', 12, 'MarkerFaceColor','black'); % Grafica los datos
hold on
plot(log10(edad(70:110)), y(70:110), 'k', 'LineWidth',6, 'LineStyle','--')
ylabel('$\mathrm{Beta}$', 'Interpreter','latex');
xlabel('$\mathrm{log}_{10}\mathrm{Age}$', 'Interpreter', 'latex');
set(gca, 'FontSize', 42);
set(gca, 'LineWidth', 4);
%xlim([1.2 2.6])

figure, RR=plot(log10(edad_2(105:end)), log10(hf_vlf(105:end)), 'ok', 'MarkerSize', 12, 'MarkerFaceColor','black'); % Grafica los datos
hold on
plot(log10(edad_2(1:104)), log10(hf_vlf(1:104)), 'ok','MarkerSize', 12, 'MarkerFaceColor','black')
h1 = plot(fittedhf,"predobs", 0.9);
set(h1,'Color','k','LineWidth',4)
%xlim([1.24 2.6])
ylabel('$\mathrm{log}_{10}(\mathrm{HF/VLF})$','Interpreter','latex');
xlabel('$\mathrm{log}_{10}\mathrm{Age}$',Interpreter='latex');
set(gca, 'FontSize', 42);
set(gca, 'LineWidth', 4);
