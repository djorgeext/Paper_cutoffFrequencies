function sprom = sp_prom(data)

    k = length(data);
    segm = 512;
    cant = fix(k/segm);
    sprom = zeros(513,1);

    for j=1:cant-1
        x = data((segm*j-511):(segm*(j+1)));
        x = x-mean(x);
        sp = (abs(fft(x))).^2;
        sprom = sprom + sp(1:(segm+1));
    end
    
    data = flip(data);
    
    for j=1:cant-1
        x = data((segm*j-511):(segm*(j+1)));
        x = x-mean(x);
        sp = (abs(fft(x))).^2;
        sprom = sprom + sp(1:(segm+1));
    end
    
    sprom = sprom/(2*(cant-1));
end