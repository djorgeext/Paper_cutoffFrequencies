sp513_4111 = load('sp513_4111.txt'); % 2.58
sp513_4113 = load('sp513_4113.txt'); % 2.67
sp513_4047 = load('sp513_4047.txt'); % 2.75
sp513_4046 = load('sp513_4046.txt'); % 2.83
sp513_4107 = load('sp513_4107.txt'); % 2.92
sp513_4108 = load('sp513_4108.txt'); % 3
sp513_4076 = load('sp513_4076.txt'); % 3.42
sp513_4112 = load('sp513_4112.txt'); % 3.42
sp513_4116 = load('sp513_4116.txt'); % 4
sp513_4120 = load('sp513_4120.txt'); % 4.5
sp513_4009 = load('sp513_4009.txt'); % 0.083
f = linspace(0,0.5,513);

loglog(f(2:end),sp513_4111(2:end),'--k')
hold on
%title('sp513_4111')
loglog(f(2:end),sp513_4113(2:end))
%title('sp513_4113')
loglog(f(2:end),sp513_4047(2:end))
%title('sp513_4047')
loglog(f(2:end),sp513_4046(2:end))
%title('sp513_4046')
loglog(f(2:end),sp513_4107(2:end))
%title('sp513_4107')
loglog(f(2:end),sp513_4108(2:end))
%title('sp513_4108')
loglog(f(2:end),sp513_4076(2:end))
%title('sp513_4076')
loglog(f(2:end),sp513_4112(2:end))
%title('sp513_4112')
loglog(f(2:end),sp513_4116(2:end))
%title('sp513_4116')
loglog(f(2:end),sp513_4120(2:end))
%title('sp513_4120')
loglog(f(2:end),sp513_4009(2:end), 'k')
legend('sp513_4111', 'sp513_4113', 'sp513_4047', 'sp513_4046', 'sp513_4107', 'sp513_4108', 'sp513_4076', 'sp513_4112', 'sp513_4116', 'sp513_4120', 'sp513_4009')