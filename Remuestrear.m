% Especifica la ruta de la carpeta que contiene las series RR
carpeta = '/home/david/Documents/Paper_cutoffFrequencies/series_prenatales';
periodo = 73.1;%load('periodo_remuestreo.txt')*1000;
%%%%%%%%%%%%%%% Remuestrea y reescribe los archivos segun el periodo
%%%%%%%%%%%%%%% especificado
archivos = dir(fullfile(carpeta, '*.txt'));

% Inicializa un vector para almacenar los nombres de archivos
nombresArchivos = cell(length(archivos), 1);

% Recorre la lista de archivos y guarda los nombres en el vector
for i = 1:length(archivos)
    nombresArchivos{i} = archivos(i).name;
end
n = length(archivos);

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
    data(1) = [];                           % se eliminan las muestras primera y última de la serie ya que son
    ff = length(data);                   % artefactos añadidos por el matlab y tienen valor NaN que luego distorsiona los resultados
    data(ff) = [];
    data = resampling(data,periodo);        % se llama a la función de remuestreo
    new_name = 'Resampled13_68_';
    new_name = strcat(new_name, nombreArchivo);
    save(new_name,"data","-ascii");
end