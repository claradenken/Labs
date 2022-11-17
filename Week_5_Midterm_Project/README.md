# Ironhack Data Analytics Midterm Project - Clara Hauke

## <span style="color:#ac3973"><em> Prediction of the winter North Atlantic Oscillation index via linear regression </em></span>

### <span style="color:#6699ff"> \#Modeling \#LinearRegression \#ClimateScience </span>

## Goal of the project:
Goal #1: use selected climate variables in the Northern hemisphere to predict the evolution of the North Atlantic Oscillation (NAO) state in terms of the NAO index with a linear regression model <br>
Goal #2: create dashboard to visualize the modeling output


## Brief description of the dataset(s):
- Feature variables on a global grid (approx. 100 km x 100 km resolution, the regions are specified in the following list) taken from reanalysis ERA5 (https://www.ecmwf.int/en/forecasts/datasets/reanalysis-datasets/era5) spanning the time 1980 - 2021
	1. Sea surface temperature in the North Atlantic (October mean  <span style="color:#ac3973">SST</span>, xxx data points)
    2. Sea ice concentration in the Arctic (September + October mean <span style="color:#ac3973">SIT</span>, xxx data points)
    3. Snow depth in Eurasia (October mean <span style="color:#ac3973">SND</span>, xxx data points)
    4. Stratospheric temperature in 100 hPa height in Northern hemisphere (October mean <span style="color:#ac3973">TA</span>, xxx data points) <br> <br>

- Target variable: NAO index
	- one mean value for each winter (December 1st – February 28th) for 1980/81-2021/22 - 41 data points
    - determined via Principal Component Analysis for sea surface pressure data by the same model

## High-level Planning of the project, e.g:
- Day 1 - formulate goal and scope
- Day 2 - reading and transforming data into manageable format and datatype in jupyter notebook, EDA, data cleaning if necessary
- Day 3 - grid point selection process and linear regression modeling
- Day 4 - create dashboard and presentation
- Day 5 - present project