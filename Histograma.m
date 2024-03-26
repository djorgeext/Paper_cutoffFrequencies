a = randn(4096,1);
gmm = fitgmdist(a,1);
gmm.Sigma