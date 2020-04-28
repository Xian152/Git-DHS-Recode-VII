*w_papsmear	Women received a pap smear  (1/0)
gen w_papsmear = .

*w_mammogram	Women received a mammogram (1/0)
gen w_mammogram = .

//Add another variable about the recall period country specific.

/*
capture confirm variable s714dd s714ee 
if _rc==0 {
    replace w_papsmear=1 if s714dd==1 & s714ee==1
	replace w_papsmear=0 if s714dd==0 | s714ee==0
	replace w_papsmear=. if s714dd==9 | s714ee==9
}
*/
capture confirm variable s1110_f s1110_g 
if _rc==0 {
	gen w_papsmear=0 if s1110_f!=.
	replace w_papsmear=1 if s1110_g==1
}

capture confirm variable s1017 s1020 
if _rc==0 {
    replace w_mammogram=. if s1017==. | s1017==9 | s1020==9
}
