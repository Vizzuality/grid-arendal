
// Code for displaying and moving the floating DHTML layer is based on a 
// script from http://www.bruce-hamilton.com/tutorials/sitemark.shtml

// MSIE version using repositioned div

document.domain="globio.info";

function regenerate(){
	window.location.reload()
}

function logoit(){
	// used by MSIE
	document.all.surveybox.style.left = document.body.clientWidth-document.all.surveybox.offsetWidth-5;
	document.all.surveybox.style.top = document.body.scrollTop+document.body.clientHeight-document.all.surveybox.offsetHeight-4;
}

function setmessage(){
	// Used by MSIE
	document.all.surveybox.style.left = document.body.clientWidth-document.all.surveybox.offsetWidth-5;
	document.all.surveybox.style.top = document.body.scrollTop+document.body.clientHeight-document.all.surveybox.offsetHeight-4;
	document.all.surveybox.style.backgroundColor="#ffffcc";
	document.all.surveybox.style.visibility="visible";
	window.onscroll=logoit;
	window.onresize=new Function("window.location.reload()")
}

function resetBoxLocation(){
	// used by NS4
	var theBox = document.layers[0];
	theBox.left=pageXOffset+window.innerWidth-theBox.document.width-20;
	theBox.top=pageYOffset+window.innerHeight-theBox.document.height-5;
	setTimeout("resetBoxLocation()",250)
}

// Code for browser detection is from Netscape's "Ultimate client-side JavaScript client sniff. Version 3.02."
// http://www.mozilla.org/docs/web-developer/sniffer/browser_type_oo.html

// This survey code has been tested to work on MSIE4+ on Windows, and NS4+ on Windows and Mac.  
// It has not been confirmed under NS6.
// Therefore these are the only combinations under which it will be displayed.

var browser_agt = navigator.userAgent.toLowerCase();
var browser_major = parseInt(navigator.appVersion);
var browser_msie = ((browser_agt.indexOf("msie") != -1) && (browser_agt.indexOf("opera") == -1));
var browser_nav  = ((browser_agt.indexOf('mozilla')!=-1) 
                && (browser_agt.indexOf('compatible') == -1) && (browser_agt.indexOf('opera')==-1)
                && (browser_agt.indexOf('webtv')==-1) && (browser_agt.indexOf('hotjava')==-1));
var platform_win = ( (browser_agt.indexOf("win")!=-1) || (browser_agt.indexOf("16bit")!=-1) );
var platform_mac = (browser_agt.indexOf("mac")!=-1);


if (browser_nav && browser_major==4 && browser_major<6 && (platform_win || platform_mac)) {
	var initLeft=pageXOffset+window.innerWidth-175-20;
	var initTop=pageYOffset+window.innerHeight-45-5;
	document.write('<layer id="surveybox" visibility="show" width=175 left=' + initLeft + ' top=' + initTop + ' bgColor="#ffffcc" src="http://www.globio.info/include/survey/scorepage.cfm?pageurl=' + window.location + '"></layer>');
	setTimeout("window.onresize=regenerate",400);
	resetBoxLocation();
} else if (browser_msie && browser_major>=4 && platform_win) {	
	document.write('<div id="surveybox" style="position:absolute; visibility:hidden;">');
	document.write('<iframe name="scoreframe" src="http://www.globio.info/include/survey/scorepage.cfm?pageurl=' + window.location + '" width=175 height=35 frameborder=1 scrolling=no marginwidth=0 marginheight=0 align=center ALLOWTRANSPARENCY="true"></iframe>');
	document.write('</div>');
	window.onload=setmessage
}
