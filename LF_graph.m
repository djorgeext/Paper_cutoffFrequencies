% Ruta de la carpeta principal
directory = '/home/david/Documents/Paper_cutoffFrequencies/SP';

% Abrir el archivo de texto
archivo = fopen('nombres.txt', 'r');

datos = textscan(archivo, '%s');

% Cerrar el archivo
fclose(archivo);

% Convertir los datos a un vector
datos = cell2struct(datos,'nombres',179);
VLF_area = zeros(179,1);
LF_area = zeros(179,1);
HF_area = zeros(179,1);
hf_lf = zeros(179,1);

% Iterar sobre las carpetas
for i = 1:179
    carpetaActual = fullfile(directory, datos.nombres(i));
    freq_name = char(strcat( carpetaActual,'/vector_de_frecuencias.txt'));
    amp_name = char(strcat( carpetaActual,'/vector_de_amplitudes.txt'));
    hfarea_name = char(strcat( carpetaActual,'/hfarea.txt'));
    Cut_offF_name = char(strcat( carpetaActual,'/Cut_offF.txt'));

    freq = load(freq_name);
    amp = load(amp_name);
    Cut_offF = load(Cut_offF_name);
    hfarea = load(hfarea_name) * 0.01;

    freq_m=[]; % en freq_m se guardan las frecuencias de distinto valor debido a que muchas se repiten
    amp_m=[];  % en amp_m se guardan los promedios de las amplitudes de todos los picos de igual frecuencia
    j=1;
    while j<=length(freq)
        c=find(freq==freq(j));
        amp_m=[amp_m; mean(amp(c))];
        freq_m=[freq_m; freq(j)];
        j=c(end)+1;
    end
    % se normalizan las amplitudes
    
    amp_m=amp_m/sqrt((sum(amp_m))); % teniendo en cuenta el histograma del paper https://doi.org/10.3389/fphys.2018.01001 figura 2, donde cada barra           
    bins=(0:0.01:2.5)';  % está equiespaciada a 0.01, se crea un vector bins que definirá los bordes de cada pico en el eje frecuencial      
    amp_fin=[];        % y amp_fin tendrá las amplitudes de este último gráfico
    
    j=1;
    while j<=(length(bins)-1)
        d=find(freq_m>bins(j) & freq_m<=bins(j+1));
        amp_fin=[amp_fin;sum(amp_m(d))];
        j=j+1;
    end
    
    t=13.653333333333332/2;              %(load('frecuencia_remuestreo.txt'))
    t=t/2049;
    amp_fin=(amp_fin*t)/0.01;
    amp_fin = amp_fin(1:250);

    ilim = int32(100*round(Cut_offF(1),2));
    slim = int32(100*round(Cut_offF(2),2));
    hlim = int32(100*round(Cut_offF(3),2));
    VLF_area(i) = (sum(amp_fin(1:ilim)))/sum(amp_fin(1:hlim));
    LF_area(i) = (sum(amp_fin((ilim+1):slim)))/sum(amp_fin(1:hlim));
    HF_area(i) = (sum(amp_fin((slim+1):hlim)))/sum(amp_fin(1:hlim));
    hf_lf(i) = (sum(amp_fin((slim+1):hlim)))/sum(amp_fin((ilim+1):slim));
    % Iterar sobre los archivos .txt
end
VLF_area = VLF_area*100;
LF_area = LF_area*100;
HF_area = HF_area*100;
save("VLF_area.txt", "VLF_area","-ascii")
save("LF_area.txt", "LF_area","-ascii")
save("HF_area.txt", "HF_area","-ascii")
save("HF_LF.txt", "hf_lf","-ascii")