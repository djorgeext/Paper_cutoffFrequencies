res_r01 = load('/home/david/Documents/Paper_cutoffFrequencies/resampled/Resampled13_65_r01.txt');
res_r04 = load('/home/david/Documents/Paper_cutoffFrequencies/resampled/Resampled13_65_r04.txt');
res_r07 = load('/home/david/Documents/Paper_cutoffFrequencies/resampled/Resampled13_65_r07.txt');
res_r08 = load('/home/david/Documents/Paper_cutoffFrequencies/resampled/Resampled13_65_r08.txt');
res_r10 = load('/home/david/Documents/Paper_cutoffFrequencies/resampled/Resampled13_65_r10.txt');
res_r01 = (res_r01-mean(res_r01))/(std(res_r01)); res_r01 = paddata(res_r01,4096);
res_r04 = (res_r04-mean(res_r04))/(std(res_r04)); res_r04 = paddata(res_r04,4096);
res_r07 = (res_r07-mean(res_r07))/(std(res_r07)); res_r07 = paddata(res_r07,4096);
res_r08 = (res_r08-mean(res_r08))/(std(res_r08)); res_r08 = paddata(res_r08,4096);
res_r10 = (res_r10-mean(res_r10))/(std(res_r10)); res_r10 = paddata(res_r10,4096);

% sp_r01 = pwelch(res_r01,4096);
% sp_r04 = pwelch(res_r04,4096);
% sp_r07 = pwelch(res_r07,4096);
% sp_r08 = pwelch(res_r08,4096);
% sp_r10 = pwelch(res_r10,4096);
% f = linspace(0,6.839945280437757,2049)';

picos(res_r01);