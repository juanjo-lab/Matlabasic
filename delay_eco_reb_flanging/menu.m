% practica 1
% ing acustica juan jose martinez camara

%%                        DATOS GENERALES

fs=44100;
[mono,fs]=audioread('music.wav');%cargamos los audios
[estereo,fs]=audioread('music.wav');
ifmon=1;ifeste=2;%indica el tipo de parte de funcion que se va a invocar

%%                          RETRASO

%Solicitamos al usuario el valor del retardo
delay = input('Introduce el valor del retardo en segudos');

monodelay=fundelay(fs,delay,mono,ifmon);%funcion de retraso
estedelay=fundelay(fs,delay,estereo,ifeste);
 audiowrite('monodelay.wav',monodelay,fs);%cargamos audio en archivo.wav
 audiowrite('estereodelay.wav',estedelay,fs);
 sound(monodelay,fs);%escucha el resultado
 sound(estedelay,fs);
 
 %%                             ECO
 
delay = input('Introduce el valor del retardo en segudos');%introduce valor de retardo
eco = input('Introduce el valor del eco');%introduce el eco que quieres
monoeco=funeco(fs,delay,mono,ifmon,eco);%invoca funcion para añadir eco
esteeco=funeco(fs,delay,estereo,ifeste,eco);
 audiowrite('monodeeco.wav',monoeco,fs);%cargamos audio en archivo.wav
 audiowrite('estereoeco.wav',esteeco,fs);
 sound(monoeco,fs);
 sound(esteeco,fs);
 
 %%                         REBERBERACION 
 
 delay = input('Introduce el valor del retardo en segudos ahora < 30ms');
 if(delay<=0.03)%comprobante de que lo introducido no lo supera
 reb = input('Introduce el valor de la atenuacion');%atenuacion 
 monoreb=funreb(fs,delay,mono,ifmon,reb);%invoca la formula
 estereb=funreb(fs,delay,estereo,ifeste,reb);
 audiowrite('monodereb.wav',monoreb,fs);% creamos audio con reberberacion
 
 audiowrite('estereoreb.wav',estereb,fs);
 sound(monoreb,fs);
 sound(estereb,fs);
 else
 disp('Valor del retardo incorrecto. Para realizar la reverberacion se necesitan valores inferiores menores a 30 milisegundos');
 end

 %%                         FLANGING
 delay = input('Introduce el valor del retardo en segudos ahora 0.7-1sg');
  if(delay<=1 && delay>=0.0007)%comprobante de que lo introducido no lo supera
 fc=input('introduce la frecuencia del coseno 0.5Hz-1.5Hz');
 if(delay<=1.5 && fs>=0.5)    
      atenuacion = input('Introduce el valor de la atenuacion 0.7-0.95');
 monoflan=funflan(fs,delay,mono,ifmon,atenuacion,fc);
 esteflan=funflan(fs,delay,estereo,ifeste,atenuacion,fc);
 audiowrite('monodeflan.wav',monoflan,fs);%cargamos audio en archivo.wav
 audiowrite('estereoflan.wav',esteflan,fs);
 sound(monoflan,fs);
 sound(esteflan,fs);
 else
 disp('Valor del retardo incorrecto. Para realizar flanging se necesitan valores inferiores menores 1.5HZ y superiores a 0.5hz');
 end
  else
 disp('Valor de la frecuencia incorrecto. Para realizar flanging se necesitan valores inferiores menores a 1 segundos y superiores a 70ms');
 end