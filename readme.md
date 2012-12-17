# Jumbler

Jumbler is an application used to watch folders containg javascript
and pass them to Googles closure compiler upon modification
resulting in a minified file in a specified directory

Inspired by Compass and Google's Closure Compiler

##Uses

* [Listen](http://github.com/guard/listen)
* [Google Closure Compiler](http://google.com/closure/compiler)

## Requirements

* Java
* java must be accessible from command line 

## Install

``` bash
gem install jumbler
```

## Usage

Change directory to where you javascript files are and call:
``` bash
jumbler
```
To stop watching the folder press CTRL + C