//Check if window is in a frame or not	
// if (window == top) 
// {	
	// var url = location.href.replace('www.','');
	// url = url.replace('http://grida.no','');
	// setTimeout('top.location.replace("/publications/other/ipcc_tar?src=" + url)', 100);
// }

// Enter here the last page number of this report
var LastPageOfReport = 208;

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function MM_findObj(n, d) { //v3.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i>d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;
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
	document.write ('<select name="ChapterJumpMenu" class="textfield" onChange="MM_jumpMenu(\'this\',this,1)">');
	document.write ('<option value="index.htm">Table des matières</option>');
	// Set the values in the call to ChapterSelected as the first and last web page numbers of the chapter.
	// Set the option value to the first web page of the chapter.
	document.write ('<option' + ChapterSelected(1,2) + ' value="001.htm">Sommaire</option>');
	document.write ('<option' + ChapterSelected(3,3) + ' value="003.htm">Avant-propos</option>');
	document.write ('<option' + ChapterSelected(4,4) + ' value="004.htm">Préface</option>');
	document.write ('<option' + ChapterSelected(5,15) + ' value="005.htm">Résumé à l’intention des décideurs</option>');
	document.write ('<option' + ChapterSelected(16,16) + ' value="016.htm">Document de synthèse - Questions</option>');
	document.write ('<option' + ChapterSelected(17,18) + ' value="017.htm">Document de synthèse - Question 1</option>');
	document.write ('<option' + ChapterSelected(19,25) + ' value="019.htm">Document de synthèse - Question 2</option>');
	document.write ('<option' + ChapterSelected(26,36) + ' value="026.htm">Document de synthèse - Question 3</option>');
	document.write ('<option' + ChapterSelected(37,40) + ' value="037.htm">Document de synthèse - Question 4</option>');
	document.write ('<option' + ChapterSelected(41,46) + ' value="041.htm">Document de synthèse - Question 5</option>');
	document.write ('<option' + ChapterSelected(47,50) + ' value="047.htm">Document de synthèse - Question 6</option>');
	document.write ('<option' + ChapterSelected(51,58) + ' value="051.htm">Document de synthèse - Question 7</option>');
	document.write ('<option' + ChapterSelected(59,66) + ' value="059.htm">Document de synthèse - Question 8</option>');
	document.write ('<option' + ChapterSelected(67,73) + ' value="067.htm">Document de synthèse - Question 9</option>');
	document.write ('<option' + ChapterSelected(74,74) + ' value="074.htm">Résumés des Groupes de travail</option>');
	document.write ('<option' + ChapterSelected(75,79) + ' value="075.htm">GT1 - Résumé à l’intention des décideurs</option>');
	document.write ('<option' + ChapterSelected(80,107) + ' value="080.htm">GT1 - Résumé technique</option>');
	document.write ('<option' + ChapterSelected(108,123) + ' value="108.htm">GT2 - Résumé à l’intention des décideurs</option>');
	document.write ('<option' + ChapterSelected(124,156) + ' value="124.htm">GT2 - Résumé technique</option>');
	document.write ('<option' + ChapterSelected(157,163) + ' value="157.htm">GT3 - Résumé à l’intention des décideurs</option>');
	document.write ('<option' + ChapterSelected(164,201) + ' value="164.htm">GT3 - Résumé technique</option>');
	document.write ('<option' + ChapterSelected(202,202) + ' value="203.htm">Pièces Annexes</option>');
	document.write ('<option' + ChapterSelected(203,203) + ' value="204.htm">Annexe A. Auteurs et réviseurs experts</option>');
	document.write ('<option' + ChapterSelected(204,204) + ' value="205.htm">Annexe B. Glossaire</option>');
	document.write ('<option' + ChapterSelected(205,205) + ' value="206.htm">Annexe C. Acronymes, abréviations, et unités</option>');
	document.write ('<option' + ChapterSelected(206,206) + ' value="207.htm">Annexe D. Questions scientifiques, techniques et socio-économiques choisies par le Groupe</option>');
	document.write ('<option' + ChapterSelected(207,207) + ' value="208.htm">Annexe E. Liste des principaux rapports publiés par le GIEC</option>');
	document.write ('<option' + ChapterSelected(208,208) + ' value="208.htm">Figures et tableaux</option>');
	document.write ('</select> ');
	document.write ('<input type="button" name="Button1" class="button" value="Go" onClick="MM_jumpMenuGo(\'ChapterJumpMenu\',\'this\',1)">');
}

function PrevNext() {
	var prevPage, nextPage;

	if (isNaN(CurrentPageNumber())) { 
		document.write('Table des matières | <a href="001.htm">Page suivante</a>');
	} else {
		if (CurrentPageNumber() == 1) { 
			prevPage='index'; 
		} else { 
			prevPage=CurrentPageNumber() - 1; 
		}
		if (prevPage < 10) { prevPage = '0' + prevPage; }
		if (prevPage < 100) { prevPage = '0' + prevPage; }		
		document.write('<a href="index.htm">Table des matières</a> | <a href=' + prevPage + '.htm>Page précédente</a>');
		if (CurrentPageNumber() != LastPageOfReport) {
			nextPage = CurrentPageNumber() + 1;
			if (nextPage < 10) { nextPage = '0' + nextPage; }
			if (nextPage < 100){ nextPage = '0' + nextPage; } 
			
			document.write(' | <a href=' + nextPage + '.htm>Page suivante</a>');
		} else { if (CurrentPageNumber() == LastPageOfReport){
			document.write(' | End of report');}
		}
	}
}

function showFootnote (chapter,name) {
	theURL = 'fn' + chapter + '.htm#' + name;
	window.open(theURL,'references_win','width=350,height=200,scrollbars,resizable'); 
}