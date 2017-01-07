# ReadMe
Alexandre Bagnoud  
06/01/2017  

This github repository details the statistical analyses carried out in the paper xxx in order to understand which environmental parameters drive anammox bacteria in terrestrial ecosystems.

#### Files:

* ReadMe.md: this file
* amx_matrix.csv: Data set
* Script_with_complete_output.md: R script and complete consol output
* Script_with_short_output.md: R script and short consol output, for a better readability
* Script.R: R version of the script

#### Description of variables of data matrix (in amx_matrix.csv):

* ```SampleID```: Unique sample identifier. The first digit correspond to the soil (1 to 4) and the second digit to the sample number in the soil profile.
* ```Soil```: Soil type, 1 to 4.
* ```Depth```: Depth of the sample in the soil profile. Unit : cm.
* ```AMXcopiesNb```: Number of anammox 16S rRNA genes detected. Unit : copies g-1 of dry soil.
* ```AOBcopiesNb```: Number of bacterial amoA genes detected. Unit : copies g-1 of dry soil. 
* ```AOBcopiesNb```: Number of archaeal amoA genes detected. Unit : copies g-1 of dry soil.
* ```DaysBelowWaterTable```: Number of days per year that a soil sample is spending below the water table. Unit : day.
* ```LOI```: Loss on ignition of soil samples. Unit : % (g/g).
* ```N```: Nitrogen in soil samples. Some values were interpolated by linear combination in order to match the depth of other variables. Unit : % (g/g).
* ```C```: Carbon in soil samples. Some values were interpolated by linear combination in order to match the depth of other variables. Unit : % (g/g).
* ```FeIISoil```: Concentration of Fe(II) extracted from soil samples. Some values were interpolated by linear combination in order to match the depth of other variables. Unit : umol g-1 of dry soil.
* ```FeIIISoil```:  Concentration of colloidal Fe(III) extracted from soil samples. Some values were interpolated by linear combination in order to match the depth of other variables. Unit : umol g-1 of dry soil.
* ```pHSoil```: pH H20 of soil samples.
* ```NH4Soil```:  Concentration of NH4+ extracted from soil samples. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 4. Unit : umol g-1 of dry soil.
* ```NO3Soil```:  Concentration of NO3- extracted from soil samples. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 4. Unit : umol g-1 of dry soil.
* ```avNH4Water```: Average concentration of NH4+ in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1. Unit : uM.
* ```avNO2Water```: Average concentration of NO2- in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1. Unit : uM.
* ```avNO3Water```: Average concentration of NO3- in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1. Unit : uM.
* ```avpHWater```:  Average pH in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1.
* ```avO2Water```: 	Average concentration of O2 in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1. Unit : mg l-1.
* ```avFeIIWater```: Average concentration of Fe(II) in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1. Unit : uM. 
* ```avFeIIIWater```: Average concentration of colloidal Fe(III) in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1. Unit : uM.
* ```avSIIWater```: Average concentration of S(-II) in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1. Unit : uM.
* ```avSO4water```: Average concentration of SO42- in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1. Unit : uM.
* ```NitrifRate```: Nitrification rates measured in vitro for few samples per soil type. Unit : umol NH4+ g-1 dry soil h-1.
* ```BOD```: Biological oxygen demand, measured during 5 days for samples from Soil 3 only. Unit : mg O2 g-1 dry soil.

Note: Concentration of NO2- extracted from soil samples was not included in the data set, as this value is null for all observations.
