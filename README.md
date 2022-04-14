# Airprint module for Titanium (iOS)

## Requirements

- Titanium SDK 10.1.1
- iOS 14.0

## Example
```js

var airprint = require("ti.airprint");

if (!airprint.canPrint()) {

	Ti.API.info('Printing is not supported in this version of iOS');
	return;
	
	}
	

//	Print a PDF from somewhere online

airprint.print({
	url:	'https://www.gradekeeper.com/downloads/gk-iphone-users-guide.pdf'
	});
	
	
//	Print an image from somewhere online

airprint.print({
	url:	'https://www.gradekeeper.com/dethier/images/orion_nebula.jpg'
	});
	
	
//	Print html contained in a string

var markup = '<html><head></head><body><h1>Print me!</h1></body></html>';

airprint.print({
	html:	markup
	});
	

```

## Author

- Daniel Ethier ([dethier@gradekeeper.com](mailto:dethier@gradekeeper.com))
