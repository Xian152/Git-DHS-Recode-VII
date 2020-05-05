******************************
*** Woman Cancer *********** 
******************************   


*w_papsmear	Women received a pap smear  (1/0)
gen w_papsmear = .

*w_mammogram	Women received a mammogram (1/0)
gen w_mammogram = .


capture confirm variable s714dd s714ee 
if _rc==0 {
    replace w_papsmear=1 if s714dd==1 & s714ee==1
	replace w_papsmear=0 if s714dd==0 | s714ee==0
	replace w_papsmear=. if s714dd==9 | s714ee==9
}

capture confirm variable s1110_f s1110_g 
if _rc==0 {
	replace w_papsmear=0 if s1110_f!=.
	replace w_papsmear=1 if s1110_g==1
	replace w_papsmear=. if s1110_f==8 | s1110_g==8
	replace w_papsmear=. if v012 < 20
}

capture confirm variable s1017 s1020 
if _rc==0 {
    replace w_mammogram=. if s1017==. | s1017==9 | s1020==9 
}

capture confirm variable s1110_c
if _rc==0 {
    
	replace w_mammogram = (s1110_c == 1) 
	replace w_mammogram=. if s1110_c == . | s1110_c == 8
	replace w_papsmear=. if v012 < 20
}


*Add reference period.
gen w_papsmear_ref = .

if inlist(name, "Jordan2017") {
	replace w_papsmear_ref = "ever"
}


gen w_mammogram_ref = .

if inlist(name, "Jordan2017") {
	replace w_mammogram_ref = "ever"
}


//if not in adeptfile, please generate value, otherwise keep it missing. 

//if the preferred recall is not available (3 years for pap, 2 years for mam) use shortest other available recall 


* Add Age Group.

gen w_mammogram_age = .

if inlist(name, "Jordan2017") {
	replace w_mammogram_age = "20-49"
}

gen w_papsmear_age = .

if inlist(name, "Jordan2017") {
	replace w_papsmear_age = "20-49"
}

//if not in adeptfile, please generate value, otherwise keep it missing. 


