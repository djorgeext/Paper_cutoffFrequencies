% Generar algunos datos de ejemplo para el gráfico loglog
x = logspace(0, 3, 100);
y = 1 ./ x.^2;

% Ajustar un modelo lineal a los datos logarítmicos
logx = log(x);
logy = log(y);
fittedmodel = fit(logx', logy', 'poly1');

% Calcular los intervalos de predicción
[predy, delta] = predict(fittedmodel, logx);

% Convertir los resultados de vuelta a escala lineal
predy = exp(predy);
delta = exp(delta);

% Graficar los datos en escala logarítmica
loglog(x, y, 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'blue'); % Grafica los datos

hold on; % Mantener la gráfica activa para superponer el modelo ajustado y los intervalos de predicción

% Graficar el modelo ajustado
plot(x, predy, 'r-', 'LineWidth', 2); % Grafica el modelo ajustado

% Calcular los límites de los intervalos de predicción
upper_bound = predy + delta;
lower_bound = predy - delta;

% Graficar los intervalos de predicción
plot(x, upper_bound, '--g', 'LineWidth', 1); % Grafica el límite superior del intervalo de predicción
plot(x, lower_bound, '--g', 'LineWidth', 1); % Grafica el límite inferior del intervalo de predicción

% Etiquetas y título
xlabel('X');
ylabel('Y');
title('Gráfico loglog con Intervalos de Predicción');
legend('Datos', 'Modelo Ajustado', 'Intervalos de Predicción');
