//Check if window is in a frame or not	
// if (window == top) 
// {	
	// var url = location.href.replace('www.','');
	// url = url.replace('http://grida.no','');
	// setTimeout('top.location.replace("/publications/other/ipcc_sr?src=" + url)', 100);
// }

// Enter here the last page number of this report
var LastPageOfReport = 364;

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
	document.write ('<option' + ChapterSelected(1,1) + ' value="001.htm">Foreword</option>');
	document.write ('<option' + ChapterSelected(2,2) + ' value="002.htm">Preface</option>');
	document.write ('<option' + ChapterSelected(500,503) + ' value="500.htm">Summary for Policymakers</option>');
	document.write ('<option' + ChapterSelected(504,530) + ' value="504.htm">Technical Summary</option>');
	document.write ('<option' + ChapterSelected(3,16) + ' value="003.htm">Chapter 1. A Framework for Decision-making</option>');
	document.write ('<option' + ChapterSelected(17,32) + ' value="017.htm">Chapter 2. Trends in Technology Transfer: Financial Resource Flows </option>');
	document.write ('<option' + ChapterSelected(33,50) + ' value="033.htm">Chapter 3. International Agreements and Legal Structures</option>');
	document.write ('<option' + ChapterSelected(51,91) + ' value="051.htm">Chapter 4. Enabling Environments for Technology Transfer</option>');
	document.write ('<option' + ChapterSelected(92,121) + ' value="092.htm">Chapter 5. Financing and Partnerships for Technology Transfer</option>');
	document.write ('<option' + ChapterSelected(122,126) + ' value="122.htm">Chapter 6. Introduction to Section II</option>');
	document.write ('<option' + ChapterSelected(127,150) + ' value="127.htm">Chapter 7. Residential, Commercial, and Institutional Buildings Sector</option>');
	document.write ('<option' + ChapterSelected(151,167) + ' value="151.htm">Chapter 8. Transportation</option>');
	document.write ('<option' + ChapterSelected(168,183) + ' value="168.htm">Chapter 9. Industry</option>');
	document.write ('<option' + ChapterSelected(184,205) + ' value="184.htm">Chapter 10. Energy Supply</option>');
	document.write ('<option' + ChapterSelected(206,227) + ' value="206.htm">Chapter 11. Agricultural Sector</option>');
	document.write ('<option' + ChapterSelected(228,252) + ' value="228.htm">Chapter 12. Forestry Sector</option>');
	document.write ('<option' + ChapterSelected(253,268) + ' value="253.htm">Chapter 13. Solid Waste Management and Wastewater Treatment</option>');
	document.write ('<option' + ChapterSelected(269,289) + ' value="269.htm">Chapter 14. Human Health</option>');
	document.write ('<option' + ChapterSelected(290,317) + ' value="290.htm">Chapter 15. Coastal Adaptation</option>');
	document.write ('<option' + ChapterSelected(318,359) + ' value="318.htm">Chapter 16. Case Studies</option>');
	document.write ('<option' + ChapterSelected(360,351) + ' value="360.htm">Annex A. Section Coordinators, Coordinating Lead Authors, ....</option>');
	document.write ('<option' + ChapterSelected(362,362) + ' value="362.htm">Annex B. Glossary of Terms</option>');
	document.write ('<option' + ChapterSelected(363,363) + ' value="363.htm">Annex C. Acronyms and Abbreviations</option>');
	document.write ('<option' + ChapterSelected(364,364) + ' value="364.htm">Annex D. List of Major IPCC Reports</option>');
	document.write ('</select> ');
	document.write ('<input type="button" name="Button1" value="Go" onClick="MM_jumpMenuGo(\'ChapterJumpMenu\',\'this\',1)">');
}

function PrevNext() {
	var prevPage, nextPage;

	if (isNaN(CurrentPageNumber())) { 
		document.write('Table of contents | <a href="001.htm">Next page</a>');
	} else {
		if (CurrentPageNumber() == 1) { 
			prevPage='index'; 
		} else { 
			prevPage=CurrentPageNumber() - 1; 
		}
		if (prevPage < 10) { prevPage = '0' + prevPage; }
		if (prevPage < 100) { prevPage = '0' + prevPage; }
		if (prevPage == 002) { prevPage = '530'; }
		if (prevPage == 499){ prevPage = '002' ; }
		document.write('<a href="index.htm">Table of contents</a> | <a href=' + prevPage + '.htm>Previous page</a>');
		if (CurrentPageNumber() != LastPageOfReport) {
			nextPage = CurrentPageNumber() + 1;
			if (nextPage < 10) { nextPage = '0' + nextPage; }
			if (nextPage < 100){ nextPage = '0' + nextPage; }
			if (nextPage == 003) { nextPage = '500'; }
			if (nextPage == 501) { prevPage = '002'; }
			if (prevPage == 529) { nextPage = '003'; }
			
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