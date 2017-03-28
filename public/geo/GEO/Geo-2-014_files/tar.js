// Enter here the last page number of this report
var LastPageOfReport = 692;

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
	document.write ('<option' + ChapterSelected(1,2) + ' value="001.htm">Frontmatter</option>');
	document.write ('<option' + ChapterSelected(3,3) + ' value="003.htm">Foreword</option>');
	document.write ('<option' + ChapterSelected(4,4) + ' value="004.htm">Preface</option>');
	document.write ('<option' + ChapterSelected(5,20) + ' value="005.htm">Summary for Policymakers</option>');
	document.write ('<option' + ChapterSelected(21,53) + ' value="021.htm">Technical Summary</option>');
	document.write ('<option' + ChapterSelected(54,67) + ' value="054.htm">Chapter 1. Overview of Impacts, Adaptation, and Vulnerability ...</option>');
	document.write ('<option' + ChapterSelected(68,121) + ' value="068.htm">Chapter 2. Methods and Tools</option>');
	document.write ('<option' + ChapterSelected(122,158) + ' value="122.htm">Chapter 3. Developing and Applying Scenarios</option>');
	document.write ('<option' + ChapterSelected(159,195) + ' value="159.htm">Chapter 4. Hydrology and Water Resources</option>');
	document.write ('<option' + ChapterSelected(196,383) + ' value="196.htm">Chapter 5. Ecosystems and Their Goods and Services</option>');
	document.write ('<option' + ChapterSelected(283,304) + ' value="283.htm">Chapter 6. Coastal Zones and Marine Ecosystems</option>');
	document.write ('<option' + ChapterSelected(305,320) + ' value="305.htm">Chapter 7. Human Settlements, Energy, and Industry</option>');
	document.write ('<option' + ChapterSelected(321,346) + ' value="321.htm">Chapter 8. Insurance and Other Financial Services</option>');
	document.write ('<option' + ChapterSelected(347,376) + ' value="347.htm">Chapter 9. Human Health</option>');
	document.write ('<option' + ChapterSelected(377,410) + ' value="377.htm">Chapter 10. Africa</option>');
	document.write ('<option' + ChapterSelected(411,462) + ' value="411.htm">Chapter 11. Asia</option>');
	document.write ('<option' + ChapterSelected(463,490) + ' value="463.htm">Chapter 12. Australia and New Zealand</option>');
	document.write ('<option' + ChapterSelected(491,515) + ' value="491.htm">Chapter 13. Europe</option>');
	document.write ('<option' + ChapterSelected(516,544) + ' value="516.htm">Chapter 14. Latin America</option>');
	document.write ('<option' + ChapterSelected(545,591) + ' value="545.htm">Chapter 15. North America</option>');
	document.write ('<option' + ChapterSelected(592,618) + ' value="592.htm">Chapter 16. Polar Regions (Arctic and Antarctic)</option>');
	document.write ('<option' + ChapterSelected(619,640) + ' value="619.htm">Chapter 17. Small Island States</option>');
	document.write ('<option' + ChapterSelected(641,656) + ' value="641.htm">Chapter 18. Adaptation to Climate Change in the Context of ...</option>');
	document.write ('<option' + ChapterSelected(657,687) + ' value="657.htm">Chapter 19. Vulnerability to Climate Change and Reasons ...</option>');
	document.write ('<option' + ChapterSelected(688,688) + ' value="688.htm">Annex A. Authors and Expert Reviewers</option>');
	document.write ('<option' + ChapterSelected(689,689) + ' value="689.htm">Annex B. Glossary of Terms</option>');
	document.write ('<option' + ChapterSelected(690,690) + ' value="690.htm">Annex C. Acronyms, Abbreviations, and Units</option>');
	document.write ('<option' + ChapterSelected(691,691) + ' value="691.htm">Annex D. List of Major IPCC Reports</option>');
	document.write ('<option' + ChapterSelected(692,692) + ' value="692.htm">Annex E. Figures and Tables in this Report</option>');
	document.write ('</select> ');
	document.write ('<input type="button" name="Button1" value="Go" onClick="MM_jumpMenuGo(\'ChapterJumpMenu\',\'parent\',1)">');
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