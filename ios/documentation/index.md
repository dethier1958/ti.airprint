# Ti.AirPrint Module

## Description

Exposes the AirPrint API to Titanium Mobile applications.

## Getting Started

View the [Using Titanium Modules](https://titaniumsdk.com/guide/Titanium_SDK/Titanium_SDK_How-tos/Using_Modules/) document for instructions on getting
started with using this module in your application.

## Accessing the Ti.AirPrint Module

To access this module from JavaScript, you would do the following:

<pre>var AirPrint = require('ti.airprint');</pre>

## Functions

### Ti.AirPrint.print({...})

Allows you to print to printers supporting AirPrint. A modal window will present settings and allow you to print.

#### Arguments

Takes one argument, a dictionary with the following keys:

* url  [string]: The URL to an image or PDF. Can be local or remote, but must be accessible to the app.
* html [string]: The html string to be printed (if html is given, url will be ignored).

### Ti.AirPrint.canPrint()

Returns whether or not the current device supports printing. Note that a printer does not need to be attached for this to return true.

## Usage

See example.

## Author

Dawson Toth, updated by Daniel Ethier

## Feedback and Support

Please direct all questions, feedback, and concerns to [dethier@gradekeeper.com](mailto:dethier@gradekeeper.com?subject=iOS%20AirPrint%20Module).

## License

Copyright(c) 2010-2013 by Appcelerator, Inc. All Rights Reserved. Please see the LICENSE file included in the distribution for further details.
