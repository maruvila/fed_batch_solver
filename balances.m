function f = balances (x, t) 

global mu_max Ks Yxs F Sf qp V0

X = x(1);
S = x(2);
P = x(3);

%~ x

%~ mu_fun( mu_max, S, Ks) * X
%~ X*F/(V0 + F*t)

dXdt =  mu_fun( mu_max, S, Ks) * X - X*F/(V0 + F*t);

dSdt = F*Sf/(V0+F*t) - mu_fun( mu_max, S, Ks)*X/Yxs - S*F/(V0+F*t);

dPdt = qp*X - P*F/(V0+F*t);


f = [dXdt dSdt dPdt]' ;

%~ stop




function mu = mu_fun(mu_max, S, Ks)

mu = mu_max * S / ( Ks + S);

