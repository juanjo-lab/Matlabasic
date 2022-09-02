%funcion retraso
function [devuelve]=fundelay(fs,delay,senal,tipo)

delaysenal=zeros(delay*fs,1);%retraso de la se�al

if(tipo==1)%    mono 
    
canal0=senal(:,1);%volcamos la se�al en un canal, mono-canal
canal0=[delaysenal;canal0];%le a�adimos el retardo a la se�al original 
devuelve=[canal0 canal0];%devolvemos nuestra funcion

else%           estereo 
    
canal1=senal(:,1);
canal2=senal(:,2);
canal1=[delaysenal;canal1];
canal2=[delaysenal;canal2];
devuelve=[canal1 canal2];
end
end

