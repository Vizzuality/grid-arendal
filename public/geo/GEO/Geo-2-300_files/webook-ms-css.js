// change to another stylesheet for MSIE browsers
//
// 15-jun-1999  david landgren

var agt = navigator.userAgent.toLowerCase(); 

if( agt.indexOf("msie") != -1 )  {
	document.write( "<link rel=\"stylesheet\" href=\"/icons/css/webook-ms.css\">" );
}
