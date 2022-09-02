% JUAN JOSE MARTINEZ CAMARA
function pretenmascaramiento(f,SPL_1,SPL_2,SPL_ref,t_dif)
%definimos los parametros temporales 
t_in=0;t_fin=0.5;
fs=44100;
%definimos nuestro vector temporal
t=t_in:1/fs:t_fin;

%normalizamos la diferencia temporal entre tonos para trabajar en ms
t_dif=t_dif/1000;
%sacamos el numero de muestras que necesitamos (las convertimos en zeros
% ya que realmente nuestra diferencia son ceros)
N_dif=round(fs*t_dif);

%caracterizamos nuestro tono enmascarado con un tiempo corto
t_2=t_in:1/fs:0.03;

%Calculamos las amplitudes de cada tono
A1=10^((SPL_1-SPL_ref)/20);
A2=10^((SPL_2-SPL_ref)/20);

%calculamos los tonos
tono1=A1*sin(2*pi*f*t);
tono2=A2*sin(2*pi*f*t_2);

%calculamos los vectores temporales de tiempo de espera inicial de 1 
espera=zeros(1,length(t_in:1/fs:1));
%calculamos los zeros necesarios entre tonos 
diftiempo=zeros(1,N_dif);

%concatenamos todos los vectores temporales generados
pretenmascarado=[espera tono2 diftiempo tono1];

%reproducimos los tonos 
sound(pretenmascarado,fs);

%se imprimira por pantalla la duracion total de nuestro resultado en
%segundos 
length(pretenmascarado)/fs

end