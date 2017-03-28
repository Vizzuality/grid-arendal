// Enter here the last page number of this report
var LastPageOfReport = 613;

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function MM_findObj(n, d) { //v3.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;
}

function MM_jumpMenuGo(selName,targ,restore){ //v3.0
  var selObj = MM_findObj(selName); 
  if (selObj) MM_jumpMenu(targ,selObj,restore);
}

function CurrentPageNumber() {
	return parseInt(location.pathname.substr(location.pathname.length-7,3),10);
}

function ChapterSelected(lo,hi) {
	if ((CurrentPageNumber() >= lo) && (CurrentPageNumber() <= hi)) {
		return(' selected');
	} else {
		return('');
	}
}

function ShowChapterJumpMenu() {
	document.write ('<select name="ChapterJumpMenu" onChange="MM_jumpMenu(\'parent\',this,1)">');
	document.write ('<option value="index.htm">Table of contents</option>');
	// Set the values in the call to ChapterSelected as the first and last web page numbers of the chapter.
	// Set the option value to the first web page of the chapter.
	document.write ('<option' + ChapterSelected(38,80) + ' value="038.htm">Chapter 1: Integrating Environment and Development: 1972–2002</option>');
	document.write ('<option' + ChapterSelected(81,486) + ' value="081.htm">Chapter 2: State of the Environment and Policy Retrospective: 1972–2002</option>');
	document.write ('<option' + ChapterSelected(487,504) + ' value="497.htm">Chapter 3: Human Vulnerability to Environmental Change</option>');
	document.write ('<option' + ChapterSelected(505,575) + ' value="515.htm">Chapter 4: Outlook: 2002–32</option>');
	document.write ('<option' + ChapterSelected(576,593) + ' value="586.htm">Chapter 5: Options for Action</option>');
	document.write ('</select>');
	//document.write ('<input type="button" name="Button1" value="Go" onClick="MM_jumpMenuGo(\'ChapterJumpMenu\',\'parent\',1)">');
}

function PrevNext() {
	var prevPage, nextPage;

	if (isNaN(CurrentPageNumber())) { 
		document.write('Table&nbsp;of&nbsp;contents&nbsp;|&nbsp;<a href="001.htm">Next&nbsp;page</a>');
	} else {
		if (CurrentPageNumber() == 1) { 
			document.write('<a href="index.htm">Table&nbsp;of&nbsp;contents</a>');
		} else { 
			prevPage=CurrentPageNumber() - 1; 
			if (prevPage < 10) { prevPage = '0' + prevPage; }
			if (prevPage < 100) { prevPage = '0' + prevPage; }
			document.write('<a href="index.htm">Table&nbsp;of&nbsp;contents</a>&nbsp;|&nbsp;');
			document.write('<a href=' + prevPage + '.htm>Previous&nbsp;page</a>');
		}
		if (CurrentPageNumber() != LastPageOfReport) {
			nextPage = CurrentPageNumber() + 1;
			if (nextPage < 10) { nextPage = '0' + nextPage; }
			if (nextPage < 100){ nextPage = '0' + nextPage; } 
			document.write('&nbsp;|&nbsp;<a href=' + nextPage + '.htm>Next&nbsp;page</a>');
		} else { if (CurrentPageNumber() == LastPageOfReport){
			document.write('&nbsp;|&nbsp;End&nbsp;of&nbsp;document');}
		}
	}
}