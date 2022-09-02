function [devuelve]=funreb(fs,delay,senal,tipo,reb)
% delaysenal=zeros(delay*fs);
TD = round(fs*delay);
if(tipo==1)%mono
    canalmono=senal(:,1);%volcamos la señal en su canal mono
    aux_canalmono=zeros(length(senal),1);%declaramos un vector de ceros que iremos modificando con la señal
    for i=1:length(senal)
           if(i<TD+1)%en caso de tener alguna muestra negativa
              aux_canalmono(i)=senal(i,1);
           else
             aux_canalmono(i)=senal(i,1)+reb.*aux_canalmono(i-TD);%calculo para añadir la reberberancia 
           end
    end
    devuelve=[aux_canalmono aux_canalmono];%volvemos a volcar
    
else%estereo
    canalizq= senal(:,1);%volcamos en cada canal la señal que le corresponde
    canalder=senal(:,2);
    
    %Definimos un vector de ceros para el canal izquierdo que
    %posteriormente vamos a rellenar
    canalL = zeros(length(canalizq),1);
    %Definimos un vector de ceros para el canal derecho que
    %posteriormente vamos a rellenar
    canalR = zeros(length(canalder),1);
    
    
    %Realizamos un bucle for encargado de realizar la reberveracion
    for i=1:length(senal)
    % Para evitar que Matlab tome indices negativos dado que n est? a
    % restando a TD lo que se hace es igualar los canales de salida con los
    % canales de entrada
    if(i<TD+1)
    canalL(i) = senal(i,1);%para la muestra inicial y muestras negativas
    canalR(i) = senal(i,2);
     else
    %Se realiza la reverberacion para cada canal que es simplemente sumar
    %la senal original y una version atenuada y desplaza de y
    canalL(i) = senal(i,1)+reb.*canalL(i-TD);
    canalR(i) = senal(i,2)+reb.*canalR(i-TD);
    
    end
end
    %Unificamos en una matriz los dos canales de salida (el izquierdo y el
%derecho)
devuelve = [canalL canalR];


end
