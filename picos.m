function  picos(a)

asp = pwelch(a,4096);
asp = asp/sum(asp);
asp_p = asp(1:301);
f = linspace(0,6.839945280437757,2049)'; frec = f(1:301);

save("sp_picos.txt", "asp_p", "-ascii")
save("frec.txt", "frec", "-ascii")

end