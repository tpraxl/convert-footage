# Convert footage

[davinci]: (https://www.blackmagicdesign.com/products/davinciresolve)
[mit]: (http://opensource.org/licenses/MIT)

Provide scripts to convert video footage for [Davinci Resolve 14 Free][davinci] (Linux).

## Supported codec / container combination

The free version of Davinci on linux has not much support for codecs. I found a working solution by testing out lots of different container 
format / audio codec / video codec combinations.

* MPEG-4 Part2 Video Codec
* PCM 16bit little endian signed Audio Codec
* in MOV container

In order to simplify the conversion of footage, I created two scripts.

Currently, this project is at a very early stage. The scripts have been created for personal use and there are not many options.

This might however change over time.

## Installation

* Download the scripts or clone the git repo.
* Copy `cffile` and `cffolder` to `$HOME/bin`
* Make sure, the files are executable: `cd $HOME/bin && chmod u+x cff*`
* Make sure to export `$HOME/bin` (see below)

Alternatively, you can put them anywhere. It's just more convenient to follow the recommendations.

## Exporting the path

This depends on the shell, you are using.

`bash` users edit `~/.bashrc`. Find a line that exports your `PATH`. Maybe there is no such line. Just create it as follows then. Make sure that your `$PATH` contains the installation path:

```
export PATH=$PATH:/home/your-user-name/bin
```

## Usage

Use the scripts as follows:

### Single file conversion

```bash
# Usage: cffile [filename] [quality]
# The lower the value, the better the quality
cffile myvideo.mp4 0
``` 

### Batch file conversion

```bash
# Usage: cffolder [foldername] [quality]
# The lower the value, the better the quality
cffolder . 0
```

## Todo / Contribution

There's a lot to do in order to make the scripts more convenient. Contributions are welcome. The most important TODOs are listed below:

* Provide a better help and usage description
* Perform a sanity check on start (check if all requirements are installed)
* Allow the usage of named arguments, e.g. `cffile -i myvideo.mp4 -q 0`
* Provide more flexibility for `cffolder` (more file name patterns, configurable patterns and output file name / location)
* Provide a context menu entry for nautilus, nemo and other file managers

## License 

[MIT][mit]