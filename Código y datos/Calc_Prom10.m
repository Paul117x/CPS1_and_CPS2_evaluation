function Prom10 = Calc_Prom10(ACE)
%Función utilizada para obtener el valor promedio de cada 10 minutos del
%valor del Error de Control de Área usado para el CPS2.
global dt2
m = 0; Prom10 = zeros(dt2,1);
%El ACE se separa en muestras de 10 minutos y se guardan el valor promedio
%en una matriz.
for n = 1:dt2
    a = ACE((1 + 600*m):(600 + 600*m));
    Prom10(n) = sum(a)/600;
    m = m + 1;
end
end