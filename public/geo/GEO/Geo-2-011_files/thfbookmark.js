var ie = navigator.appVersion
var ie5 = parseInt(ie.substring(ie.indexOf("MSIE")+5,ie.indexOf("MSIE")+6));
if ((ie.indexOf("MSIE") > 0) && (parseInt(navigator.appVersion) >= 4))
   { document.write("<table border=0 cellspacing=0 cellpadding=0><tr><td><a class='fmnocolor' href='javascript:window.external.AddFavorite(location.href, document.title);' onMouseOver='window.status=&quot;&quot;;return true;' onMouseOut='window.status=&quot;&quot;;return false'><center><img src='http://www.heritage.org/jillheader/header01_r1_c09.gif' border=0></a></center></td></tr></table>"); }
else
   { document.write("<table border=0 cellspacing=0 cellpadding=0><tr><td><center><img src='http://www.heritage.org/jillheader/square.gif' border=0></center></td></tr></table>"); }
