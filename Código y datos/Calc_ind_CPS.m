%Calcu_CPS1.m
clc; global Bi dt1 dt2
%Programa para calcular el CPS1
%Se declaran las variables constantes para el cÃ¡lculo del CPS1
Bi = -29.4; %Excitación externa de frecuencia del Área de CFE
e1 = 22.8e-3; %Valor objetivo de la raíz media cuadrada del error de
              %frecuencia promedio minutal basado en el rendimiento de la 
              %frecuencia de un año. Pertenece a toda la interconexión de
              %las regiones del WECC.
             
%Se declara la matriz de valores del ACE con la que se trabajará y el
%tiempo total que dura la simulación. También se declara cuantas muestras
%habrá con un periodo de 10 minutos (600 segundos).

ACEw = ACE(2:length(ACE),2);
dFw = dF(2:length(dF),2);
t = length(ACEw); dt1 = t/60;

%Se obtiene el valor del promedio minutal de todo el muestreo de datos.
[CF1min] = abs(Calc_Prom1(ACEw,dFw));

CF = (sum(CF1min)/(44640))/(e1^2);

Icps1 = 100*(2-CF);

fprintf('El valor del índice CPS1 es de: %g%%\n',Icps1);
if Icps1 >= 100
    fprintf('No se violan los límites del estándar CPS1 para el caso.\n')
elseif Icps1 < 100 && Icps1 >= 95
    fprintf('La violación del estándar CPS1 se encuentra en el nivel 1.\n')
elseif Icps1 < 95 && Icps1 >= 90
    fprintf('La violación del estándar CPS1 se encuentra en el nivel 2.\n')
elseif Icps1 <  90 && Icps1 >= 85
    fprintf('La violación del estándar CPS1 se encuentra en el nivel 3.\n')
else
    fprintf('La violación del estándar CPS1 se encuentra en el nivel 4.\n')
end

Bs = -1819; %Suma de las excitaciones externas de frecuencia de todas las 
            %áreas del WECC.

e10 = 7.3e-3; %Valor objetivo de la raíz media cuadrada del error de
%frecuencia promedio 10-minutal basado en el rendimiento de la frecuencia
%de un año. Pertenece a toda la interconexión de las regiones del WECC.

L10 = 1.65*e10*sqrt((-10*Bi)*(-10*Bs)); %Indicador L10. Mostrado en los
%datos de la NERC que tiene un valor de 27.9 (2019) para CFE (México).

%Se declara la matriz de valores del ACE con la que se trabajará y el
%tiempo total que duró la simulación. También se declara cuantas muestras
%habrá con un periodo de 10 minutos (600 segundos).
ACEw = ACE(2:length(ACE),2);
t = length(ACEw); dt2 = t/600;

%Se obtiene el valor del promedio 10-minutal de todo el muestreo de datos.
Prom10 = abs(Calc_Prom10(ACEw));

%Se calcula el índice del estándar de rendimiento de control en porcentaje.
Icps2 = sum(Prom10 <= L10)/dt2*100;
fprintf('\nEl estándar CPS2 se cumplió para el %g%% de las muestras.\n'...
    ,Icps2);
if Icps2 >= 90
    fprintf('No se violan los límites del estándar CPS2 para el caso.\n')
elseif Icps2 < 90 && Icps2 >= 85
    fprintf('La violación del estándar CPS2 se encuentra en el nivel 1.\n')
elseif Icps2 < 85 && Icps2 >= 80
    fprintf('La violación del estándar CPS2 se encuentra en el nivel 2.\n')
elseif Icps2 < 80 && Icps2 >= 75
    fprintf('La violación del estándar CPS2 se encuentra en el nivel 3.\n')
else
    fprintf('La violación del estándar CPS2 se encuentra en el nivel 4.\n')
end