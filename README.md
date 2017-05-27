# Rainy Lake Hydrology

This repository holds a collection of computational notebooks analyzing the hydrology of the Rainy River watershed on the Minnesota/Ontario border. 

Rainy River discharges of over 50,000 square kilometers, which is greater than the area of Switzerland and slightly less than than the area of the state of West Virginia in the U.S. The Rainy River Basin is part of the Canadian Shield which is the largest freshwater surface are in the world. Fully 25% of the world's wetlands are in Canada, and 7% of the world's renewable water supply.

## Usage

The code, data, and descriptive materials are available as public [github repository](https://github.com/jckantor/Rainy-Lake-Hydrology). The notebooks were developed and can be executed in the open source [Anaconda](https://www.continuum.io/downloads) python distribution available at no cost from [Continuum Analytics](https://www.continuum.io/).

## Presentations

A summary of presentations based on the data and calculations in this repository. 

* [Estimating Inflows and Forecasting Ice-Out for Adaptive Management of the Rainy Lake and Namakan Reservoir](https://docs.google.com/presentation/d/1Sb2jcpGald0PixVG0X6MljYXRJnRvAKkBgfKyz9ogbE/pub?start=false&loop=false&delayms=3000&slide=id.g161129bc08_1_1909). 2016 International Rainy-Lake of the Woods Watershed Forum, March 9, 2017, International Falls, MN.
* [Multivariable Control of Lake Levels and Stream Flows in the Namakan Reservoir/Rainy Lake Watershed](https://github.com/jckantor/Rainy-Lake-Hydrology/blob/master/presentations/Watershed%20Forum%202016/Watershed_Forum_2016_Slides.pdf). Presented at the 2016 International Rainy-Lake of the Woods Watershed Forum, March 10, 2016, International Falls, MN.
* [Model predictive control strategies for implementing rule curves for the Namakan Reservoir / Rainy Lake Watershed](https://github.com/jckantor/Rainy-Lake-Hydrology/blob/master/presentations/Watershed%20Forum%202015/Watershed_Forum_2015_Slides.pdf). Presented at the 2015 International Rainy-Lake of the Woods Watershed Forum, March 11-12, 2015, International Falls, MN.
* [Why is Rainy Lake so Difficult to Control?](https://github.com/jckantor/Rainy-Lake-Hydrology/blob/master/presentations/RLPOA%20Open%20House%202015%20Fort%20Frances/RLPOA_Open_House_2015_Slides.pdf). Presented to the Rainy Lake Property Owners Association, August 6, 2015, Thunderbird Lodge, International Falls, Minnesota.

## Data Sources

The following notebooks provide tools to access relevant level, flow, and precipitation data for an analysis of the hydrology of Rainy Lake. These notebooks 'pickle' relevant data series as Pandas series and dataframes for import into other notebooks.

* [Water Survey of Canada - HYDAT](notebooks/Water_Survey_of_Canada_HYDAT.ipynb). Reads data from the HYDAT data tables extracted from HYDAT.mdb. Creates data caches `data/WSC_FLOWS.csv`, `data/WSC_LEVELS.csv`, and `data/WSC_STATIONS.csv` for use in other notebooks. This is a time-consuming operation that only needs to be done on updates to HYDAT.
* [Water Survery of Canada - Usage](notebooks/Water_Survey_of_Canada_Usage.ipynb) Includes mapping functions, and several use cases including flow distributions on state-of-nature streams in the Rainy River watershed.
* [Namakan Lake Water Levels](notebooks/Namakan_Lake_Water_Levels.ipynb). Reads the WSC data cache to create a time series `data/NL.pkl` of historical levels for Namakan Lake. Level data from stations located at Namakan Lake above Kettle Falls and at Squirrel Island and are concatenated, with means used for overlapping dates.
* [Rainy Lake Water Levels](notebooks/Rainy_Lake_Water_Levels.ipynb). Reads the WSC data cache to create a reconciled time series `data/RL.pkl` of historical levels for Rainy Lake.  The difference in reconciled measurements at Bear's Pass and Fort Frances is used to estimate a standard error for lake level measurement.
* [Rainy River Flows](notebooks/Rainy_River_Flows.ipynb). Reads the WSC data cache to create a time series `data/RR.pkl` of historical flows for Rainy River.  
* [Global Historical Climatology Network](notebooks/Global_Historical_Climatology_Network.ipynb). Reads historical temperature and preciptation records for station KINL located at International Falls, Minnesota.
* [Ice Out Dates](notebooks/Ice_Out_Dates.ipynb). Creation of time series for historical ice-out dates on Rainy Lake using data from the Minnesota DNR.
* [Rule Curves for Rainy and Namakan Lakes](notebooks/Rule_Curves_for_Rainy_and_Namakan_Lakes.ipynb). Create a time series representation of rule curves for Rainy and Namakan Lakes.
* [Stage-Volume Relationships for Rainy and Namakan Lakes](notebooks/Stage-Volume_Relationships.ipynb). Regression of Stage-Volume data from the International Joint Commission for Rainy and Namakan Lakes.

## Analysis of Lake Level Behavior 1970-2010

* [Imputing an Effect of Rule Curve Changes on Rainy River Flows](notebooks/Imputing_an_Effect_of_Rule_Curve_Changes_on_Rainy_River_Flows.ipynb)
* [Changes in Rainy River Flows 1970-2010](notebooks/Changes_in_Rainy_River_Flows_1970-2010.ipynb)
* [Namakan and Rainy Lake Water Levels 1970-2010](notebooks/Namakan_and_Rainy_Lake_Water_Levels_1970-2010.ipynb)
* [Precipitation at Internatonal Falls 1970-2010](notebooks/Precipitation_at_International_Falls_1970-2010.ipynb)
* [Flow Constrictions on Upper Rainy River](notebooks/Flow_Constrictions_on_Upper_Rainy_River.ipynb)

## Mitigation through Advanced Control and Optimization ###

* [Matlab/Simulink Implementation of 2000 Rule Curves](matlab/Rainy_Lake_Simulation_Model.pdf) [[.m](https://github.com/jckantor/Rainy-Lake-Hydrology/blob/master/Rainy_Lake_Simulation_Model_Script.m)][[.mat](http://jckantor.github.io/Rainy-Lake-Hydrology/pdf/Rainy)][[.slx](https://github.com/jckantor/Rainy-Lake-Hydrology/blob/master/Rainy_Lake_Simulation_Model.slx)]
* [Estimating Rainy Lake Inflows 1971-2010](notebooks/Estimating_Rainy_Lake_Inflows_1971-2010.ipynb)
* [Ice-Out Predictor](notebooks/Ice_Out_Predictor_for_Rainy_Lake.ipynb)
* [Freshet Predictor](notebooks/Freshet_Predictor_for_Rainy_Lake.ipynb)
* [Lumped Parameter Model for Lake Dynamics](notebooks/Lumped_Parameter_Model_for_Lake_Dynamics.ipynb)
* [Feasibility of Rainy Lake Rule Curves](notebooks/Feasibility_of_Rainy_Lake_Rule_Curves.ipynb)
* [Harmonizing Rule Curves to Seasonal Inflow](notebooks/Harmonizing_Rule_Curves_to_Seasonal_Inflows.ipynb)
* Feedforward Control for the Dam at International Falls
* [Improved Prediction of Inflows (stub)](notebooks/Improved_Prediction_of_Inflows.ipynb)
* [Model Predictive Control of Dams at Kettle Falls and International Falls (stub)](notebooks/Model_Predictive_Control_of_Dams_at_Kettle_Falls_and_International_Falls.ipynb)