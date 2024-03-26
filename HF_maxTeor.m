% Especifica la ruta de la carpeta que contiene los archivos txt
carpeta = '/home/david/Documents/Paper_cutoffFrequencies/series_prenatales'; % Reemplaza 'ruta_de_la_carpeta' con la ruta adecuada

% Utiliza la función dir para obtener la lista de archivos
archivos = dir(fullfile(carpeta, '*.txt'));

% Inicializa un vector para almacenar los nombres de archivos
nombresArchivos = cell(length(archivos), 1);

% Recorre la lista de archivos y guarda los nombres en el vector
for i = 1:length(archivos)
    nombresArchivos{i} = archivos(i).name;
end
n = length(archivos);
medias = zeros(2*n,1);
desviacion = zeros(2*n,1);

for i=1:n
    nombreArchivo = archivos(i).name;
    rutaArchivo = fullfile(carpeta, nombreArchivo);
    contenido = fileread(rutaArchivo);
        % Crea un nombre de campo válido para la estructura
    nombreCampo = genvarname(nombreArchivo);
    
    % Guarda el contenido en la estructura con el nuevo nombre de campo
    contenidoArchivos.(nombreCampo) = contenido;
    contenidoTexto = contenidoArchivos.(nombreCampo); % Lee el contenido del archivo como texto
    
    % Convierte el contenido de texto en un vector de números (double)
    data = str2double(strsplit(contenidoTexto));
    gmm = fitgmdist(data',2);
    medias(2*i-1)= gmm.mu(1);
    medias(2*i)= gmm.mu(2);
    desviacion(2*i-1) = gmm.Sigma(1,1,1);
    desviacion(2*i) = gmm.Sigma(1,1,2);
end

%locations = [medias, desviacion];
[medias,I] = sort(medias);
desviacion = desviacion(I);
% [medias,desviacion]=bubbleSort(locations);
HF_max = medias(1)-2*desviacion(1);
% save ("MenorLatido.txt","HF_max","-ascii");
