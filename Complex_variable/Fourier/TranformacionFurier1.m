function TranformacionFurier1(X,Y,N,n1,n2)
    figure()
    plot(X,Y);

    noise = randn(1,N);
    noise = noise; %% A este valor se le modifica para que aumente el ruido
    size(noise);
    
    Xnew = X + noise;
    Ynew = Y + noise;

    %Grafica parte real
    figure()
    title('Parte real')
    plot(Xnew,'DisplayName','Numero Complejo con ruido')
    hold on
    plot(X,'DisplayName','Numero Complejo sin ruido')
    legend
    title('Parte real')

    %Grafica parte imaginaria
    figure()
    plot(Ynew,'DisplayName','Numero Complejo con ruido')
    hold on
    plot(Y,'DisplayName','Numero Complejo sin ruido')
    legend
    title('Parte Imaginaria')

    %Plot X,Y
    figure()
    plot(Xnew,Ynew,'DisplayName','Numero Complejo con ruido')
    hold on
    plot(X,Y,'DisplayName','Numero Complejo sin ruido')
    legend
    title('Grafica Figura')

    Z=complex(Xnew,Ynew);
    Zoriginal= complex(X,Y);
    fourier1 = fft(Z);
    fourier2 = fft(Zoriginal);
    
    %Transformacion de fourier
    figure()
    plot(abs(fourier1),'DisplayName','Numero Complejo con ruido')
    hold on
    plot(abs(fourier2),'DisplayName','Numero Complejo sin ruido')
    legend
    title('Amplitud de los coeficientes de Fourier')
    xlabel('Muestras[k]')
    ylabel('Amplitud [u.a]')

    %Angulos
    figure()
    plot(angle(fourier1),'DisplayName','Numero Complejo con ruido')
    hold on
    plot(angle(fourier2),'DisplayName','Numero Complejo sin ruido')
    legend
    
    title('Angulo de los Coeficientes de Fourier')
    xlabel('Muestras[k]')
    ylabel('Amplitud [u.a]')

    %Trio Graficas finales
    fourier_t = fourier1;
    fourier_t(n1:n2) = 0;
    z_noise = ifft(fourier_t);

    ReZ_noise = real(z_noise);
    ImZ_noise = imag(z_noise);

       %Grafica parte real
    figure()
    title('Parte real')
    plot(Xnew,'DisplayName','Numero Complejo con ruido')
    hold on
    plot(ReZ_noise,'DisplayName','Numero Complejo Filtrado')
    hold on
    plot(X,'DisplayName','Numero Complejo sin ruido')
    legend
    title('Parte Real')
    xlabel('Muestras[n]')
    ylabel('Amplitud [u.a]')

    %Grafica parte imaginaria
    figure()
    title('Parte Imaginaria')
    plot(Ynew,'DisplayName','Numero Complejo con ruido')
    hold on
    plot(ImZ_noise,'DisplayName','Numero Complejo Filtrado')
    hold on
    plot(Y,'DisplayName','Numero Complejo sin ruido')
    legend
    title('Parte Imaginaria')
    xlabel('Muestras[n]')
    ylabel('Amplitud [u.a]')

    %Plot X,Y
    figure()
    plot(Xnew,Ynew,'DisplayName','Numero Complejo con ruido sin filtrar')
    hold on
    plot(ReZ_noise,ImZ_noise,'DisplayName','Numero Complejo con ruido filtrado')
    hold on
    plot(X,Y,'DisplayName','Numero Complejo sin ruido')
    legend
    title('Grafica Figura')
    xlabel('Imaginaria[u.a]')
    ylabel('Real[u.a]')
end