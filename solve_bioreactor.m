function [Xs,Ss,Ps] = solve_bioreactor( constants, initConds , dt, finalt) ;

global mu_max Ks Yxs F Sf qp V0

F = constants.F;
Sf = constants.Sf;
mu_max = constants.mu_max;
Yxs = constants.Yxs;
Ks = constants.Ks;
qp = constants.qp;

V0 = initConds.V0;

x0 = [ initConds.X0 ; initConds.S0 ; initConds.P0 ];

t = 0:dt:finalt;

salida = lsode ('balances',x0, t );

Xs = salida (:, 1);
Ss = salida (:, 2);
Ps = salida (:, 3);

figure
plot(t, Xs,'b')
grid on

figure
plot(t, Ss,'r')

figure
plot(t, Ps,'g')
%~ legend('X','S','P')
