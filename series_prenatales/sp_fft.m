function y = sp_fft(x,tam)
    if length(x) < tam
        x = x - mean(x);
        x = paddata(x,tam);
        yfft = (abs(fft(x))).^2;
        y = yfft(1:(tam/2 +1));
    else
        ytemp = zeros((tam/2 + 1),1);
        k = length(x);
        cant = fix(k/tam);
        for i=1:cant
            temp = x((tam*i-(tam-1)):(tam*i));
            temp = temp - mean(temp);
            yfft = (abs(fft(temp))).^2;
            ytemp = ytemp + yfft(1:(tam/2 +1));
        end
        x = flip(x);
        for i=1:cant
            temp = x((tam*i-(tam-1)):(tam*i));
            temp = temp - mean(temp);
            yfft = (abs(fft(temp))).^2;
            ytemp = ytemp + yfft(1:(tam/2 +1));
        end
        y = ytemp/(cant*2);
    end
end