% ejercicio 16 - práctico de procesos microbianos
% curso Ingeniería Bioquímica
% Instituto de Ingeniería Química
% Universidad de la República

clear all, close all

addpath(genpath('src'))

global mu_max Ks Yxs F Sf qp V0

constants        = struct();
constants.F      =  50; %L/h
constants.Sf     = 300; %g/L
constants.Yxs    = 0.3; %g/g
constants.mu_max = 0.2; %h-1
constants.Ks     = 0.5; %g/L
constants.qp     = 0.01; %g/gh

initConds    = struct();
initConds.V0 = 500; %L
initConds.P0 = .1; %g/L
initConds.X0 = 40; %g/L
initConds.S0 = 2; %g/L

analysisSettings = struct();
analysisSettings.dt = 0.01;
analysisSettings.finalt = 10;

[Xs, Ss, Ps] = solve_bioreactor( constants, initConds, analysisSettings ) ;
