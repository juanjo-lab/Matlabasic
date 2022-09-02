%{
Se trata de crear una función llamada ‘lea4.m’ que sea capaz de crear un batido auditivo. La
rutina tendrá como variables de entrada :
fc frecuencia central de batido.
Δf desviación de la frecuencia central.
La amplitud máxima del Batido se iguala a la unidad
Cada vez que se llame a la rutina ‘lea4.m’ deberá dibujar la forma de onda del batido
(oscilaciones de amplitud) en un intervalo de tiempo de 2.5 sg. La salida de la rutina será la forma
de onda del batido (señal total y )
%}
function [y_total] = lea4(fc,If,A)
%definimos parametros y constantes =>
tc=1/fc;
fs=44100;ts=1/fs;

if If~=0
tc=abs(1/If);
end

t=0:ts:2.5;
y_total=2*A*cos(2*pi*fc*t).*cos(2*pi*If*2);
figure;plot(t,y_total);title('Batido If (Hz)'); 
xlabel('Tiempo(s)');ylabel('Amplitud (V)');


end