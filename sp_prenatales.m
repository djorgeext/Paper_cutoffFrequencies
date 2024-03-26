r01 = load("r01.txt");
r04 = load("r04.txt");
r07 = load("r07.txt");
r08 = load("r08.txt");
r10 = load("r10.txt");
sp_r01 = espectro(r01,1024);
sp_r04 = espectro(r04,1024);
sp_r07 = espectro(r07,1024);
sp_r08 = espectro(r08,1024);
sp_r10 = espectro(r10,1024);
sp_prom = (sp_r10 + sp_r08 + sp_r07 + sp_r04 + sp_r01)/5;
save("sp_r01.txt","sp_r01", "-ascii")
save("sp_r04.txt","sp_r04", "-ascii")
save("sp_r07.txt","sp_r07", "-ascii")
save("sp_r08.txt","sp_r08", "-ascii")
save("sp_r10.txt","sp_r10", "-ascii")
frec = (1:512)'/1024;
plot(log10(frec(2:end)), log10(sp_prom(2:end)),LineWidth=2)
set(gca, 'FontSize', 16); % Establece el tamaño de fuente en 14 puntos
set(gca, 'LineWidth', 2); % Establece el grosor de los ejes en 2 puntos
xlim ([-2.72 -0.29])