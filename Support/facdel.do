*This file is to generate the list of value label for m15 (delivery of birth)
*Etract the survey name and the lables and identify whether they are skilled or not.

global root "C:\Users\Guan\OneDrive\DHS\MEASURE UHC DATA"

* Define path for data sources
global SOURCE "${root}/RAW DATA/Recode VII"

* Define path for output data
global OUT "${root}/STATA/DATA/SC/FINAL"

* Define path for INTERMEDIATE
global INTER "${root}/STATA/DATA/SC/INTER"

* Define path for do-files
global DO "${root}/STATA/DO/SC/DHS/Recode VII"

* Define the country names (in globals) in by Recode
    /*
	do "${DO}/0_GLOBAL.do"
	*/ 
	
//please define your global here. 

foreach name in $DHScountries_Recode_VII{	
	gen m15_skill = 0 

	decode m15, gen(m15_lab)
	replace m15_skill = 1 if ///
	regexm(m15_lab, "other|shop|pharmacy|market|kiosk|relative|friend|church|drug|addo|hilot|traditional|cs private medical|cs public sector|no treatment") ///
	& !regexm(m15_lab,"ngo|hospital|medical center|traditional practioner$")
	replace m15_skill = . if mi(m15) | m15 == 99
	
	gen name = "`name'"
	keep m15* name
	}
	
	
	
	