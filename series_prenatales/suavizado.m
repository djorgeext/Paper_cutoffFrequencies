sp_prom22_23_25 = (sp_s23+sp_s25)/2;
sp_prom38_40_r = (sp_r10+sp_r08+sp_r07+sp_r04+sp_r01)/5;  %sp_s38+sp_s40+

% save("sp_prom_r.txt", "sp_prom38_40_r","-ascii")
% save("sp_prom22_23_25.txt","sp_prom22_23_25","-ascii")

sp_prom23_25filtered = movmean(sp_prom22_23_25,2);
sp_prom38_40_rfiltered = movmean(sp_prom38_40_r,2);
%log10(f), log10(sp_prom23_25filtered), 
plot(log10(f), log10(sp_prom23_25filtered), log10(f), log10(sp_prom38_40_rfiltered), log10(f), log10(sp_s40), 'LineWidth',4)
set(gca, 'FontSize', 42); % Establece el tamaño de fuente en 14 puntos
set(gca, 'LineWidth', 4.5); % Establece el grosor de los ejes en 2 puntos
legend('sp sem(22-25)','sp sem(38-40 y r_s)')
save("sp_prom_r.txt", "sp_prom38_40_r","-ascii")
save("sp_prom_r_mmovil.txt", "sp_prom38_40_rfiltered","-ascii")