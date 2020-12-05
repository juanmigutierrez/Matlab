syms u v
raiz1 = (1+sqrt(5))/2;
raiz2 = (1-sqrt(5))/2;
eqns =[u*raiz1+v*raiz2==1,u*(raiz1)^2+v*(raiz2)^2==2];
vars = [u v];
[solv,solu]=solve(eqns,vars)