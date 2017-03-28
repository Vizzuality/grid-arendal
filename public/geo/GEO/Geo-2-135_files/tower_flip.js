var content=new Array()

<!--ABA News-->
<!--Entire content must be on one line, precede double quotes with a backslash (\")-->
content[0]="<TABLE border=0 cellpadding=4 cellspacing=0 height=550 width=328 bgcolor=\"#E0E8F2\"><TR><TD valign=top><center><a href=\"/dialogue/\"><img src=\"http://www.abanet.org/images/freedom_dialogue2.gif\" border=0 alt=\"Dialogue on Freedom\"></a></center><br><table border=0 width=100% cellspacing=5><tr><td align=center><img src=\"http://www.abanet.org/images/flag4.jpg\"><br><a href=\"/leadership/tragedy.html\"><b>ABA Responds to 9-11</b></a></td><td align=center><a href=\"/publiced/lawday/home.html\"><img src=\"http://www.abanet.org/img/ldbanner_small.jpg\" border=0><br><b>Law Day 2002</b></a></td></tr></table><p><a href=\"/ucita/home.html\"><b>Working Group on UCITA </b></a><p><p><font face=arial,verdana size=2>ABA Position on Military Tribunals. <a href=\"/media/military_tribunals_audio.html\">Hear audio</a><p><font face=arial,verdana size=2>Task Force on Terrorism and the Law <a href=\"/leadership/military.pdf\">Report and Recommendations on Military Commissions</a>,<br> January 4, 2002.  (Adobe PDF Format)<p><a href=\"/media/mar02/hirshoncomments.html\">Statement</a> by ABA President Robert Hirshon on Department of Defense procedures for trials by military commissions.  March 21, 2002</font></TD></TR></TABLE>"

<!--Latest In Law-->
<!--Entire content must be on one line, precede double quotes with a backslash (\")-->
content[1]="<TABLE border=0 cellpadding=4 cellspacing=0 width=328 height=550 bgcolor=#f6def6><TR><TD valign=top><font face=arial,verdana size=1><div align=center><font face=arial,verdana size=1><b>A SERVICE OF<A HREF=\"http://www.abanet.org/media/home.html\"> ABA DIVISION FOR MEDIA RELATIONS &amp; COMMUNICATION SERVICES</a></b></div><P ALIGN=\"CENTER\"><font face=arial,verdana size=1>Week of April 22</P><P><A HREF=\"http://www.abanet.org/media/hirshon-4-15.html\">ILLINOIS CAPITAL PUNISHMENT STATEMENT</A><br>Statement of ABA President Robert E. Hirshon on the Illinois Commission on Capital Punishment Report.</P><P><A HREF=\"http://www.abanet.org/publiced/home.html\">LAW DAY</A><br>Law Day 2002 is May 1.  Check out the latest news at <A HREF=\"http://www.abanet.org/publiced/lawday/home.html\">http://www.abanet.org/publiced/lawday/home.html</A></P><P><A HREF=\"http://www.abanet.org/webapp/wcs/stores/servlet/ProductDisplay?storeId=10251&amp;productId=-17636&amp;categoryId=-3534\">COST-BENEFIT ANALYSIS</A><br>New from the ABA Section of Administrative Law and Regulatory Practice, <I>The Cost-Benefit State</I> examines new trends in cost-benefit analysis and how courts are responding in contested cases.  Updated in light of the September 11 attacks, the book focuses special attention on airport security, bioterrorism, and other timely issues.</P><P><A HREF=\"http://www.abanet.org/webapp/wcs/stores/servlet/ProductDisplay?storeId=10251&amp;productId=-17518&amp;categoryId=-3666\">LAW PRACTICE MADE EASY</A><br>A new ABA book, <I>Attorney and Law Firm Guide to the Business of Law, Second Edition</I>, focuses on the three elements of a successful practice - getting clients, doing quality work, and getting paid for your effort.  This guide demonstrates how to create a comprehensive yet practical business plan and how to put the plan into action.</P><P align=\"left\"><A HREF=\"http://www.abanet.org/media/back_briefs.html\">BACK BRIEFS</A></P></TD></TR></TABLE>"



function regenerate(){
window.location.reload()
}
function regenerate2(){
if (document.layers){
appear()
setTimeout("window.onresize=regenerate",550)
}
}


function changetext(whichcontent){

if (document.all||document.getElementById){
cross_el=document.getElementById? document.getElementById("descriptions"):document.all.descriptions
cross_el.innerHTML='<font face="Verdana"><small>'+whichcontent+'<font></small>'
}
else if (document.layers){
document.d1.document.d2.document.write('<font face="Verdana"><small>'+whichcontent+'</small></font>')
document.d1.document.d2.document.close()
}

}


function appear(){
document.d1.visibility='show'
}

//window.onload=regenerate2







