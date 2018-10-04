# Change Log

All noteable changes to this project will be documented in this file. This project adheres to [Semantic Versioning](http://semver.org/)

## [1.2.0] – 2018-10-04

* add installer (by [@dangreco](https://github.com/dangreco))

## [1.1.0] – 2018-06-14

### Fixed

* Corrected the wrong quality default 0. It should be an integer from 1–31, according to https://trac.ffmpeg.org/wiki/Encode/MPEG-4. Thanks for reporting @LaKing.

## [1.0.0] – 2018-01-27

### Added

* bats tests
* Contributor's notice for running bats tests
* Test footage

### Changed

* Video recognition is now based on mime type, not anymore based on file suffixes

### Fixed

* Calling convert-footage without parameter will print the help
* Calling convert-footage with illegal parameters will print the help
* Using convert-footage with a folder that doesn't contain videos will print an appropriate hint and exit (crashed before)
* File names and folder names with spaces are now handled (crashed before)

## [0.1.2] – 2018-01-08

### Fixed

* Still the wrong download URL. Now it's fixed.

## [0.1.1] – 2018-01-08

### Fixed

* Wrong download URL in README


## [0.1.0] – 2018-01-08


### Added

* Usage message
* Named options
* Argument validation

### Changed

* Merged two scripts into one and renamed the tool to `convert-footage`

### Fixed

* Already converted footage will not be converted again
* Conversion results will not be converted again

