% este script obtiene la forma final del Histograma del espectro de
% potencia
% en las variables freq y amp cargo los vectores de frecuencia y amplitud respectivamente
%% 
freq = load('vector_de_frecuencias.txt');
amp = load('vector_de_amplitudes.txt');


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
bins=(0:0.01:2)';                                  % está equiespaciada a 0.01, se crea un vector bins que definirá los bordes de cada pico en el eje frecuencial      
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
figure, bar(x,amp_fin)
ylabel('Peak distribution normalized (Hz^-1)')
xlabel('Frequency (Hz)')

%% 
% Buscar las medias y desvíos estándar de las bandas de frecuencia con la
% aplicación curve fitting
%devuelve en fitresult una estructura con los parámetros de las tres gaussianas
%%%%%%%%%%% Con los parámetros de las 3 gaussianas voy a encontrar las
%%%%%%%%%%% cut-off de cada banda de frecuncia (VLF, LF y HF), para esto se
%%%%%%%%%%% igualan las ecuaciones de las gaussianas de VLFcon LF, LF con
%%%%%%%%%%% HF y se llega a dos polinomios cuadrados, con lo cual sus
%%%%%%%%%%% raíces positivas serán las cut-off
% ccoef = zeros(3,1); b = zeros(3,1);
% b(1,1) = fitresult.b1; ccoef(1,1) = fitresult.c1; b(2,1) = fitresult.b2; ccoef(2,1) = fitresult.c2; b(3,1) = fitresult.b3; ccoef(3,1) = fitresult.c3;
% [b,I] = sort(b);
% ccoef = ccoef(I);
save fittedmodel.mat fittedmodel;
save goodness.mat goodness;
save Metodos_ajuste.mat output;

b1 = fittedmodel.b1; c1 = fittedmodel.c1; b2 = fittedmodel.b2; c2 = fittedmodel.c2; b3 = fittedmodel.b3; c3 = fittedmodel.c3;

m1 = 1/(c1^2) - 1/(c2^2);
n1 = b2/((c2^2)/2) - b1/((c1^2)/2);
p1 = (b1^2)/(c1^2) - (b2^2)/(c2^2) - log(c2/c1);

VLF_cut_off = max(roots([m1 n1 p1]));

m2 = 1/(c2^2) - 1/(c3^2);
n2 = b3/((c3^2)/2) - b2/((c2^2)/2);
p2 = (b2^2)/(c2^2) - (b3^2)/(c3^2) - log(c3/c2);

LF_cut_off = min(roots([m2 n2 p2]));

HF_cut_off = b3 + 3*(c3/sqrt(2));    % HF cut-off según el paper se define como la media + 3*(desvío estándar)
Sdeviations = ([c1; c2; c3])/sqrt(2);

Cut_offF = [VLF_cut_off;LF_cut_off;HF_cut_off];
Medias = [b1; b2; b3];
Gaussianas = [Medias Sdeviations];
%% 
save ("Cut_offF.txt","Cut_offF","-ascii");
save ("Gaussianas.txt","Gaussianas","-ascii");