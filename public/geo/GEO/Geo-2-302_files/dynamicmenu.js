	<!--
//do browser detect stuff
var isNS = (navigator.appName == "Netscape");
var isMacIE = ( (navigator.userAgent.indexOf("IE 4")  > -1) && (navigator.userAgent.indexOf("Mac")  > -1) );
// WebTV hack to remove layers that don't position correctly.
var isWebTV = (navigator.userAgent.indexOf("WebTV")  > -1)
//

var layerRef = (isNS) ? "document" : "document.all";
var styleRef = (isNS) ? "" : ".style";
var isDynamic = ( (document.layers || document.all) && !isMacIE && !isWebTV);

var activeMenu = 0;
var finalClip;

// delay added to prevent accidental triggering of menu by breadcrumb users
//setTimeout('activateMenu()', 3000000)

function activateMenu(menuLayerRef, offset) {
	if (isDynamic && activeMenu != menuLayerRef) {
            if (activeMenu) hideMenu("menu" + activeMenu);         
				               
            menuID = "menu" + menuLayerRef;
            activeMenu = menuLayerRef;  
				      
                if (isNS) 
				{       
	        	//this is the vertical setting of the menu. must touch trigger to stay up                     
                	document[menuID].top = 81;
                	document[menuID].left = offset-7;
                } 
				else
				{  
				//this is the vertical setting of the menu. must touch trigger to stay up             
                    document.all[menuID].style.pixelTop = 83; 
                    document.all[menuID].style.pixelLeft = offset-5;
                }
				//showMenu(menuID);
			the_timeout = setTimeout("showMenu(menuID);", 300);
                
      }
	  if (isDynamic && !isNS) window.event.cancelBubble = true;
      
}


		
function showMenu(layerID) {
        eval(layerRef + '["' + layerID + '"]' + styleRef + '.visibility = "visible"');
}

function hideMenu(layerID) {
        eval(layerRef + '["' + layerID + '"]' + styleRef + '.visibility = "hidden"');
}

function killMenu(e) {
        //check if theres a menu active
        if (activeMenu) {
                menuID = "menu" + activeMenu;
                if (isNS) {
                        menuX1 = document[menuID].left;
                        menuX2 = menuX1 + document[menuID].clip.right;
                        menuY1 = document[menuID].top;
                        menuY2 = menuY1 + document[menuID].clip.bottom;
                        
                        if (e.pageX < menuX1 || e.pageX > menuX2 || e.pageY > menuY2) {
                                hideMenu(menuID);
                                activeMenu = 0;
                        }
                } else {
                                hideMenu(menuID);
                                activeMenu = 0;
                }
        }  
}

function init() {
        if (isDynamic) {
                if (isNS) { 
                        document.captureEvents(Event.MOUSEMOVE); 
                        document.onmousemove = killMenu;
                } else {
                        document.onmouseover = killMenu;
                }                
        }
}
//-->