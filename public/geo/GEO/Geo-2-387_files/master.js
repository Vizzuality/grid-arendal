/* function for pop-out-of frames*/
if (window!= top)
top.location.href=location.href

/*rollover script*/
function MM_findObj(n, d) { //v3.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;
}

/* Functions that swaps images. */
function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
if (document.images) {
  home1 = new Image(54 ,20); home1.src = "/images/home2a.gif";
  home2 = new Image(54 ,20); home2.src = "/images/rollover/home2b.gif";
  news1 = new Image(65 ,20); news1.src = "/images/news2a.gif";
  news2 = new Image(65 ,20); news2.src = "/images/rollover/news2b.gif";
  serv1 = new Image(78 ,20); serv1.src = "/images/serv2a.gif";
  serv2 = new Image(78 ,20); serv2.src = "/images/rollover/serv2b.gif";
  press1 = new Image(101 ,20); press1.src = "/images/press2a.gif";
  press2 = new Image(101 ,20); press2.src = "/images/rollover/press2b.gif";
  faq1 = new Image(59 ,20); faq1.src = "/images/faq2a.gif";
  faq2 = new Image(59 ,20); faq2.src = "/images/rollover/faq2b.gif";
  job1 = new Image(50 ,20); job1.src = "/images/job2a.gif";
  job2 = new Image(50 ,20); job2.src = "/images/rollover/job2b.gif";
  gift1 = new Image(80 ,20); gift1.src = "/images/gift2a.gif";
  gift2 = new Image(80 ,20); gift2.src = "/images/rollover/gift2b.gif";
  mus1 = new Image(83 ,20); mus1.src = "/images/mus2a.gif";
  mus2 = new Image(83 ,20); mus2.src = "/images/rollover/mus2b.gif";
  donat1 = new Image(130 ,20); donat1.src = "/images/donat.gif";
  donat2 = new Image(130 ,20); donat2.src = "/images/rollover/donat2.gif";
  givebl1 = new Image(130 ,20); givebl1.src = "/images/givebl.gif";
  givebl2 = new Image(130 ,20); givebl2.src = "/images/rollover/givebl2.gif";
  tissuedon1 = new Image(130 ,20); tissuedon1.src = "/images/tissuedon.gif";
  tissuedon2 = new Image(130 ,20); tissuedon2.src = "/images/rollover/tissuedon2.gif";
  volunteer1 = new Image(130 ,20); volunteer1.src = "/images/volunteer.gif";
  volunteer2 = new Image(130 ,20); volunteer2.src = "/images/rollover/volunteer2.gif";
  pgive1 = new Image(130 ,20); pgive1.src = "/images/pgive.gif";
  pgive2 = new Image(130 ,20); pgive2.src = "/images/rollover/pgive2.gif";
  goods = new Image(130 ,20); goods.src = "/images/goods.gif";
  goods2 = new Image(130 ,20); goods2.src = "/images/rollover/goods2.gif";
}

/*blubar rollovers*/
if(navigator.appName == "Microsoft Internet Explorer" &&
parseInt(navigator.appVersion) >= 4){
	ie4 = true;
}
else {
	ie4 = false;
}

function changeColor(){
	if(ie4){
		what = window.event.srcElement;
		if(what.className == "nav"){
			if(what.style.color == "#ffffff"){
				what.style.color = "#003366";
			}
			else {
				what.style.color = "#ffffff";
			}
		}
		else {}
	}
}

document.onmouseover = changeColor;
document.onmouseout = changeColor;

/*form check script*/
function checkform(form) {
  return(
  validateZip(form.zip)
  )
}

function validateZip(myfield) {
  if (notNull(myfield.value)) {
  if(isDigits(myfield.value))
	 {
		 if (isSize(myfield.value,5))  return true
	 }
	}
  myfield.focus()
  alert("Invalid zip code. Please enter 5-digit zip code.")
  return false
}

function notNull(str) {
  if (str.length == 0 )  return false
  else   return true
}

function isSize(str, size) {
  if (str.length == size)   return true
  else  return false
}

function isDigits(str) {
  var i
  for (i = 0; i < str.length; i++) {
  mychar = str.charAt(i)
  if (mychar < "0" || mychar > "9")  return false
  }
  return true
}

function stripNonDigits(str) {
  var i
  var newstring = ""
  for (i = 0;  i < str.length; i++) {
  mychar = str.charAt(i)
  if (isDigits(mychar))   newstring += mychar
  }
  return newstring
}


//COOKIE SCRIPT DO NOT DELETE
var expDays = 1; // number of days the cookie should last

var page = "http://www.redcross.org/popups/donations.html";
var windowprops = "toolbar=no,location=0,directories=0,status=0,menubar=0,scrollbars=0,width=470,height=500,left=110,top=110,screenX=100,screenY=50,resizable=1";

function GetCookie (name) { 
var arg = name + "="; 
var alen = arg.length; 
var clen = document.cookie.length; 
var i = 0; 
while (i < clen) { 
var j = i + alen; 
if (document.cookie.substring(i, j) == arg) 
return getCookieVal (j); 
i = document.cookie.indexOf(" ", i) + 1; 
if (i == 0) break; 
} 
return null;
}
function SetCookie (name, value) { 
var argv = SetCookie.arguments; 
var argc = SetCookie.arguments.length; 
var expires = (argc > 2) ? argv[2] : null; 
var path = (argc > 3) ? argv[3] : null; 
var domain = (argc > 4) ? argv[4] : null; 
var secure = (argc > 5) ? argv[5] : false; 
document.cookie = name + "=" + escape (value) + 
((expires == null) ? "" : ("; expires=" + expires.toGMTString())) + 
((path == null) ? "" : ("; path=" + path)) + 
((domain == null) ? "" : ("; domain=" + domain)) + 
((secure == true) ? "; secure" : "");
}
function DeleteCookie (name) { 
var exp = new Date(); 
exp.setTime (exp.getTime() - 1); 
var cval = GetCookie (name); 
document.cookie = name + "=" + cval + "; expires=" + exp.toGMTString();
}
var exp = new Date(); 
exp.setTime(exp.getTime() + (expDays*24*60*60*1000));
function amt(){
var count = GetCookie('count')
if(count == null) {
SetCookie('count','1')
return 1
}
else {
var newcount = parseInt(count) + 1;
DeleteCookie('count')
SetCookie('count',newcount,exp)
return count
}
}
function getCookieVal(offset) {
var endstr = document.cookie.indexOf (";", offset);
if (endstr == -1)
endstr = document.cookie.length;
return unescape(document.cookie.substring(offset, endstr));
}

function checkCount() {
var count = GetCookie('count');
if (count == null) {
count=1;
SetCookie('count', count, exp);

window.open(page, "", windowprops);

}
else {
count++;
SetCookie('count', count, exp);
}
}



