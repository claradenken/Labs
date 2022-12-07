# Ironhack Data Analytics Final Project - Clara Hauke

## <span style="color:#ac3973"><em> Nonlinear prediction of the 2022/23 winter North Atlantic Oscillation index </em></span>

### <span style="color:#6699ff"> \#knn \#climateScience </span>

## Goal of the project:
Use selected climate variables in the Northern hemisphere to predict the evolution of the North Atlantic Oscillation (NAO) state in terms of the NAO index for winter 2022/23 with a nonlinear regression model based on k-nearest neighbors and a region selection algorithm


## Brief description of the dataset(s):
- Feature variables on a global grid (approx. 100 km x 100 km resolution, the regions are specified in the following list) taken from reanalysis ERA5 (https://www.ecmwf.int/en/forecasts/datasets/reanalysis-datasets/era5), spanning the time 1980 - 2021 for training the model, 2022 as "test data" for the prediction
	1. Sea surface temperature in the North Atlantic (October mean  <span style="color:#ac3973">SST</span>, xxx data points)
    2. Sea ice concentration in the Arctic (September + October mean <span style="color:#ac3973">SIT</span>, xxx data points)
    3. Snow depth in Eurasia (October mean <span style="color:#ac3973">SND</span>, xxx data points)
    4. Stratospheric temperature in 100 hPa height in Northern hemisphere (October mean <span style="color:#ac3973">TA</span>, xxx data points) <br> <br>

- Target variable: NAO index
	- one mean value for each winter (December 1st – February 28th) for 1980/81-2021/22 - 41 data points
    - determined via Principal Component Analysis for sea surface pressure data by the same model

## High-level Planning of the project, e.g:
<br> WEEK 1</br>
- MON / TUE - formulate goal and scope
- WED / THU - preprocessing: read, edit, detrend, standardize, area correction, calculate correlations and p-values, ice mask for sea surface temperature, save
- FRI - run sensitivity studies (with cross validation) and save knn predictions

<br> WEEK 2</br>
- MON - run algorithm that combines different selected regions
- TUE - knn predictions
- WED / THU - back up time if more time is needed
- FRI - create presentation


