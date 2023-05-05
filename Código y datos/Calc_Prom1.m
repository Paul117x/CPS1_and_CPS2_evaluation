%Cálculo para promedio minutal
%Programa para calcular el promedio cada minuto
function [CF1min] = Calc_Prom1(ACE,DF)
%Función utilizada para obtener el valor romedio de cada minuto del valor
%del error de control de área usada en el CPS1.

global Bi dt1
m = 0; ACEprom = zeros(dt1,1); DFprom = ACEprom;
a = zeros(60,dt1); b = a;

%El ACE se separa en muestras de 1 minuto y se guardar� el valor promedio
%en una matriz

for n = 1:dt1
    a(:,n) = ACE((1+60*m):(60+60*m));
    b(:,n) = DF((1+60*m):(60+60*m));
    ACEprom(n) = sum(a(:,n))/(60*(-10*Bi));
    DFprom(n) = sum(b(:,n))/60;
    m = m+1;
end

CF1min = ACEprom .* DFprom;
end