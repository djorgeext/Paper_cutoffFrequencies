load amp_fin.mat
load x.mat

% a1 = 0.1042; a2 = 0.03108; a3 = 0.004186;
% b1 = 0.01219; b2 = 0.06533; b3 = 0.2956;
% c1 = 0.02287; c2 = 0.08636; c3 = 0.0915;x
% y = load("amp.mat"); y = y.amp_fin;
f = x; y = amp_fin;

fun = @(param,f)param(1)*exp(-((f-param(2))/param(3)).^2) + param(4)*exp(-((f-param(5))/param(6)).^2) + param(7)*exp(-((f-param(8))/param(9)).^2);

lb = [0, 0.0033, 0, 0, 0.04, 0, 0, 0.15, 0];
ub = [0.5, 0.5, 1, 0.5, 1, 1.5, 0.5, 1.5, 1.5];
%param_0 = [0.1212, 0.02, 0.0361, 0.0277, 0.1, 0.0452, 0.006, 0.35, 0.065];
param_0 = [0.1, 0.02, 0.05, 0.07, 0.1, 0.1, 0.01, 0.3, 0.15];
%param_0 = [0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05];
% [xfitted,errorfitted] = lsqcurvefit(fun,param_0,f,y,lb,ub);
% xfitted'
load matriz_startpoint_2.mat
problem = createOptimProblem('lsqcurvefit','x0',param_0,'objective',fun,...
    'lb',lb,'ub',ub,'xdata',f,'ydata',y);

tpoints = CustomStartPointSet(matriz_startpoint_2);

ms = MultiStart('FunctionTolerance',1e-6,'XTolerance',1e-6,...
    'StartPointsToRun','all');
[xmulti,errormulti,exitflag,output] = run(ms,problem,tpoints);
