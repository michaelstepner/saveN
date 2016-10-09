**save12** and **save13** assure that the same code shared across multiple computers will save Stata datasets in the same `.dta` format, regardless of the host computer's version of Stata. This facilitates collaborations between computers using different versions of Stata.

## Motivation
Stata's inability to open datasets created by newer versions of Stata is a common source of frustration in collaborations that share Stata datasets between computers with multiple versions of Stata.

There are various tools to transfer `.dta` files between multiple versions of Stata, ranging from [saveold](http://www.stata.com/help.cgi?saveold) to [use10/use12/use13](http://radyakin.org/transfer/stata2stata/) to [Stat/Transfer](http://www.stattransfer.com/). But there is no built-in Stata command that consistently saves datasets in the same format. Code that uses `save` or `saveold` will save to a different format depending on which version of Stata is running the code.

`save12` and `save13` always save datasets to the same `.dta` format, no matter which version of Stata is running them. There are various scenarios where this is useful:

* Suppose one collaborator has Stata 12, another has Stata 14, and they share a common code base and datasets.
	* If the code is written using `saveold, version(12)`, the code won't run in Stata 12.
	* If the code is written using `save`, the datasets can't be read in Stata 12.
	* If the code is written using `save12`, both collaborators can run the code and read the resulting data.
* Suppose you're creating datasets to be published online, and wish to publish them in an older `.dta` format to maximize their accessibility. If the code is written using `save12` or `save13`, it's guaranteed to produce the right `.dta` format no matter where the code is run.

## save13

**save13** provides a consistent command to save datasets in Stata 13 format.

**save13** has been tested to work in Stata 13 and Stata 14. It will continue to work correctly in future versions of Stata so long as they maintain the same `saveold` syntax as Stata 14, with an option of `version(13)`.

## save12

**save12** provides a consistent command to save datasets in Stata 12 format.

**save12** has been tested to work in Stata 12, 13 and 14. It will continue to work correctly in future versions of Stata so long as they maintain the same `saveold` syntax as Stata 14, with an option of `version(12)`.

Stata 11 can read datasets in Stata 12 format, but cannot write datasets in Stata 12 format.