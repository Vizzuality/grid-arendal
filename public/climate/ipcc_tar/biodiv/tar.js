// Enter here the last page number of this report
var LastPageOfReport = 563;

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
	document.write ('<option' + ChapterSelected(1,2) + ' value="001.htm">Summary</option>');
	document.write ('<option' + ChapterSelected(3,3) + ' value="003.htm">Foreword</option>');
	document.write ('<option' + ChapterSelected(4,4) + ' value="004.htm">Preface</option>');
	document.write ('<option' + ChapterSelected(5,9) + ' value="005.htm">Summary for Policymakers</option>');
	document.write ('<option' + ChapterSelected(10,37) + ' value="010.htm">Technical Summary</option>');
	document.write ('<option' + ChapterSelected(38,47) + ' value="038.htm">Chapter 1. The Climate System: an Overview</option>');
	document.write ('<option' + ChapterSelected(48,94) + ' value="048.htm">Chapter 2. Observed Climate Variability and Change</option>');
	document.write ('<option' + ChapterSelected(95,126) + ' value="095.htm">Chapter 3. The Carbon Cycle and Atmospheric Carbon Dioxide</option>');
	document.write ('<option' + ChapterSelected(127,159) + ' value="127.htm">Chapter 4. Atmospheric Chemistry and Greenhouse Gases</option>');
	document.write ('<option' + ChapterSelected(160,211) + ' value="160.htm">Chapter 5. Aerosols, their Direct and Indirect Effects</option>');
	document.write ('<option' + ChapterSelected(212,259) + ' value="212.htm">Chapter 6. Radiative Forcing of Climate Change</option>');
	document.write ('<option' + ChapterSelected(260,307) + ' value="260.htm">Chapter 7. Physical Climate Processes and Feedbacks</option>');
	document.write ('<option' + ChapterSelected(308,337) + ' value="308.htm">Chapter 8. Model Evaluation</option>');
	document.write ('<option' + ChapterSelected(338,372) + ' value="338.htm">Chapter 9. Projections of Future Climate Change</option>');
	document.write ('<option' + ChapterSelected(373,407) + ' value="373.htm">Chapter 10. Regional Climate Information – Evaluation and Projections</option>');
	document.write ('<option' + ChapterSelected(408,438) + ' value="408.htm">Chapter 11. Changes in Sea Level</option>');
	document.write ('<option' + ChapterSelected(439,473) + ' value="439.htm">Chapter 12. Detection of Climate Change and Attribution of Causes</option>');
	document.write ('<option' + ChapterSelected(474,499) + ' value="474.htm">Chapter 13. Climate Scenario Development</option>');
	document.write ('<option' + ChapterSelected(500,517) + ' value="500.htm">Chapter 14. Advancing Our Understanding</option>');
	document.write ('<option' + ChapterSelected(518,518) + ' value="518.htm">Appendix I Glossary</option>');
	document.write ('<option' + ChapterSelected(519,557) + ' value="519.htm">Appendix II SRES Tables</option>');
	document.write ('<option' + ChapterSelected(558,558) + ' value="558.htm">Appendix III Contributors to the IPCC WGI Third Assessment Report</option>');
	document.write ('<option' + ChapterSelected(559,559) + ' value="559.htm">Appendix IV Reviewers of the IPCC WGI Third Assessment Report</option>');
	document.write ('<option' + ChapterSelected(560,560) + ' value="560.htm">Appendix V Acronyms and Abbreviations</option>');
	document.write ('<option' + ChapterSelected(561,561) + ' value="561.htm">Appendix VI Units</option>');
	document.write ('<option' + ChapterSelected(562,562) + ' value="562.htm">Appendix VII Some Chemical Symbols used in this Report</option>');
	document.write ('<option' + ChapterSelected(563,563) + ' value="563.htm">Appendix VIII Figures and Tables in this Report</option>');
	document.write ('</select> ');
	document.write ('<input type="button" name="Button1" value="Go" onClick="MM_jumpMenuGo(\'ChapterJumpMenu\',\'parent\',1)">');
}

function PrevNext() {
	var prevPage, nextPage;

	if (isNaN(CurrentPageNumber())) { 
		document.write('Table of contents | <a href="001.htm" target="_top">Next page</a>');
	} else {
		if (CurrentPageNumber() == 1) { 
			prevPage='index'; 
		} else { 
			prevPage=CurrentPageNumber() - 1; 
		}
		if (prevPage < 10) { prevPage = '0' + prevPage; }
		if (prevPage < 100) { prevPage = '0' + prevPage; }		
		document.write('<a href="index.htm" target="_top">Table of contents</a> | <a href=' + prevPage + '.htm target="_top">Previous page</a>');
		if (CurrentPageNumber() != LastPageOfReport) {
			nextPage = CurrentPageNumber() + 1;
			if (nextPage < 10) { nextPage = '0' + nextPage; }
			if (nextPage < 100){ nextPage = '0' + nextPage; } 
			
			document.write(' | <a href=' + nextPage + '.htm target="_top">Next page</a>');
		} else { if (CurrentPageNumber() == LastPageOfReport){
			document.write(' | End of report');}
		}
	}
}

function showFootnote (chapter,name) {
	theURL = 'fn' + chapter + '.htm#' + name;
	window.open(theURL,'references_win','width=350,height=200,scrollbars,resizable'); 
}