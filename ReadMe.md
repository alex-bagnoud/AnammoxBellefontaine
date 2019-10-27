This github repository details the statistical analyses carried out in the paper **Environmental factors determining distribution and activity of anammox bacteria in minerotrophic fen soils** written by Alexandre Bagnoud, Sylvia Guye-Humbert, Brigitte Schloter-Hai, Michael Schloter and Jakob Zopfi and publish in *Insert journal name here*.

This work describes the distribution, diversity and activy of anammox along a sharp soil gradient, from an amended pasteure to an ombrotrophic peatbog. The aim of the statistical analysis presented here is to understand which environmental parameters are controlling anammox distribution in this soil system.

#### Files:
This repository inlcude the following files:

* [amx_matrix.csv](amx_matrix.csv) includes the complete data set for this analysis
* [Script_with_complete_output.md](Script_with_complete_output.md) is the markdown version of the R script, with the complete output.
* [Script_with_short_output.md](Script_with_short_output.md) is the markdown version of the R script, with a simplified consol output, for a better readability
* [Script.R](Script.R]) is the R script used for this analysis.

#### Description of variables of data matrix:

Here is the exhaustive list of all the variables in [amx_matrix.csv](amx_matrix.csv) and their description:

* ```SampleID```: Unique sample identifier. The first digit correspond to the soil (1 to 4) and the second digit to the sample number in the soil profile.
* ```Soil```: Soil type, 1 to 4.
* ```Depth```: Depth of the sample in the soil profile. Unit : cm.
* ```AMXcopiesNb```: Number of anammox 16S rRNA genes detected. Unit : copies g<sup>-1</sup> of dry soil.
* ```AOBcopiesNb```: Number of bacterial amoA genes detected. Unit : copies g<sup>-1</sup> of dry soil. 
* ```AOBcopiesNb```: Number of archaeal amoA genes detected. Unit : copies g<sup>-1</sup> of dry soil.
* ```DaysBelowWaterTable```: Number of days per year that a soil sample is spending below the water table. Unit : day.
* ```LOI```: Loss on ignition of soil samples. Unit : % (g g<sup>-1</sup>).
* ```N```: Nitrogen in soil samples. Some values were interpolated by linear combination in order to match the depth of other variables. Unit : % (g g<sup>-1</sup>).
* ```C```: Carbon in soil samples. Some values were interpolated by linear combination in order to match the depth of other variables. Unit : % (g g<sup>-1</sup>).
* ```FeIISoil```: Concentration of Fe(II) extracted from soil samples. Some values were interpolated by linear combination in order to match the depth of other variables. Unit : umol g<sup>-1</sup> of dry soil.
* ```FeIIISoil```:  Concentration of colloidal Fe(III) extracted from soil samples. Some values were interpolated by linear combination in order to match the depth of other variables. Unit : umol g<sup>-1</sup> of dry soil.
* ```pHSoil```: pH H<sub>2</sub>O of soil samples.
* ```NH4Soil```:  Concentration of NH<sub>4</sub><sup>+</sup> extracted from soil samples. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 4. Unit : umol g<sup>-1</sup> of dry soil.
* ```NO3Soil```:  Concentration of NO3- extracted from soil samples. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 4. Unit : umol g<sup>-1</sup> of dry soil.
* ```avNH4Water```: Average concentration of NH<sub>4</sub><sup>+</sup> in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1. Unit : uM.
* ```avNO2Water```: Average concentration of NO2- in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1. Unit : uM.
* ```avNO3Water```: Average concentration of NO3- in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1. Unit : uM.
* ```avpHWater```:  Average pH in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1.
* ```avO2Water```: 	Average concentration of O2 in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1. Unit : mg l<sup>-1</sup>.
* ```avFeIIWater```: Average concentration of Fe(II) in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1. Unit : uM. 
* ```avFeIIIWater```: Average concentration of colloidal Fe(III) in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1. Unit : uM.
* ```avSIIWater```: Average concentration of S(-II) in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1. Unit : uM.
* ```avSO4water```: Average concentration of SO42- in interstitial water samples during an annual cycle. Some values were interpolated by linear combination in order to match the depth of other variables. Not measured in Soil 1. Unit : uM.
* ```NitrifRate```: Nitrification rates measured in vitro for few samples per soil type. Unit : umol NH4+ g<sup>-1</sup> dry soil h<sup>-1</sup>.
* ```BOD```: Biological oxygen demand, measured during 5 days for samples from Soil 3 only. Unit : mg O2 g<sup>-1</sup> dry soil.

Note: Concentration of NO2- extracted from soil samples was not included in the data set, as this value is null for all observations.
