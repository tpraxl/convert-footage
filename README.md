# Convert footage

[davinci]: https://www.blackmagicdesign.com/products/davinciresolve
[mit]: http://opensource.org/licenses/MIT
[script]: https://raw.githubusercontent.com/tpraxl/convert-footage/master/convert-footage
[bats]: https://github.com/bats-core/bats-core
[bats-issue]: https://github.com/bats-core/bats-core/pull/55

Provide script to convert video footage for [Davinci Resolve 14 Free][davinci] (Linux).

## Supported codec / container combination

The free version of Davinci on linux has not much support for codecs. I found a working solution by testing out lots of different container
format / audio codec / video codec combinations.

* MPEG-4 Part2 Video Codec
* PCM 16bit little endian signed Audio Codec
* in MOV container

This script simplifies the conversion of footage for Davinci Resolve.

Currently, this project is at an early stage. More options are likely to come up.

**If you miss a certain feature, don't hesitate to open an issue that describes your needs**

## Installation

If you don't have a `$HOME/bin` folder, <a href="#setup-home-bin-folder">follow this guide first</a>.
Alternatively, you can put the script anywhere. It's just more convenient to follow the recommendations.

```bash
cd $HOME/bin
wget https://raw.githubusercontent.com/tpraxl/convert-footage/master/convert-footage
chmod u+x convert-footage
```

<a id="setup-home-bin-folder"></a>
## Setup $HOME/bin folder

In the Terminal:

```bash
# Make sure to add this to your $PATH afterwards (see below)
mkdir $HOME/bin
```

### Add $HOME/bin to $PATH

This depends on the shell you are using.

`bash` users edit `~/.bashrc`. Find a line that exports your `PATH`. Maybe there is no such line. Just create it as follows then. Make sure that your `$PATH` contains the installation path:

```
export PATH=$PATH:/home/your-user-name/bin
```

You may need to open a new Terminal afterwards. Just check if `echo $PATH` contains your new folder.

## Usage

Use the tool as follows:

### Single file conversion or complete folder conversion

You can find the usage below.

convert-footage will not convert files twice and it will not convert your conversion results, so running it twice in the same folder will only trigger conversion when you have renamed the conversion results or when there is new footage.

```bash
############################################################################
#
# Version 1.1.0
#
# Usage: convert-footage [options] file-or-folder
#
# Convert file to Davinci Resolve 14 compatible format.
#
# Options:
#  -h               ... help message
#  -q n             ... quality of the encoded video. Defaults to 1 for
#                       best quality.
#  -e               ... show all example usages
#
# Examples:
#
# Convert folder ../myvideos with best quality (default)
#  convert-footage ../myvideos
#
# Please use convert-footage -e for more examples.
#
############################################################################

# Examples:

# Convert current folder with best quality (default)

  convert-footage .

# Convert the current folder with quality 2

  convert-footage -q 2 .

# Convert folder ../myvideos with best quality (default)

  convert-footage ../myvideos

# Convert file ./myvideo.mp4 with quality 2

  convert-footage -q 2 ./myvideo.mp4

# Show help

  convert-footage -h
```

## Todo / Contribution

There's a lot to do in order to make the scripts more convenient. Contributions are welcome. The most important TODOs are listed below:

* Perform a sanity check on start (check if all requirements are installed)
* Provide more flexibility for folder-conversion (configurable file patterns and output file name / location)
* Provide a context menu entry for nautilus, nemo and other file managers

### Running tests

As a contributor, you might want to run tests.

This project uses [BATS-core][bats] for testing. So after you made sure, BATS-core is available on your system, run

```
bats test
```

## License

[MIT][mit]
