%	p=creaRuido(N,fc,bw,fs)
%
%	Curvas isofónicas.
%
%	N	número de muestras.
%	fc	frecuencia central del ruido.
%	bw	ancho de banda de ruido
%	fs  frecuencia de muestreo.


function n = creaRuido(N,fc,bw,fs)

n = randn(N,1);
Wn = [fc-bw/2 fc+bw/2]/(fs/2);
B = fir1(500,Wn);

n = filter(B,1,n);
n = sqrt((fs/2)/bw)*n;

return;