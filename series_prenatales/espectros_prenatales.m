r01 = load("r01.txt"); %r01 = r01 - mean(r01); r01 = paddata(r01,1024);
r04 = load("r04.txt"); %r04 = r04 - mean(r04); r04 = paddata(r04,1024);
r07 = load("r07.txt"); %r07 = r07 - mean(r07); r07 = paddata(r07,1024);
r08 = load("r08.txt"); %r08 = r08 - mean(r08); r08 = paddata(r08,1024);
r10 = load("r10.txt"); %r10 = r10 - mean(r10); r10 = paddata(r10,1024);
% p = 50;
f = (0:512)'/1024;
sp_r01 = sp_fft(r01,1024);
sp_r04 = sp_fft(r04,1024);
sp_r07 = sp_fft(r07,1024);
sp_r08 = sp_fft(r08,1024);
sp_r10 = sp_fft(r10,1024);
% plot(log10(f),log10(sp_r10))
% save("sp_r01.txt","sp_r01","-ascii")
% save("sp_r04.txt","sp_r04","-ascii")
% save("sp_r07.txt","sp_r07","-ascii")
% save("sp_r08.txt","sp_r08","-ascii")
% save("sp_r10.txt","sp_r10","-ascii")