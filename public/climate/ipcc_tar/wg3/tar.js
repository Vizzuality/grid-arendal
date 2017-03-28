//Check if window is in a frame or not	
// if (window == top) 
// {
	// var url = location.href.replace('www.','');
	// url = url.replace('http://grida.no','');
	// setTimeout('top.location.replace("/publications/other/ipcc_tar?src=" + url)', 100);
// }

// Enter here the last page number of this report
var LastPageOfReport = 481;

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
	document.write ('<option' + ChapterSelected(3,9) + ' value="003.htm">Summary for Policymakers</option>');
	document.write ('<option' + ChapterSelected(10,47) + ' value="010.htm">Technical Summary</option>');
	document.write ('<option' + ChapterSelected(48,67) + ' value="048.htm">1. Setting the Stage: Climate Change and Sustainable Development</option>');
	document.write ('<option' + ChapterSelected(68,88) + ' value="068.htm">2. Greenhouse Gas Emission Mitigation Scenarios and Implications</option>');
	document.write ('<option' + ChapterSelected(89,154) + ' value="089.htm">3. Technological and Economic Potential of Greenhouse Gas...</option>');
	document.write ('<option' + ChapterSelected(155,178) + ' value="155.htm">4. Technological and Economic Potential of Options to Enhance...</option>');
	document.write ('<option' + ChapterSelected(179,223) + ' value="179.htm">5. Barriers, Opportunities, and Market Potential of Technologies...</option>');
	document.write ('<option' + ChapterSelected(224,265) + ' value="224.htm">6. Policies, Measures, and Instruments</option>');
	document.write ('<option' + ChapterSelected(266,318) + ' value="266.htm">7. Costing Methodologies</option>');
	document.write ('<option' + ChapterSelected(319,352) + ' value="319.htm">8. Global, Regional, and National Costs and Ancillary Benefits...</option>');
	document.write ('<option' + ChapterSelected(353,378) + ' value="353.htm">9. Sector Costs and Ancillary Benefits of Mitigation</option>');
	document.write ('<option' + ChapterSelected(379,450) + ' value="379.htm">10. Decision-making Frameworks</option>');
	document.write ('<option' + ChapterSelected(451,451) + ' value="451.htm">Appendices</option>');
	document.write ('<option' + ChapterSelected(452,453) + ' value="452.htm">Appendix I: List of Authors and Reviewers</option>');
	document.write ('<option' + ChapterSelected(454,475) + ' value="454.htm">Appendix II: Glossary</option>');
	document.write ('<option' + ChapterSelected(476,476) + ' value="476.htm">Appendix III: Acronyms, Abbreviations, and Chemical Compounds</option>');
	document.write ('<option' + ChapterSelected(477,477) + ' value="477.htm">Appendix IV: Units, Conversion Factors, and GDP Deflators</option>');
	document.write ('<option' + ChapterSelected(478,479) + ' value="478.htm">Appendix V: List of Annex I, Annex II, and Annex B Countries</option>');
	document.write ('<option' + ChapterSelected(480,480) + ' value="480.htm">Appendix VI: List of Major IPCC Reports </option>');
	document.write ('<option' + ChapterSelected(481,481) + ' value="481.htm">Appendix VII: Figures and Tables in this Report</option>');
	
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
		document.write('<a href="index.htm">Table of contents</a> | <a href=' + prevPage + '.htm>Previous page</a>');
		if (CurrentPageNumber() != LastPageOfReport) {
			nextPage = CurrentPageNumber() + 1;
			if (nextPage < 10) { nextPage = '0' + nextPage; }
			if (nextPage < 100){ nextPage = '0' + nextPage; } 
			
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