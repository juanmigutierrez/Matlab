n = linspace(1,50,50); 
y1 = (n.*(n-1).*(n.*2-1))
y2 = (n.^3)*6
y3 = y1./y2

y4 = (n.*(n+1).*(n.*2+1))
y5 = y4./y2
clf
figure()
plot(y3,n,'DisplayName','L(p,h)')
hold on
plot(y5,n,'DisplayName','U(p,h)')
legend
xlabel('Muestra[n]')
ylabel('Suma [u.a]')