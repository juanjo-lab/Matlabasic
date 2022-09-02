function DibuSPL(x,fs)

    x = x(:);
    N = length(x);
    ventana = hanning(N);
    ventana = ventana(:);
    ener_ventana = sum(ventana.^2)/N;
    
    xf = abs((1/(N)/sqrt(ener_ventana))*(fft(x.*ventana)));
    xf = xf(1:fix(N/2));
    f = ((0:(fix(N/2)-1))/N)*fs;
    
    % Amplitud 1 son 94 dB SPL
    xf_dB_SPL = 20*log10(xf) + 94 + 6; % +6 por la transformada 1/2 del seno
    figure;
    semilogx(f,xf_dB_SPL);
    xlabel('Frecuencia en Hz');
    ylabel('dB SPL/Hz');

return;