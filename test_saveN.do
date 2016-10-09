
foreach saveN in "save12" "save13" {

	clear all
	tempfile file

	* "emptyok" option not supported
	rcof "`saveN' `file', emptyok" == 198

	* "orphans" option not supported
	rcof "`saveN' `file', orphans" == 198

	* test saving and "replace"
	sysuse auto
	`saveN' `file'
	rcof "`saveN' `file'" == 602 // already exists, no 'replace'
	`saveN' `file', replace

	* test "nolabel"
	`saveN' `file', nol replace
	`saveN' `file', nolabel replace

	assert "`:label origin 1'"=="Foreign"
	use `file', clear
	assert "`:label origin 1'"=="1"

	* test "all"
	sysuse auto, clear
	reg price mpg
	`saveN' `file', all replace
	clear
	use `file'
	predict yhat if e(sample)
	assert !mi(yhat) // "all" was specified with save, e(sample) was preserved

	sysuse auto, clear
	reg price mpg
	`saveN' `file', replace
	clear
	use `file'
	predict yhat if e(sample)
	assert mi(yhat) // "all" wasn't specified with save, e(sample) wasn't preserved

}
