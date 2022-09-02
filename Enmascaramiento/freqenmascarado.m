% JUAN JOSE MARTINEZ CAMARA
function freqenmascarado(f_1,f_2,SPL_1,SPL_2,SPL_ref)
%declaramos parametros temporales
t_in=0;t_fin=1;
fs=44100;
t=t_in:1/fs:t_fin;

%calculamos amplitudes de tonos
A1=10^((SPL_1-SPL_ref)/20);
A2=10^((SPL_2-SPL_ref)/20);

%calculamos tonos
tono1=A1*sin(2*pi*f_1*t);
tono2=A2*sin(2*pi*f_2*t);

%concatenamos los tonos
freqenmascarado=[tono1  tono2];

%reproducimos el resultado 
sound(freqenmascarado,fs);

end