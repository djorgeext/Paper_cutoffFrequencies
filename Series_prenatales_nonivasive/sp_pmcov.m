function y = sp_pmcov(x,n,tam)
    if length(x) < tam
        x = x - mean(x);
        x = paddata(x,tam);
        y = pmcov(x, n, tam);
    else
        ytemp = zeros((tam/2 + 1),1);
        k = length(x);
        cant = fix(k/tam);
        for i=1:cant
            temp = x((tam*i-(tam-1)):(tam*i));
            temp = temp - mean(temp);
            ytemp = ytemp + pmcov(temp, n, tam);
        end
        x = flip(x);
        for i=1:cant
            temp = x((tam*i-(tam-1)):(tam*i));
            temp = temp - mean(temp);
            ytemp = ytemp + pmcov(temp, n, tam);
        end
        y = ytemp/(cant*2);
    end
end