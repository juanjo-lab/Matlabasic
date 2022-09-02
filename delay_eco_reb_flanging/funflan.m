%flanging
function [devuelve]=funflan(fs,delay,senal,tipo,atenuacion,fc)
% delaysenal=zeros(delay*fs,1);
if(tipo==1)
canalmono=senal(:,1);
aux_canalmono=zeros(length(senal),1);
for i=1:length(senal)
    D=abs(fix(fs*delay*cos(2*pi*fc*i)));
       if(D>=i)
           aux_canalmono(i)=canalmono(i);
       else
           aux_canalmono(i)=canalmono(i)+atenuacion.*canalmono(i-D);
       end
end
devuelve=senal(:,1) + [aux_canalmono aux_canalmono];

else%estereo
    
    canalR=senal(:,1);
    canalL=senal(:,2);
    aux_canalR=zeros(length(canalR),1);
    aux_canalL=zeros(length(canalL),1);
    
    for i=1:length(senal)
       D=abs(fix(fs*delay*cos(2*pi*fc*i)));
       
       if(D>=i)
           aux_canalR(i)=senal(i,1);
           aux_canalL(i)=senal(i,2);
       else 
           aux_canalR(i)=canalR(i)+atenuacion.*canalR(i-D);
           aux_canalL(i)=canalL(i)+atenuacion.*canalL(i-D);
        
       end
    end
    devuelve=senal(:,1) + [aux_canalL aux_canalR];
        
        
    end
    
    
end