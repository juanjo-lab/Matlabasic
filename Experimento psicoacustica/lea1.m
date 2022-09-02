%%                  PRIMER BARRIDO
%{
i.	Se realizará un barrido en frecuencia utilizando tonos de frecuencias 
normalizadas de 1 octava desde 125 hasta 8000 Hz con un nivel de presión 
sonora de 88 dB. Comenzará por el tono de 125 Hz y posteriormente se oirán
 en los auriculares 500 ms del tono de 125 Hz concatenados con 500 ms del
 tono de 1KHz que servirán de referencia de sonoridad (es decir, sin pausa
 entre el tono de 125 Hz y el de 1KHz). A continuación se repetirá la misma 
secuencia para el tono de 250 Hz y así hasta llegar al de 8 KHz. Todos los
 tonos tendrán el mismo nivel de 88 dB. Generar un fichero wav en donde se 
recoja el resultado del barrido en frecuencia.
%}
%definimos parametros iniciales
t_fin=0.5;[x,fs]=audioread('Tono1Khz.wav');%cargamos nuestro tono
SPLref=94;SPL=88;%declaramos los niveles de presion 

%definimos nuestro vector de tiempos
t=0:1/fs:t_fin;

%calculamos la amplitud
A=10^((SPL-SPLref)/20);

%reajustamos el tono de 1Khz
x=x(1:length(t));

%tenemos que buscar , 125-250-500-1000-2000-4000-8000, ya que estas son las
%octavas de mi funcion 
f=[125 250 500 1000 2000 4000 8000]; 
x_final=[];
for i=1:1:length(frecuencias)
   p=isofon(f(i),SPL);            %hacemos la curva isofonicas
   x2 = A*cos(2*pi*f(i)*t);       %definimos nuestra señal 
   x_aux = [x2 x'];               %Realizamos la concatenacion con nuestra señal enmascaradora 
   x_final = [x_final x_aux];     %Usamos para ir almacenando, ya que si no, en cada iteracion se iria solapando.                 
end
%Con este comando reproducimos el audio cuando ejecutemos el scrip
soundsc(x_final,fs);
audiowrite('aprt1)125-8Khz.wav',x_final,fs);

%%
%  SEGUNDO SONIDO
%{
ii. Se realizará un barrido de nivel utilizando saltos de 6 dB desde 76 hasta 94 dB. Se usará un
tono de 1000 Hz comenzando por 76 dB y posteriormente se oirán en los auriculares 500 ms del
tono concatenados con 500 ms del tono de 88 dB que servirán de referencia de sonoridad (es decir,
sin pausa entre el tono de 76 dB y el de 88 dB). A continuación se repetirá la misma secuencia para
el tono de 82 dB y así hasta llegar al de 94 dB. Todos los tonos tendrán la misma frecuencia de
1000 Hz. Generar un fichero wav en donde se recoja el resultado del barrido de nivel.
%}
%definimos parametros iniciales
t_fin=0.5;[x,fs]=audioread('Tono1Khz.wav');%cargamos nuestro tono
SPLref=88;SPL=[ 76 82 88 94 ];%declaramos los niveles de presion 
f=1000;

%definimos nuestro vector de tiempos
t=0:1/fs:t_fin;

%reajustamos nuestro tono
x=x(1:length(t));

for i=1:1:length(SPL)
    p=isofon(f,SPL(i));         %hacemos la curva isofonicas
    A=10^((SPL(i)-SPLref)/20);  %Modificamos la amplitud en funcion de la iteracion
    x2=A*sin(2*pi*f*t);         %redefinimos con la nueva amplitud
    x_aux=[x2 x'];              %Realizamos la concatenacion con nuestra señal enmascaradora 
   x_final=[x_final x_aux];     %Usamos para ir almacenando, ya que si no, en cada iteracion se iria solapando.
end
sound(x_final,fs);
audiowrite('aprt2)82-94SPL.wav',x_final,fs);


%%  Sacar las curvas isofonicas del barrido de frecuencia.
%{
Con el barrido en frecuencia del programa ‘lea1.m’ y haciendo uso de la función isofon. realícese
una tabla indicando la sonoridad de cada uno de los tonos analizados indicando cual de ellos es el
más sonoro justificando la respuesta en términos del comportamiento del oido humano.
En la misma tabla se ha indicar (haciendo uso de las las curvas de sonoridad) la sonoridad teórica
esperada –en fonios- comprobando así que el valor predicho no se aleja del que proporciona la
función isofon).
%}
f=[125 250 500 1000 2000 4000 8000]; 
for i = (1:1:length(f)) 
        p(i)=isofon(f(i),88);
        
end
%%
%{
Con el barrido de nivel del programa ‘lea1.m’ funcionando correctamente, determínese
aproximadamente cuantas veces más o menos sonoros son los tonos de 76, 82 y 94 respecto la
sonoridad del tono de 88 dB. Realícese una tabla (tal y como se realizó en el barrido en frecuencia)
indicando el valor de la sonoridad en fonos y compare con el valor teórico esperado.
%}
SPL = [ 76,82,88,94 ];
for i = (1:1:length(SPL)) 
        p(i)=isofon(1000,SPL(i));
        
end

