function y=normalizar(data)

% Función para normalizar cada segmento de 5 minutos de la serie a media 0, y llevarla al orden de 10^-1
% en ms

n = length(data);
cant = fix(n/2048);                         % variable que contiene la cantidad de ventanas de 5 minutos que se pueden obtener
salida = zeros(2048*cant,1);
salida2 = zeros(2048*cant,1);

for i=1:cant
    temp = data((2048*i-2047):2048*i);
    salida((2048*i-2047):2048*i)= (temp - mean(temp))/1000;
end

data = flip(data);                             % dado que siempre quedará un resto de algunas muestras que no llegarán a completar 5 minutos
                                                       % por lo que se invierte la serie para contemplar el último segmento
for i=1:cant
    temp = data((2048*i-2047):2048*i);
    salida2((2048*i-2047):2048*i)= (temp - mean(temp))/1000;
end

y = [salida;salida2];
end