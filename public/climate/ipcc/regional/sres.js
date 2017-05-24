//Check if window is in a frame or not	
// if (window == top) 
// {	
	// var url = location.href.replace('www.','');
	// url = url.replace('http://grida.no','');
	// setTimeout('top.location.replace("/publications/other/ipcc_sr?src=" + url)', 100);
// }

// Enter here the last page number of this report
var LastPageOfReport = 330;

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
	document.write ('<select name="ChapterJumpMenu" onChange="MM_jumpMenu(\'this\',this,1)">');
	document.write ('<option value="index.htm">Table of contents</option>');
	// Set the values in the call to ChapterSelected as the first and last web page numbers of the chapter.
	// Set the option value to the first web page of the chapter.
	document.write ('<option' + ChapterSelected(500,500) + ' value="500.htm">Foreword</option>');
	document.write ('<option' + ChapterSelected(500,500) + ' value="500.htm#preface">Preface</option>');
	document.write ('<option' + ChapterSelected(501,516) + ' value="501.htm">Summary for Policymakers</option>');
	document.write ('<option' + ChapterSelected(1,5) + ' value="001.htm">Chapter 1: Introduction</option>');
	document.write ('<option' + ChapterSelected(6,41) + ' value="006.htm">Chapter 2: Africa</option>');
	document.write ('<option' + ChapterSelected(42,57) + ' value="042.htm">Chapter 3: The Arctic and the Antarctic</option>');
	document.write ('<option' + ChapterSelected(58,90) + ' value="058.htm">Chapter 4: Australasia</option>');
	document.write ('<option' + ChapterSelected(91,121) + ' value="091.htm">Chapter 5: Europe</option>');
	document.write ('<option' + ChapterSelected(122,152) + ' value="122.htm">Chapter 6: Latin America</option>');
	document.write ('<option' + ChapterSelected(153,172) + ' value="153.htm">Chapter 7: Middle East and Arid Asia</option>');
	document.write ('<option' + ChapterSelected(173,238) + ' value="173.htm">Chapter 8: North America</option>');
	document.write ('<option' + ChapterSelected(239,259) + ' value="239.htm">Chapter 9: Small Island States</option>');
	document.write ('<option' + ChapterSelected(260,280) + ' value="260.htm">Chapter 10: Temperate Asia</option>');
	document.write ('<option' + ChapterSelected(281,304) + ' value="281.htm">Chapter 11: Tropical Asia</option>');
	document.write ('<option' + ChapterSelected(305,305) + ' value="305.htm">Annex A</option>');
	document.write ('<option' + ChapterSelected(306,314) + ' value="306.htm">Annex B</option>');
	document.write ('<option' + ChapterSelected(315,324) + ' value="315.htm">Annex C</option>');
	document.write ('<option' + ChapterSelected(325,326) + ' value="325.htm">Annex D</option>');
	document.write ('<option' + ChapterSelected(326,326) + ' value="326.htm">Annex E</option>');
	document.write ('<option' + ChapterSelected(327,327) + ' value="327.htm">Annex F</option>');
	document.write ('<option' + ChapterSelected(328,328) + ' value="328.htm">Annex G</option>');
	document.write ('<option' + ChapterSelected(329,329) + ' value="329.htm">Annex H</option>');
	document.write ('<option' + ChapterSelected(330,330) + ' value="330.htm">Annex I</option>');
	document.write ('</select> ');
	document.write ('<input type="button" name="Button1" value="Go" onClick="MM_jumpMenuGo(\'ChapterJumpMenu\',\'this\',1)">');
}

function PrevNext() {
	var prevPage, nextPage;

	if (isNaN(CurrentPageNumber())) { 
		document.write('Table of contents | <a href="500.htm">Next page</a>');
	} else {
		if (CurrentPageNumber() == 1) { 
			prevPage='516'; 
		} else { 
			prevPage=CurrentPageNumber() - 1; 
		}
		if (prevPage < 10) { prevPage = '0' + prevPage; }
		if (prevPage < 100) { prevPage = '0' + prevPage; }	
		if (prevPage == 499) { prevPage = 'index'; }	
		if (nextPage == 002){ prevPage = '516'; }
			
		document.write('<a href="index.htm">Table of contents</a> | <a href=' + prevPage + '.htm>Previous page</a>');
		if (CurrentPageNumber() != LastPageOfReport) {
			nextPage = CurrentPageNumber() + 1;
			if (nextPage < 10) { nextPage = '0' + nextPage; }
			if (nextPage < 100){ nextPage = '0' + nextPage; } 
			if (prevPage == 515){ nextPage = '001'; } 
		
			document.write(' | <a href=' + nextPage + '.htm>Next page</a>');
		} else { if (CurrentPageNumber() == LastPageOfReport){
			document.write(' | End of report');}
		}
	}
}

function showFootnote (chapter,name) {
	theURL = 'fn' + chapter + '.htm#' + name;
	window.open(theURL,'references_win','width=350,height=200,scrollbars,resizable'); 
}