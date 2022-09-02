% JUAN JOSE MARTINEZ CAMARA
% El enmascaramiento temporal sucede cuando dos estímulos sonoros llegan a
% nuestro oído de forma cercana en el tiempo. El estímulo enmascarante hará 
% que el otro, enmascarado, resulte inaudible. Dada esta situación, el tono 
% más intenso tiende a enmascarar el tono más débil.
% 
% Según el instante de tiempo en el que se produce el estímulo enmascarante 
% con respecto al instante en que se produce el enmascarado, se puede 
% distinguir entre Post-enmascaramiento y Pre-enmascaramiento.

%{
Realizamos un menu para no tener que ir ejecutando todo el rato el script.
%}
n=4;
while n==4
    disp("1. POST ENMASCARAMIENTO")
    disp("2. PRE ENMASCARAMIENTO")
    disp("3. FREQ ENMASCARAMIENTO")
    disp("4. SALIDA")
    opcion=input("que opcion desea ejecutar:");
    if opcion==1
 %% Post-enmascaramiento:

% Se da cuando es el tono de mayor amplitud el que sucede con antelación en 
% el tiempo al de menor amplitud, percibiéndose tan sólo el primer estímulo.
% Este fenómeno se produce cuando ambos sonidos llegan al oído en un intervalo
% de tiempo de entre 30 y 60 ms aproximadamente. Esto se debe a que una vez
% percibido el tono fuerte, el oído necesita un cierto periodo de adaptación
        %{
        Pedimos al usuario que introduzca los valores necesarios para
        producir el experimento 
        %}
        f=input("introduzca la frecuencia de los dos tonos en (Hz) = ");
        SPL_1=input("introduca el nivel del tono enmascarante en (dB) = ");
        SPL_2=input("introduzca el nivel del tono enmascarado en (dB) = ");
        t=input("introduzca el tiempo de separacion entre tonos (ms) = ");
        SPL_ref=94;
        %{
        una vez recogidos todos los parametros iniciales, pasamos a nuestra
        funcion dichos parametros.
        %}
        postenmascaramiento(f,SPL_1,SPL_2,SPL_ref,t); 
    elseif opcion==2
%% Pre-enmascaramiento:

% Si se produce primero un estímulo suave y posteriormente un tono intenso,
% este último enmascarará igualmente al de menor amplitud, siempre  cuando 
% estén separados en el tiempo por una diferencia menor de entre 5 y 10 ms. 
% Como este fenómeno se presenta incluso antes de que aparezca el tono 
% enmascarante, implica que se trata de un proceso más complejo que el 
% Post-enmascaramiento.
% 
% La explicación a esta anticipación se encuentra en que la información que 
% llega a la corteza auditiva del cerebro humano se procesa por ráfagas. Así
% mismo se sabe que el cerebro procesa los sonidos fuertes más rápido que 
% los débiles, facilitándose de esta forma el pre-enmascaramiento.
        %{
        Analogamente con nuestro postenmascaramiento, se repite el mismo
        proceso aunque ahora, los parametros pedidos varian ligeramente.
        %}
        f=input("introduzca la frecuencia de los dos tonos en (Hz) = ");
        SPL_1=input("introduca el nivel del tono enmascarante en (dB) = ");
        SPL_2=input("introduzca el nivel del tono enmascarado en (dB) = ");
        t=input("introduzca el tiempo de separacion entre tonos (ms) = ");
        SPL_ref=94;
        %{
        una vez recogidos todos los parametros iniciales, pasamos a nuestra
        funcion dichos parametros.
        %}
        pretenmascaramiento(f,SPL_1,SPL_2,SPL_ref,t);
    elseif opcion==3
%% El enmascaramiento frecuencial 
% Es la disminución de la sonoridad de un tono
% a una cierta frecuencia, en presencia de otro tono simultáneo a una frecuencia
% diferente. Es decir, cuando el oído es expuesto a dos o más sonidos de 
% diversas frecuencias, existe la posibilidad de que uno de ellos camufle a 
% los demás y, por tanto, que éstos no se oigan.
% 
% Se presenta cuando dos tonos llegan al oído simultáneamente quedando uno de
% ellos enmascarado por el otro. Se pueden dar dos casos:
% 
% 1. Sonidos de baja frecuencia enmascaran a los de alta frecuencia.
% 2. Sonido de alta frecuencia enmascaran a los de baja frecuencia.
% 
% Es importante señalar que en el enmascaramiento en frecuencia será más 
%efectivo en el primer caso, ya que los tonos de alta frecuencia difícilmente
%enmascaran a los de una frecuencia menor. 
        %{
        pedimos parametros iniciales diferentes a los anteriores y se lo
        pasamos a nuestra funcion diseñada 
        %}
        f_1=input("introduzca la frecuencia del tono enmascarante (Hz) = ");
        f_2=input("introduzca la frecuencia del tono enmascarado (Hz) ");
        SPL_1=input("introduca el nivel del tono enmascarante en (dB) = ");
        SPL_2=input("introduzca el nivel del tono enmascarado en (dB) = ");
        SPL_ref=94;
        freqenmascarado(f_1,f_2,SPL_1,SPL_2,SPL_ref);
        
    elseif opcion==4
        n=3;
    end
end


