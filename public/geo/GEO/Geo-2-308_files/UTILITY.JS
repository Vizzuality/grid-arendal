function goThere(where) {
	//alert("where = '" + where + "'");
	if (where != '' && where != '0') {
		window.open(where);
	}
}

function makeBookmark() {
	var thisBookmark = document.location.href;
	var thisPageTitle = document.title;
	var name = navigator.appName;
	var useragent = navigator.userAgent;
	var version = parseInt(navigator.appVersion);

	if ( useragent.indexOf("MSIE") != -1) {
		var macIndex = navigator.userAgent.toLowerCase().indexOf("mac");
		if ( macIndex != -1 ) {

		} else {
			var index = navigator.userAgent.indexOf("MSIE ");
			if ( index != -1 ) {
				version = parseInt(navigator.userAgent.substring(index+5,index+6));
			}
			if ( version == 4) {
				// Uncomment the following line to launch a second window for non IE5 users
				window.open('/bb/templates/setAsHomePage.jsp','makeBookmark','toolbar=0,menubar=0,scrollbars=1,resizable=0,status=0,location=0,left=30,top=30,width=350,height=400');
			} else if ( version > 4) {
				// first URL is the one that will get set as home page
				oHomePage.setHomePage(thisBookmark);
			}
		}
	} else {
		if ( version < 4 ) {

		} else {
			// Uncomment the following 3 lines to launch a second window for non IE5 users
			window.open('/bb/templates/setAsHomePage.jsp','makeBookmark','toolbar=0,menubar=0,scrollbars=1,resizable=0,status=0,location=0,left=30,top=30,width=350,height=400');
		}
	}
}


function userSubscribe() {
	window.open('/bb/subscription/subscribeWrapper.jsp','subscribe','toolbar=0,menubar=0,scrollbars=1,resizable=1,status=0,location=0,left=30,top=30,width=600,height=350');
}

function formRequest() {
	window.open('/bb/investorCentre/components/formRequestPopup.jsp','formRequest','toolbar=0,menubar=0,scrollbars=1,resizable=1,status=0,location=0,left=30,top=30,width=500,height=430');
}

function siteIndex(url, name) {
	window.open(url ,name,'toolbar=0,menubar=0,scrollbars=1,resizable=0,status=0,location=0,left=30,top=30,width=400,height=500');
}

function showPDF(file) {
	window.open(file,'','toolbar=0,menubar=0,scrollbars=1,resizable=1,status=0,location=0,left=0,top=0,width=640,height=480');
}

function showImage(file) {
	window.open(file,'imagePop','toolbar=0,menubar=0,scrollbars=1,resizable=0,status=0,location=0,left=30,top=30,width=550,height=500');
}

function chk(obj) {
	var  O = obj;
	var pI = "";
	for(var propertyName in O) {
		if(propertyName != "innerHTML" & propertyName != "innerText" & propertyName != "outerHTML" & propertyName != "outerText")
		pI += propertyName + " = " + O[propertyName] + "\n";
	}
	alert(pI)
}
