if (document.layers) {
	document.write('<link rel="stylesheet" type="text/css" href="/res/templates/v1.0/css/itu-ns.css">');
} else if (document.getElementById) {
	
	if (navigator.appName == "Netscape") {
		document.write('<link rel="stylesheet" type="text/css" href="/res/templates/v1.0/css/itu-ns6.css">');
 	} else {
		document.write('<link rel="stylesheet" type="text/css" href="/res/templates/v1.0/css/itu.css">');
	}
	
} else {
	document.write('<link rel="stylesheet" type="text/css" href="/res/templates/v1.0/css/itu.css">');
}

document.write('<script language="JavaScript1.1" src="/res/templates/v1.0/js/animation.js"></script>');
