% Copyright © 2025 Eugenia Vila
%
% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

function f = balances (x, t) 

global mu_max Ks Yxs F Sf qp V0

X = x(1);
S = x(2);
P = x(3);

V = my_vol(V0,F,t);

dXdt =  mu_fun( mu_max, S, Ks) * X - X*F/V;

dSdt = F*Sf/V - mu_fun( mu_max, S, Ks)*X/Yxs - S*F/V;

dPdt = qp*X - P*F/V;


f = [dXdt dSdt dPdt]' ;


function mu = mu_fun(mu_max, S, Ks)

mu = mu_max * S / ( Ks + S);

function V = my_vol(V0, F, t)

V = (V0+F*t);
