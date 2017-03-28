function body_tag() {
//Calculate filename and path for query string
//for printview function

var dir = location.href.substring(0,location.href.lastIndexOf('/')+1);
var url = location.href.substring(dir.length,location.href.length+1);

// This is used for the bookmark
var name = escape(document.title);
if ( (document.title == null) || (document.title == "") ) {
	name = "American Bar Assocation";
}

document.write("</HEAD>");
document.write("<body background='" + back_image + "' topmargin='0' leftmargin='0' marginwidth='0' marginheight='0' onload='openandclose(10000); changetext(content[0]); regenerate2()'>");

/*HM_Loader.js
* by Peter Belesis. v4.1.2 011030
* Copyright (c) 2001 Peter Belesis. All Rights Reserved.
*/

   HM_DOM = (document.getElementById) ? true : false;
   HM_NS4 = (document.layers) ? true : false;
    HM_IE = (document.all) ? true : false;
   HM_IE4 = HM_IE && !HM_DOM;
   HM_Mac = (navigator.appVersion.indexOf("Mac") != -1);
  HM_IE4M = HM_IE4 && HM_Mac;
 HM_Opera = (navigator.userAgent.indexOf("Opera")!=-1);
 HM_Konqueror = (navigator.userAgent.indexOf("Konqueror")!=-1);

HM_IsMenu = !HM_Opera && !HM_Konqueror && !HM_IE4M && (HM_DOM || HM_NS4 || HM_IE4);

HM_BrowserString = HM_NS4 ? "NS4" : HM_DOM ? "DOM" : "IE4";


if(window.event + "" == "undefined") event = null;
function HM_f_PopUp(){return false};
function HM_f_PopDown(){return false};
popUp = HM_f_PopUp;
popDown = HM_f_PopDown;




HM_PG_MenuWidth = 200;
HM_PG_FontFamily = "Arial,sans-serif";
HM_PG_FontSize = 8;
HM_PG_FontBold = 1;
HM_PG_FontItalic = 0;
HM_PG_FontColor = "blue";
HM_PG_FontColorOver = "white";
HM_PG_BGColor = "green";
HM_PG_BGColorOver = "#FFCCCC";
HM_PG_ItemPadding = 4;

HM_PG_BorderWidth = 2;
HM_PG_BorderColor = "black";
HM_PG_BorderStyle = "solid";
HM_PG_SeparatorSize = 2;
HM_PG_SeparatorColor = "#d0ff00";

HM_PG_ImageSrc = "HM_More_black_right.gif";
HM_PG_ImageSrcLeft = "HM_More_black_left.gif";
HM_PG_ImageSrcOver = "HM_More_white_right.gif";
HM_PG_ImageSrcLeftOver = "HM_More_white_left.gif";

HM_PG_ImageSize = 5;
HM_PG_ImageHorizSpace = 0;
HM_PG_ImageVertSpace = 2;

HM_PG_KeepHilite = true; 
HM_PG_ClickStart = 0;
HM_PG_ClickKill = false;
HM_PG_ChildOverlap = 20;
HM_PG_ChildOffset = 10;
HM_PG_ChildPerCentOver = null;
HM_PG_TopSecondsVisible = .5;
HM_PG_StatusDisplayBuild =0;
HM_PG_StatusDisplayLink = 0;
HM_PG_UponDisplay = null;
HM_PG_UponHide = null;
HM_PG_RightToLeft = 0;

HM_PG_CreateTopOnly = 0;
HM_PG_ShowLinkCursor = 1;
HM_PG_NSFontOver = true;




// the following function is included to illustrate the improved JS expression handling of
// the left_position and top_position parameters
// you may delete if you have no use for it

function HM_f_CenterMenu(topmenuid) {
	var MinimumPixelLeft = 0;
	var TheMenu = HM_DOM ? document.getElementById(topmenuid) : HM_IE4 ? document.all(topmenuid) : eval("window." + topmenuid);
	var TheMenuWidth = HM_DOM ? parseInt(TheMenu.style.width) : HM_IE4 ? TheMenu.style.pixelWidth : TheMenu.clip.width;
	var TheWindowWidth = HM_IE ? document.body.clientWidth : window.innerWidth;
	return Math.max(parseInt((TheWindowWidth-TheMenuWidth) / 2),MinimumPixelLeft);
}

if(HM_IsMenu) {
	document.write("<SCR" + "IPT LANGUAGE='JavaScript1.2' SRC='/javascripts/HM_Arrays.js' TYPE='text/javascript'><\/SCR" + "IPT>");
	document.write("<SCR" + "IPT LANGUAGE='JavaScript1.2' SRC='/javascripts/HM_Script"+ HM_BrowserString +".js' TYPE='text/javascript'><\/SCR" + "IPT>");
}


//end

document.write("<TABLE cellspacing=0 cellpadding=0 border=0>");
document.write("<TR>");
document.write("<TD valign=top><IMG SRC='/img/abanetwork.gif' WIDTH='207' HEIGHT='55' BORDER='0' alt='ABA network'></TD>");
document.write("<TD valign=top bgcolor='black'>");
document.write("<img src='/img/abafull.gif' width='561' height='22' border='0' alt='American Bar Association'><br><img src='/img/blue-org.gif' width='561' height='3' border='0' alt='bblue wave'>");
document.write("</TD>");
document.write("</TR>");
document.write("<tr>");
document.write("<td valign=top><a href=\"/scripts/login/login.jsp\"><IMG SRC='/img/swoop.gif' WIDTH='168' HEIGHT='20' BORDER='0' alt='Member Login'></A></td><td align=right><a href='/webapp/wcs/stores/servlet/OrderItemDisplay?langId=-1&storeId=10251&catalogId=10001&orderId=.'><img src='/img/cart2.gif' alt='View Shopping Cart' border='0'></a><img src='/img/vert.gif' width='10' height='21' border='0'><a href=\"/scripts/servlet/com.aba.abanet.member.ProcessBookmarkServlet?name="+ name + "\"><img src='/img/book1.gif' width='22' height='21' alt='Bookmark This Page' border='0'></a><img src='/img/vert.gif' width='10' height='21' border='0'><a href='/scripts/printview.jsp?Ref=" + dir + "home.html'><img src='/img/printer1.gif' width='23' height='21' alt='Printer-Friendly Format' border='0'><img src='/img/vert.gif' width='10' height='21' border='0'><a href='/scripts/logoff.jsp'><img src='/img/logoff.gif' width='23' height='21' alt='Log Off' border='0'></a></td><tr>");
document.write("</TABLE>");
document.write("<TABLE border=0 WIDTH=768 cellspacing=0 cellpadding=0>");
document.write("<TR>");
document.write("<TD WIDTH=155 valign=top>&nbsp;</TD>");
document.write("<TD align=left width=613>");


}

function MemberWindow(){MemWin = window.open('/scripts/members/myAba.jsp','','scrollbars=yes width=600,height=500')}

function doNothing() {} 

var browsername="0"
var browser="0";

browsername=navigator.appName;

if (browsername.indexOf("Netscape")!=-1) {browsername="NS"}
if (browsername.indexOf("Microsoft")!=-1) {browsername="MSIE"}

var isNS6 = (navigator.userAgent.indexOf("Gecko")    > 0) ? 1 : 0;
if (isNS6){browsername="NS";browser="6"}

if (navigator.appVersion.charAt(0)=="4") {browser="4"};


//if (navigator.appVersion.indexOf("4.0")!=-1) {browser="4"};

if ((browsername=="NS" || browsername=="MSIE") && (browser=="4" || browser=="6")) {
doNothing()}
else
{alert("Your browser version is earlier than 4.x. This website may not function properly. Please obtain the latest version of your browser for proper JavaScript functionality.")}

if (document.images) {
	bottomBlu = new Image
	bottomPurp = new Image

	bottomBlu.src = "http://www.abanet.org/img/blu.gif"
	bottomPurp.src = "http://www.abanet.org/img/purp.gif"

}

else {
	bottomBlu = ""
	bottomPurp = ""
	bottomDefault = ""
}


function loadfooter() {
document.write("<br><table align='left' width='100%'><tr><td width='155'>&nbsp;</td><td align='left'>");
document.write("<a href='/privacy.html'><font size=1 face=arial>ABA Copyright Statement</font></a>&nbsp;&nbsp;<a href='/privacy_statement.html'><font size=1 face=arial>ABA Privacy Statement</font></a></td></table>");
}

function footer_tag() {


document.write("<div align='center'><font class=copy>");
if (entity_name == "" && entity_street == "" && entity_street2 == "" && entity_city == "" && entity_state == "" && entity_zip== "" && entity_phone== "" && entity_fax== "" && entity_email== "") {}

else {
document.write("<b>Contact information:</b><br>")
if (entity_name != "") {document.write(entity_name + "<br>")}
if (entity_street != "") {document.write(entity_street)}

if (entity_street2 == "") {document.write("<br>")}
	else {document.write(", " + entity_street2 + "<br>")}

if (entity_city != "") {document.write(entity_city)}
if (entity_state != "") {document.write(", " + entity_state)}
if (entity_zip != "") {document.write(", " + entity_zip + "<br>")}
if (entity_phone != "") {document.write("phone: " + entity_phone + "<br>")}
if (entity_fax != "") {document.write("fax: " + entity_fax + "<br>")}
if (entity_email != "") {document.write("<a href='mailto:" + entity_email + "'>" + entity_email + "</a>")}
document.write("</font></div>")
}

document.write("<br><br><table align='left' width='100%'><tr><td align='left'>");
document.write("<a href='/privacy.html'><font class='levelone'>ABA Copyright Statement</font></a>&nbsp;&nbsp;<a href='/privacy_statement.html'><font class='levelone'>ABA Privacy Statement</font></a></td></table>");
document.write("</TD></TR></TABLE>");
document.write("<DIV ID='menu2' STYLE='text-decoration:none;position:absolute; top:" + top_px + "px; left:" + left_px + "px; width:147'></DIV>");





}


