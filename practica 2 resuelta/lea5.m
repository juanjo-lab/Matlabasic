%{
Se creará ahora un programa ‘lea5.m’ que irá simulando un batido auditivo con frecuencia
central de 1Khz para diferentes desviaciones de frecuencia. Se usará la rutina ‘lea4.m’ y en pasos
de 2 Hz, comenzando por Δf=-10 y finalizando por Δf=+10 se creará un fichero .wav donde se
perciba el batido para los diferentes valores de Δf. Comentar, el valor de Δf a partir del cual se
puede percibir el batido.
%}
fc=1000;fs=44100;
A=1;
If=10;
for If=-50:10:50
    y_total=lea4(fc,If,A);
end
sound(y_total,fs);

audiowrite("batido_1k_If_50.wav",y_total,fs);