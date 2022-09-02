%funcion eco
function [devuelve]=funeco(fs,delay,senal,tipo,eco)

delaysenal=zeros(delay*fs,1);%calculo de retraso

if(tipo==1)%mono
    
canal0=senal(:,1);
senaleco=[delaysenal;eco.*canal0];
devuelve=[canal0;delaysenal]+senaleco;

else%estereo
    
canal1=senal(:,1);%este seria nuestro canal derecho 
canal2=senal(:,2);

canal1_aux=[delaysenal;canal1];%le añadimos retardo
canal2_aux=[delaysenal;canal2];

senaleco=eco.*[canal1_aux canal2_aux];%multipicamos el eco por el retardo

canal1_aux=[canal1;delaysenal];%ajustamos la señal con eco y nuestra original con el mismo tamaño
canal2_aux=[canal2;delaysenal];

devuelve=[canal1_aux canal2_aux] +senaleco;%sumamos todo
end
end