//Check if window is in a frame or not	
// if (window == top) 
// {	
	// var url = location.href.replace('www.','');
	// url = url.replace('http://grida.no','');
	// setTimeout('top.location.replace("/publications/other/ipcc_sr?src=" + url)', 100);
// }

var LastPageOfReport=319;
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
	document.write ('<option' + ChapterSelected(501,501) + ' value="501.htm">Preface</option>');
	document.write ('<option' + ChapterSelected(1,13) + ' value="001.htm">Summary for Policymakers</option>');
	document.write ('<option' + ChapterSelected(14,37) + ' value="014.htm">Chapter 1. Global Perspective</option>');
	document.write ('<option' + ChapterSelected(38,111) + ' value="038.htm">Chapter 2. Implications of Different Definitions and Generic Issues</option>');
	document.write ('<option' + ChapterSelected(112,156) + ' value="112.htm">Chapter 3. Afforestation, Reforestation, and Deforestation...</option>');
	document.write ('<option' + ChapterSelected(157,245) + ' value="157.htm">Chapter 4. Additional Human-Induced Activities...</option>');
	document.write ('<option' + ChapterSelected(246,292) + ' value="246.htm">Chapter 5. Project-Based Activities</option>');
	document.write ('<option' + ChapterSelected(293,316) + ' value="293.htm">Chapter 6. Implications of the Kyoto Protocol for the Reporting...</option>');
	document.write ('<option' + ChapterSelected(317,317) + ' value="317.htm">Annex A: Authors and Expert Reviewers</option>');
	document.write ('<option' + ChapterSelected(318,318) + ' value="318.htm">Annex B: Acronyms, Abbreviations, and Units</option>');
	document.write ('<option' + ChapterSelected(319,319) + ' value="319.htm">Annex C: List of Major IPCC Reports</option>');
	document.write ('</select> ');
	document.write ('<input type="button" name="Button1" value="Go" onClick="MM_jumpMenuGo(\'ChapterJumpMenu\',\'this\',1)">');
}

function PrevNext() {
	var prevPage, nextPage;

	if (isNaN(CurrentPageNumber())) { 
		document.write('Table of contents | <a href="500.htm">Next page</a>');
	} else {
		if (CurrentPageNumber() == 1) { 
			prevPage='501'; 
		} else { 
			prevPage=CurrentPageNumber() - 1; 
		}
		if (prevPage < 10) { prevPage = '0' + prevPage; }
		if (prevPage < 100) { prevPage = '0' + prevPage; }
		if (prevPage == 499){ prevPage = 'index' ; } 
		if (nextPage == 002){ prevPage = '501'; }		
		document.write('<a href="index.htm">Table of contents</a> | <a href=' + prevPage + '.htm>Previous page</a>');
		if (CurrentPageNumber() != LastPageOfReport) {
			nextPage = CurrentPageNumber() + 1;
			if (nextPage < 10) { nextPage = '0' + nextPage; }
			if (nextPage < 100){ nextPage = '0' + nextPage; } 
			if (prevPage == 500) { nextPage = '001' }
		
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