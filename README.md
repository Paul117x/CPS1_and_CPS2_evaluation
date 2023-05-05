# CPS1 and CPS2 indices evaluation
This repository contains code, the model, data and extra documentation used for the manuscript "Analysis of the CPS1 and CPS2 Indices Behavior in a Two-Area Power System Considering Renewable Energy Sources" published in the journal Latin America Transactions of the IEEE.

The code for the evaluation of both CPS indices is based on NERC's standards for said evaluations. The code itself is commented so that the user can understand what it is doing on every step.
`Inicializacion.m` must be **run first** with all data (*.xlsx) files ***in the same directory***, this needs to be done to load the data into Matlab and subsequently use it in the Simulink model.

The model was done using data from different books and some real data of the Baja California interconnection, as found in the references of the paper.
To simulate the loss of renewable power, the subsistem "Escenario de simulación" modifies the loaded data for different days of the month (These days and hours are denoted in the file 'Escenarios de simulación.xlsx'), making them gradually lose up to a certain percent of the supplied power for that time period.

The data for this simulation are in the files `demanda_agosto.xlsx`, `demanda_diciembre.xlsx`, `generacion_agosto.xlsx` and `generacion_diciembre.xlsx`. This data can be found in the Centro Nacional de Control de Energía (CENACE) website, as seen on the references.

After a simulation scenario is selected on `Inicializacion.m`, the Simulink model `Modelo_del_sistema.slx` must be run with a simulation time of 2678400, the total amount of seconds in a 31 day month.
**After the simulation finishes**, run `Calc_ind_CPS.m` and the percentage of compliance will be shown on Matlab's command window.

Data from frequency deviation, area control error, generation from conventional sources **is logged** into Matlab's workspace, you can use that data to create figures.
