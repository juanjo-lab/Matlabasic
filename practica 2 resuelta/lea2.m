%%II.4 Enmascaramiento de fuentes sonoras
function [x_final] = lea2(ftono,SPLtono,fruido,SPLruido)
%{
Se trata de crear una función llamada ‘lea2.m’ que sea capaz de generar un tono (sonido
enmascarante) superpuesto a un ruido de 100 Hz de ancho de banda (sonido enmascarado). Las
variables de entrada serán:
_______________________________________________________ Experimentos de Psicoacústica
3
ftono frecuencia del tono.
SPLtono nivel del tono.
fruido frecuencia central del ruido.
SPLruido nivel total del ruido.
Cada vez que se llame a la rutina ‘lea2.m’ deberá reproducir los sonidos enmascarante y
enmascarado durante 1.5 s, y dar como salida la forma de onda conjunta (proporcionar los ficheros
wav tal y como se indica a continuación). 
%}
%definicion
SPLref = 94;fs=44100;f0=100;
t=0:1/fs:1.5;

%definicion de presiones
A1= 10^((SPLtono-SPLref)/20);
A2= 10^((SPLruido-SPLref)/20);

%generacion de tono
tono = A1*sin(2*pi*ftono*t);

%generamos el sonido enmascarado 
enmascarador=A2*creaRuido(length(tono),fruido,f0,fs);
x_final = [tono' enmascarador tono'+enmascarador];%concatenamos nuestro tono-enmascarador-
end