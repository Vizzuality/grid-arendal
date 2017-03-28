
var visArrayLen = 7;
var smVisArrayLen = 6;
var menuStartIndex = 0;
var currLyr = ''; // name of the currently displayed popup layer
var loaded = false;

var popLeftOffset = 0;
var popTopOffset = 29;

// create an array with boolean values for each of the popup layers
// determines whether the layer is meant to be shown or not
popLyrVis = new Array(visArrayLen + smVisArrayLen);

for(i = 1; i <= visArrayLen; i++){
	popLyrVis['menuLyr' + i] = new Boolean();
	popLyrVis['menuLyr' + i] = 0;
}

for(i = 1; i <= smVisArrayLen; i++){
	popLyrVis['subMenuLyr' + i] = new Boolean();
	popLyrVis['subMenuLyr' + i] = 0;
}

var arrMenu = new Array('',
						'about',
						'investor',
						'news',
						'customer',
						'research',
						'sustainable',
						'people')

var arrMenuSub = new Array();
	arrMenuSub[1] = new Array(90,131); // (distance from left, distance from top)
	arrMenuSub[2] = new Array(345,139);
	arrMenuSub[3] = new Array(345,170);
	arrMenuSub[4] = new Array(430,104);
	arrMenuSub[5] = new Array(430,126);
	arrMenuSub[6] = new Array(515,161);



// set up the popup layers position from it's corresponding arrow image
function init(){
	for(i = 1; i <= visArrayLen; i++){
		thisArrow = eval('document.images.' + arrMenu[i]);
		thisPopLyr = getObjectRef('menuLyr' + i);
		thisPopLyrTop = (isNav4) ? thisArrow.y : thisArrow.offsetTop;
		thisPopLyrLeft = (isNav4) ? thisArrow.x : thisArrow.offsetLeft;
		setObjTop(thisPopLyr, parseInt(thisPopLyrTop + popTopOffset));
		setObjLeft(thisPopLyr, parseInt(thisPopLyrLeft + popLeftOffset));
		hide(thisPopLyr);
		//chk(thisPopLyr)
	}
	// position sub-menus
	// due to the nature of these menus
	// it has been elected to do this manually
	for(i = 1; i <= smVisArrayLen; i++){
		thisPopLyr = getObjectRef('subMenuLyr' + i);
		//thisPopLyrTop = getObjTop('menuLyr' + i);
		//alert(arrMenuSub[i][1]);
		thisPopLyrTop = arrMenuSub[i][1];
		var locString = document.location.href;
		if (locString.indexOf('/home/home.jsp') > 0) {
			thisPopLyrTop+=111;
		}
		//thisPopLyrLeft = getObjLeft('menuLyr' + i) + 85;
		thisPopLyrLeft = arrMenuSub[i][0];
		setObjTop(thisPopLyr, thisPopLyrTop);
		setObjLeft(thisPopLyr, thisPopLyrLeft);
		hide(thisPopLyr);
	}
	loaded = true;
	return false;
}

// show the referenced layer
function showPop(lyr){
	if(loaded){
		show(lyr);
		popLyrVis[lyr] = 1;
	}
	return false;
}

// wait 50ms...
function hidePop(lyr){
	currLyr = lyr;
	if(popLyrVis[currLyr] == 1){
		//alert(currLyr);
		stoHidePop = setTimeout('hidePopWait()', 250);
		popLyrVis[currLyr] = 0;
	}
	return false;
}

// then hide all layers that have popLyrVis set to 0
function hidePopWait(){
	for(i = 1; i <= visArrayLen; i++){
		pfx = 'm';
		if(popLyrVis[pfx + 'enuLyr' + i] == 0){
			thisPopLyr = getObjectRef(pfx + 'enuLyr' + i);
			hide(thisPopLyr);
			popLyrVis[pfx + 'enuLyr' + i] = 0;
		}
	}
	for(i = 1; i <= (visArrayLen + smVisArrayLen); i++){
		pfx = 'subM';
		if(popLyrVis[pfx + 'enuLyr' + i] == 0){
			thisPopLyr = getObjectRef(pfx + 'enuLyr' + i);
			hide(thisPopLyr);
			popLyrVis[pfx + 'enuLyr' + i] = 0;
		}
	}
	return true;
}



/* Global variables */
var isNav4, isNav6, isIE4, hasDOM;
var intervalID;
var coll = "";
var styleObj = "";
if(parseInt(navigator.appVersion) >= 5 && document.getElementsByTagName("*")) {
	hasDOM = true;
	coll = 'getElementById("';
	styleObj = '").style';
	if(navigator.appName == "Netscape") {
		isNav6 = true;
	}
}else if(parseInt(navigator.appVersion) >= 4){
	if(navigator.appName == "Netscape") {
		isNav4 = true;
	} else {
		isIE4 = true;
		coll = "all.";
		styleObj = ".style";
	}
}

var agt=navigator.userAgent.toLowerCase();
var isMac = (agt.indexOf("mac")!=-1);

var agentP = navigator.userAgent;
var macIE=false;
if ((agentP.indexOf("Mac")!=-1) && isIE4) {
  macIE=true;
}

function changeImage(row,s){
	var h = (s==1)?"r":"";
	if(document.images){
		document.images[row].src = eval(h + row + ".src");
	}
}

/*Function to convert object name string or object reference into valid object reference */
function getObjectRef(obj){
	var theObj;
	if(typeof obj == "string"){
		theObj = eval("document." + coll + obj + styleObj);
	}else{
		theObj = obj;
	}
	return theObj;
}

/*Function to convert object name string or object reference into valid object reference */
/* modified to work with nested layers in Netscape 4, if you have more than 8 nested layers, you're insane */
function getNestObjectRef(obj,nst1,nst2,nst3,nst4,nst5,nst6,nst7,nst8){
	var theObj;
	var objNest = '';
	if(typeof obj == "string"){
		theObj = eval("document." + coll + obj + styleObj);
	}else{
		theObj = obj;
	}
	if(isNav4){
		for(i=1;i<=arguments.length-1;i++){
			currArg = eval('nst'+i);
			objNest += 'document.'+currArg+'.';
		}
		theObj = eval(objNest + 'document.' + obj);
	}
	return theObj;
}

/* functions to show an object */
function show(obj){
	var theObj = getObjectRef(obj);
	theObj.visibility = "visible";
}

/* utility function to hide an object */
function hide(obj){
	var theObj = getObjectRef(obj);
	if(theObj)theObj.visibility = "hidden";
}


/* utility fn to set x coordinate of positionable object */
function setObjLeft(obj,x){
	var theObj = getObjectRef(obj);
	if(isNav4||hasDOM){
		theObj.left = x;
	}else{
		theObj.pixelLeft = x;
	}
}


/* utility fn to set y coordinate of positionable object */
function setObjTop(obj,y){
	var theObj = getObjectRef(obj);
	if(isNav4||hasDOM){
		theObj.top = y;
	}else{
		theObj.pixelTop = y;
	}
}

/* function to retrieve the y-coordinate of a positionable object */
function getObjTop(obj){
	var theObj = getObjectRef(obj);
	if(isNav4){
		return theObj.top;
	}else if(hasDOM){
		return parseInt(theObj.top);
	}else{
		return theObj.pixelTop;
	}
}

/* utility function that returns the width of an object in pixels */
function getObjWidth(obj){
	var theObj = getObjectRef(obj);
	if(isNav4){
		return theObj.clip.width;
	}else if(hasDOM){
		return parseInt(theObj.width);
	} else {
		var ox = theObj.pixelWidth;
		return ox;
	}
}

/* function to retrieve the x-coordinate of a positionable object */
function getObjLeft(obj){
	var theObj = getObjectRef(obj);
	if(isNav4){
		return theObj.left;
	}else if(hasDOM){
		return parseInt(theObj.left);
	}else{
		var opx1 = theObj.pixelLeft;
		return opx1;
	}
}

/* utility function that moves the specified object by dx pixels to the left;*/
function shiftLeft(obj,dx){
	var theObj = getObjectRef(obj);
	if(isNav4){
		theObj.left -= dx;
	}else if(hasDOM){
		theObj.left = parseInt(theObj.left)-dx;
	}else{
		theObj.pixelLeft -= dx;
	}
}

/* object clipping function */
function clipObj(obj,cTop,cRight,cBottom,cLeft) {
	var theObj = getObjectRef(obj);
	if(isNav4) {
		theObj.clip.top = cTop;
		theObj.clip.right = cRight;
		theObj.clip.bottom = cBottom;
		theObj.clip.left = cLeft;
	}else {
		theObj.clip = 'rect('+cTop+','+cRight+','+cBottom+','+cLeft+')';
	}
}


