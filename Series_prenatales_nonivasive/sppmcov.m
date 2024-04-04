tam = 1024;
f = ((0:512)')/1024;
% semana 22
s_748 = load("748.txt");
sp_s22 = sp_fft(s_748, tam);

% semana 23
s_274 = load("274.txt");
sp_s23 = sp_fft(s_274, tam);

% semana 25
s_571 = load("571.txt");
sp_s25 = sp_fft(s_571, tam);

% semana 38
s_585 = load("585.txt");
sp_s38 = sp_fft(s_585, tam);

% semana 40
s_906 = load("906.txt");
sp_s40 = sp_fft(s_906, tam);

plot(log10(f), log10(sp_s22))
hold on
plot(log10(f), log10(sp_s23))
plot(log10(f), log10(sp_s25))
plot(log10(f), log10(sp_s38))
plot(log10(f), log10(sp_s40))

% save("sp_s22.txt","sp_s22","-ascii")
% save("sp_s23.txt","sp_s23","-ascii")
% save("sp_s25.txt","sp_s25","-ascii")
% save("sp_s38.txt","sp_s38","-ascii")
% save("sp_s40.txt","sp_s40","-ascii")