//Check if window is in a frame or not	
// if (window == top) 
// {	
	// var url = location.href.replace('www.','');
	// url = url.replace('http://grida.no','');
	// setTimeout('top.location.replace("/publications/other/ipcc_sr?src=" + url)', 100);
// }

// Enter here the last page number of this report
var LastPageOfReport = 169;

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
	lo = parseInt(lo,10);
	hi = parseInt(hi,10);
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
	document.write ('<option' + ChapterSelected(1,8) + ' value="001.htm">Summary for Policymakers</option>');
	document.write ('<option' + ChapterSelected(9,22) + ' value="009.htm">Technical Summary</option>');
	document.write ('<option' + ChapterSelected(23,33) + ' value="023.htm">Chapter 1. Background and Overview</option>');
	document.write ('<option' + ChapterSelected(34,48) + ' value="034.htm">Chapter 2. An Overview of the Scenario Literature</option>');
	document.write ('<option' + ChapterSelected(49,88) + ' value="049.htm">Chapter 3. Scenario Driving Forces</option>');
	document.write ('<option' + ChapterSelected(89,113) + ' value="089.htm">Chapter 4. An Overview of Scenarios</option>');
	document.write ('<option' + ChapterSelected(114,130) + ' value="114.htm">Chapter 5. Emission Scenarios</option>');
	document.write ('<option' + ChapterSelected(131,144) + ' value="131.htm">Chapter 6. Summary Discussions and Recommendations</option>');
	document.write ('<option' + ChapterSelected(145,145) + ' value="145.htm">Appendices index</option>');
	document.write ('<option' + ChapterSelected(146,146) + ' value="146.htm">Appendix I</option>');
	document.write ('<option' + ChapterSelected(147,148) + ' value="147.htm">Appendix II</option>');
	document.write ('<option' + ChapterSelected(149,149) + ' value="149.htm">Appendix III</option>');
	document.write ('<option' + ChapterSelected(150,155) + ' value="150.htm">Appendix IV</option>');
	document.write ('<option' + ChapterSelected(156,157) + ' value="156.htm">Appendix V</option>');
	document.write ('<option' + ChapterSelected(158,163) + ' value="158.htm">Appendix VI</option>');
	document.write ('<option' + ChapterSelected(164,164) + ' value="164.htm">Appendix VII</option>');
	document.write ('<option' + ChapterSelected(165,165) + ' value="165.htm">Appendix VIII</option>');
	document.write ('<option' + ChapterSelected(166,166) + ' value="166.htm">Appendix IX</option>');
	document.write ('<option' + ChapterSelected(167,167) + ' value="167.htm">Appendix X</option>');
	document.write ('<option' + ChapterSelected(168,168) + ' value="168.htm">Appendix XI</option>');
	document.write ('<option' + ChapterSelected(169,169) + ' value="169.htm">Appendix XII</option>');

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