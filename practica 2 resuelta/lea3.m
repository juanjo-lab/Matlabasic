
%{
Se creará ahora un programa ‘lea3.m’ que la siguiente secuencia de sonidos
1) ftono= 800 Hz, SPLtono= 94 dB, fruido= 1000 Hz, SPLruido= 14 dB
2) ftono= 800 Hz, SPLtono= 94 dB, fruido= 1000 Hz, SPLruido= 82 dB
3) ftono= 1200 Hz, SPLtono= 94 dB, fruido= 1000 Hz, SPLruido= 14 dB
4) ftono= 1200 Hz, SPLtono= 94 dB, fruido= 1000 Hz, SPLruido= 82 dB
Son 4 situaciones a considerar.
El alumno ha de reportar los ficheros wav producto de cada prueba, justificando en la memoria si
se produce o no enmascaramiento. Para las 4 pruebas, el nombre de los ficheros a reportar son los
siguientes: “enmascaramiento1.wav”, “enmascaramiento2.wav”, “enmascaramiento3.wav”,
“enmascaramiento4.wav”.
Realice una discusión de los resultados y comentar si el tono es capaz de enmascarar al ruido
%}
fs=44100;

%% Primera situacion
ftono_1=800;SPLtono_1=94;fruido_1=1000;SPLruido_1=14;
[x_final_1] = lea2(ftono_1,SPLtono_1,fruido_1,SPLruido_1);
%% segunda situacion
ftono_2=800;SPLtono_2=94;fruido_2=1000;SPLruido_2=82;
[x_final_2] = lea2(ftono_2,SPLtono_2,fruido_2,SPLruido_2);

%% tercera situacion
ftono_3=1200;SPLtono_3=94;fruido_3=1000;SPLruido_3=14;
[x_final_3] = lea2(ftono_3,SPLtono_3,fruido_3,SPLruido_3);

%% cuarta situacion
ftono_4=1200;SPLtono_4=94;fruido_4=1000;SPLruido_4=82;
[x_final_4] = lea2(ftono_4,SPLtono_4,fruido_4,SPLruido_4);

%% cargamos los audiowrite
audiowrite("enmascaramiento1.wav",x_final_1,fs);
audiowrite("enmascaramiento2.wav",x_final_2,fs);
audiowrite("enmascaramiento3.wav",x_final_3,fs);
audiowrite("enmascaramiento4.wav",x_final_4,fs);
%%
%{
Determine experimentalmente el nivel de enmascaramiento TMN para
 un tono de frecuencia 1000 Hz y 94 dB de SPL y una señal ruidosa 
de frecuencia central 1000 Hz y ancho de banda de 100Hz. 
%}
fs=44100;
ftono_u=1000;SPLtono_u=94;fruido_u=1000;SPLruido_u=SPLtono_u-35;
x_final_u=lea2(ftono_u,SPLtono_u,fruido_u,SPLruido_u);
%sound(x_final_u(:,3),fs);
audiowrite("TMN_35dB.wav",x_final_u,fs);
%%
%{
Considere a continuación el enmascaramiento de una señal ruidosa a un tono (NMT). Para
ello considere una señal ruidosa con frecuencia cental de 1000 Hz; 100 Hz de ancho de banda y 84
dB de SPL. Genere un tono puro de 1000 Hz e intensidad variable. Encontrar experimentalmente el
valor de la SPL a partir de la cual el tono es enmascarado por el ruido. Proceda de modo análogo al
caso anterior y proporcione un fichero de audio wav correspondiente nombrandole
“NTM_XXdB.wav”, siendo XX la diferencia de nivel del ruido respecto al tono para enmascararle.
Recordar, que en las lecciones en el aula se suministro el siguiente umbral:
%}
fs=44100;
ftono_u=1000;SPLtono_u=80-6;fruido_u=1000;SPLruido_u=80;
x_final_u=lea2(ftono_u,SPLtono_u,fruido_u,SPLruido_u);
sound(x_final_u(:,3),fs);
audiowrite("NTM_6dB.wav",x_final_u,fs);