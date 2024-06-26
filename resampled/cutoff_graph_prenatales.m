r01 = load("Resampled13_65_r01.txt"); r01 = (r01-mean(r01))/std(r01); r01 = paddata(r01,4096);
r04 = load("Resampled13_65_r04.txt"); r04 = (r04-mean(r04))/std(r04); r04 = paddata(r04,4096);
r07 = load("Resampled13_65_r07.txt"); r07 = (r07-mean(r07))/std(r07); r07 = paddata(r07,4096);
r08 = load("Resampled13_65_r08.txt"); r08 = (r08-mean(r08))/std(r08); r08 = paddata(r08,4096);
r10 = load("Resampled13_65_r10.txt"); r10 = (r10-mean(r10))/std(r10); r10 = paddata(r10,4096);

spr01 = pwelch(r01,4096);
spr04 = pwelch(r04,4096);
spr07 = pwelch(r07,4096);
spr08 = pwelch(r08,4096);
spr10 = pwelch(r10,4096);
spmean = (spr10 + spr08 + spr07 + spr04 + spr01)/5;
spmean = spmean/sum(spmean);
f = linspace(0,6.839945280437757,2049)';
f = f(1:301);
spmean = spmean(1:301);

%% 
freq = f;
amp = spmean;


freq_m=[];              % en freq_m se guardan las frecuencias de distinto valor debido a que muchas se repiten
amp_m=[];              % en amp_m se guardan los promedios de las amplitudes de todos los picos de igual frecuencia
i=1;
while i<=length(freq)
    c=find(freq==freq(i));
    amp_m=[amp_m; mean(amp(c))];
    freq_m=[freq_m; freq(i)];
    i=c(end)+1;
end
% se normalizan las amplitudes

amp_m=amp_m/sqrt((sum(amp_m))); % teniendo en cuenta el histograma del paper https://doi.org/10.3389/fphys.2018.01001 figura 2, donde cada barra           
bins=(0:0.01:1)';                                  % está equiespaciada a 0.01, se crea un vector bins que definirá los bordes de cada pico en el eje frecuencial      
amp_fin=[];                                          % y amp_fin tendrá las amplitudes de este último gráfico

j=1;
while j<=(length(bins)-1)
    d=find(freq_m>bins(j) & freq_m<=bins(j+1));
    amp_fin=[amp_fin;sum(amp_m(d))];
    j=j+1;
end

t=13.653333333333332/2;              %(load('frecuencia_remuestreo.txt'))
t=t/2049;
amp_fin=(amp_fin*t)/0.01;
x=(0.01:0.01:1)';
amp_fin = amp_fin(1:100);

%%
x1 = (0:0.001:1)';
y1 = zeros(length(x1),1); y2 = y1; y3 = y1;

load("fittedmodel.mat")
a1 = fittedmodel.a1; b1 = fittedmodel.b1; c1 = fittedmodel.c1;
a2 = fittedmodel.a2; b2 = fittedmodel.b2; c2 = fittedmodel.c2;
a3 = fittedmodel.a3; b3 = fittedmodel.b3; c3 = fittedmodel.c3;

for i=1:length(x1)
    y1(i) = a1*exp(-((x1(i) - b1)/c1).^2);
    y2(i) = a2*exp(-((x1(i) - b2)/c2).^2);
    y3(i) = a3*exp(-((x1(i) - b3)/c3).^2);
end

cutoff = zeros(3,1);

m1 = c2^2 - c1^2;
n1 = 2*(b2*c1^2 - b1*c2^2);
p1 = (b1^2)*c2^2 - (b2^2)*c1^2 - (c1^2)*(c2^2)*log(a1/a2);

VLF_cut_off = max(roots([m1 n1 p1]));

m2 = c3^2 - c2^2;
n2 = 2*(b3*c2^2 - b2*c3^2);
p2 = (b2^2)*c3^2 - (b3^2)*c2^2 - (c2^2)*(c3^2)*log(a2/a3);

LF_cut_off = max(roots([m2 n2 p2]));

cutoff(1) = VLF_cut_off; cutoff(2) = LF_cut_off; % correccion del calculo de las cutoff
cutoff(3) = fittedmodel.b3+3*((fittedmodel.c3)/sqrt(2));
ilim = int32(100 * round(LF_cut_off,2));
slim = int32(100*round(cutoff(3),2));
hfarea = (sum(amp_fin(ilim:slim)))/sum(amp_fin(1:slim));
hfarea = hfarea * 100

%save("Cut_offF.txt","cutoff","-ascii");

bar(x,amp_fin,LineWidth=4,BarWidth=1)
hold on;
plot(x1, y1, LineWidth=4);
plot(x1, y2, LineWidth=4);
plot(x1, y3, LineWidth=4);
grid on
line([VLF_cut_off,VLF_cut_off], [0, max(amp_fin)*1.05], 'Color', 'k', 'LineStyle', '--', LineWidth=6);
line([LF_cut_off,LF_cut_off], [0, max(amp_fin)*1.05], 'Color', 'k', 'LineStyle', '--', LineWidth=6);
line([cutoff(3),cutoff(3)], [0, max(amp_fin)*1.05], 'Color', 'k', 'LineStyle', '--', LineWidth=6);
title('a')
ylabel('$\mathrm{PSD (Hz^{-1})}$',Interpreter='latex');
xlabel('$\mathrm{f (Hz)}$',Interpreter='latex');
set(gca, 'FontSize', 42);
set(gca, 'LineWidth', 4);
xlim([0 0.8])

%%
Cut_offF = load("Cut_offF.txt");
ilim = int32(100*round(Cut_offF(1),2));
slim = int32(100*round(Cut_offF(2),2));
hlim = int32(100*round(Cut_offF(3),2));
VLF_area = (sum(amp_fin(1:ilim)))/sum(amp_fin(1:hlim));
LF_area = (sum(amp_fin((ilim+1):slim)))/sum(amp_fin(1:hlim));
HF_area = (sum(amp_fin((slim+1):hlim)))/sum(amp_fin(1:hlim));
hf_lf = (sum(amp_fin((slim+1):hlim)))/sum(amp_fin((ilim+1):slim));
VLF_area = VLF_area*100;
LF_area = LF_area*100;
HF_area = HF_area*100;

% save("VLF_area.txt", "VLF_area","-ascii")
% save("LF_area.txt", "LF_area","-ascii")
% save("HF_area.txt", "HF_area","-ascii")
% save("HF_LF.txt", "hf_lf","-ascii")