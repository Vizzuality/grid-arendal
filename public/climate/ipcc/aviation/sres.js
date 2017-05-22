//Check if window is in a frame or not	
// if (window == top) 
// {	
	// var url = location.href.replace('www.','');
	// url = url.replace('http://grida.no','');
	// setTimeout('top.location.replace("/publications/other/ipcc_sr?src=" + url)', 100);
// }

// Enter here the last page number of this report
var LastPageOfReport = 160;

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
	document.write ('<option' + ChapterSelected(3,12) + ' value="003.htm">Summary for Policymakers</option>');
	document.write ('<option' + ChapterSelected(13,19) + ' value="013.htm">Chapter 1 Introduction</option>');
	document.write ('<option' + ChapterSelected(20,30) + ' value="020.htm">Chapter 2 Impacts of Aircraft Emissions on Atmospheric Ozone</option>');
	document.write ('<option' + ChapterSelected(31,43) + ' value="031.htm">Chapter 3 Aviation-Produced Aerosols and Cloudiness</option>');
	document.write ('<option' + ChapterSelected(44,53) + ' value="044.htm">Chapter 4 Modeling the Chemical Composition of the Future Atmosphere</option>');
	document.write ('<option' + ChapterSelected(54,62) + ' value="054.htm">Chapter 5 Solar Ultraviolet Irradiance at the Ground</option>');
	document.write ('<option' + ChapterSelected(63,87) + ' value="063.htm">Chapter 6 Potential Climate Change from Aviation</option>');
	document.write ('<option' + ChapterSelected(88,117) + ' value="088.htm">Chapter 7 Aircraft Technology and Its Relation to Emissions</option>');
	document.write ('<option' + ChapterSelected(118,129) + ' value="118.htm">Chapter 8 Air Transport Operations and Relation to Emissions</option>');
	document.write ('<option' + ChapterSelected(130,147) + ' value="130.htm">Chapter 9 Aircraft Emissions: Current Inventories and Future Scenarios</option>');
	document.write ('<option' + ChapterSelected(148,156) + ' value="148.htm">Chapter 10 Regulatory and Market-Based Mitigation Measures</option>');
	document.write ('<option' + ChapterSelected(157,157) + ' value="157.htm">Annex A. Authors, Contributors, and Expert Reviewers</option>');
	document.write ('<option' + ChapterSelected(158,158) + ' value="158.htm">Annex B. Glossary of Terms</option>');
	document.write ('<option' + ChapterSelected(159,159) + ' value="159.htm">Annex C. Acronyms, Abbreviations, and Units</option>');
	document.write ('<option' + ChapterSelected(160,160) + ' value="160.htm">Annex D. List of Major IPCC Reports</option>');
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