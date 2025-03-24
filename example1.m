
clear all, close all

global mu_max Ks Yxs F Sf qp V0

constants = struct();
constants.F =  50; %L/h
constants.Sf = 300; %g/L
constants.Yxs = 0.3; %g/g
constants.mu_max = 0.5; %h-1
constants.Ks = 0.5; %g/L
constants.qp = 0.01; %g/gh

initConds = struct();
initConds.V0 = 500; %L
initConds.P0 = 0.1; %g/L
initConds.X0 = 90; %g/L
initConds.S0 = 0.167; %g/L

[Xs, Ss, Ps] = solve_bioreactor( constants, initConds, 0.01,10 ) ;
