*! version 0.1.0  25sep2015  Michael Stepner, stepner@mit.edu
program define save13
	version 13
	
	syntax [anything], [nolabel replace all orphans emptyok]
	
	if c(stata_version)>=13 & c(stata_version)<14 {
		save `anything', `nolabel' `replace' `all' `orphans' `emptyok'
	}
	else if c(stata_version)>=14 {
		saveold `anything', `nolabel' `replace' `all' `orphans' `emptyok' version(13)
	}
	else {
		di as error "Must have Stata version 13 or higher to save in Stata 13 format."
		error 499
	}

end
