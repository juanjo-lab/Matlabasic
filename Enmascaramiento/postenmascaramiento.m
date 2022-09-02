% JUAN JOSE MARTINEZ CAMARA
function postenmascaramiento(f,SPL_1,SPL_2,SPL_ref,t_dif)
%definimos los parametros temporales
t_in=0;t_fin=0.5;
fs=44100;

%definimos nuestro vector temporal
t=t_in:1/fs:t_fin;

%normalizamos
t_dif=t_dif/1000;

%definimos el vector temporal de nuestro sonido enmascarado
t_2=t_in:1/fs:0.003;

%definimos el numero de ceros que tenemos que introducir entre los tonos
diftiempo=zeros(1,round(fs*t_dif));

%Calculamos las amplitudes
A1=10^((SPL_1-SPL_ref)/20);
A2=10^((SPL_2-SPL_ref)/20);

%calculamos los tonos
tono1=A1*sin(2*pi*f*t);
tono2=A2*sin(2*pi*f*t_2);

%concatenamos
postenmascarado=[tono1 diftiempo tono2];

%reproducimos los tonos generados 
sound(postenmascarado,fs);

%se imprimira por pantalla la duracion total de nuestro resultado en
%segundos 
length(postenmascarado)/fs

end