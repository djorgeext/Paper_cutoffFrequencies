function y = espectro(x,n)
x = (x-mean(x))/std(x);
y = (abs(fft(x,n))).^2;
y = y(1:n/2);
y = y/sum(y);

end