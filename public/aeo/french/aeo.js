//Check if window is in a frame or not	
// if (window == top) 
// {	
	// var url = location.href.replace('www.','');
	// url = location.href.replace('http://grida.no','');
	// setTimeout('top.location.replace("/publications/other/aeo?src=" + url)', 100);
// }

// Enter here the last page number of this report
var LastPageOfReport = 340;

//Check browser
//MAC = (navigator.appVersion.indexOf("Mac") != -1);
//var NS4 = (document.layers)	? true:false;
//var iexplorer = (document.all)	? true:false;
//var ie4	= (navigator.appVersion.indexOf('MSIE 4') != -1) ? true : false;

//if (MAC) { 
//	document.write ('<link rel="stylesheet" href="aeo_mac.css">');
//} else {
//	document.write ('<link rel="stylesheet" href="aeo_pc.css">');
//}


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
	document.write ('<select name="ChapterJumpMenu" class="textField" onChange="MM_jumpMenu(\'this\',this,1)">');
	document.write ('<option value="index.htm">Table des matiéres</option>');
	// Set the values in the call to ChapterSelected as the first and last web page numbers of the chapter.
	// Set the option value to the first web page of the chapter.
	document.write ('<option' + ChapterSelected(1,1) + ' value="001.htm">Centres collaborants</option>');
	document.write ('<option' + ChapterSelected(2,2) + ' value="002.htm">Remerciements</option>');
	document.write ('<option' + ChapterSelected(3,3) + ' value="003.htm">Avant-propos</option>');
	document.write ('<option' + ChapterSelected(4,4) + ' value="004.htm">Pr&eacute;face</option>');
	document.write ('<option' + ChapterSelected(5,5) + ' value="005.htm">Le Projet AEO</option>');
	document.write ('<option' + ChapterSelected(6,8) + ' value="006.htm">Synth&egrave;se</option>');
	document.write ('<option' + ChapterSelected(9,9) + ' value="009.htm">Les sous-region de l&#39;AEO</option>');
	
	document.write ('<option' + ChapterSelected(10,10) + ' value="010.htm">---------------------------------------------------------------------</option>');
	document.write ('<option' + ChapterSelected(10,10) + ' value="010.htm">CHAPITRE 1: ENVIRONNEMENT ET DEVELOPPEMENT ...</option>');
	document.write ('<option' + ChapterSelected(10,10) + ' value="010.htm">---------------------------------------------------------------------</option>');
	document.write ('<option' + ChapterSelected(10,11) + ' value="010.htm">Introduction</option>');
	document.write ('<option' + ChapterSelected(12,13) + ' value="012.htm">Les années 1970 : le vent ...</option>');
	document.write ('<option' + ChapterSelected(14,18) + ' value="014.htm">Les années 1980 : la stagnation</option>');
	document.write ('<option' + ChapterSelected(19,28) + ' value="019.htm">Des années 1990 à 2002 : un ...</option>');
	document.write ('<option' + ChapterSelected(29,30) + ' value="029.htm">Conclusion</option>');

	document.write ('<option' + ChapterSelected(31,31) + ' value="010.htm">---------------------------------------------------------------------</option>');
	document.write ('<option' + ChapterSelected(31,31) + ' value="031.htm">CHAPITRE 2: ETAT DE L’ENVIRONNEMENT EN AFRIQUE ...</option>');
	document.write ('<option' + ChapterSelected(31,31) + ' value="010.htm">---------------------------------------------------------------------</option>');
	document.write ('<option' + ChapterSelected(31,31) + ' value="031.htm">Introduction</option>');
	document.write ('<option' + ChapterSelected(32,32) + ' value="032.htm">~[Partie A]: Atmosphère</option>');
	document.write ('<option' + ChapterSelected(32,37) + ' value="032.htm">Présentation régionale</option>');
	document.write ('<option' + ChapterSelected(38,42) + ' value="038.htm">Afrique du Nord</option>');
	document.write ('<option' + ChapterSelected(43,46) + ' value="043.htm">Afrique orientale</option>');
	document.write ('<option' + ChapterSelected(47,49) + ' value="047.htm">Iles de l’ouest de l’océan Indien</option>');
	document.write ('<option' + ChapterSelected(50,52) + ' value="050.htm">Afrique australe</option>');
	document.write ('<option' + ChapterSelected(53,55) + ' value="053.htm">Afrique centrale</option>');
	document.write ('<option' + ChapterSelected(56,58) + ' value="056.htm">Afrique occidentale</option>');
	document.write ('<option' + ChapterSelected(59,60) + ' value="059.htm">Conclusion</option>');

	document.write ('<option' + ChapterSelected(61,61) + ' value="061.htm">~[Partie B]: Biodiversité</option>');
	document.write ('<option' + ChapterSelected(61,68) + ' value="061.htm">Présentation régionale</option>');
	document.write ('<option' + ChapterSelected(69,71) + ' value="069.htm">Afrique du Nord</option>');
	document.write ('<option' + ChapterSelected(72,76) + ' value="072.htm">Afrique orientale</option>');
	document.write ('<option' + ChapterSelected(77,79) + ' value="077.htm">Iles de l’ouest de l’océan Indien</option>');
	document.write ('<option' + ChapterSelected(80,83) + ' value="080.htm">Afrique australe</option>');
	document.write ('<option' + ChapterSelected(84,86) + ' value="084.htm">Afrique centrale</option>');
	document.write ('<option' + ChapterSelected(87,91) + ' value="087.htm">Afrique occidentale</option>');
	document.write ('<option' + ChapterSelected(92,93) + ' value="092.htm">Conclusion</option>');

	document.write ('<option' + ChapterSelected(94,94) + ' value="094.htm">~[Partie C]: Coastal and Marine ...</option>');
	document.write ('<option' + ChapterSelected(94,99) + ' value="094.htm">Présentation régionale</option>');
	document.write ('<option' + ChapterSelected(100,104) + ' value="100.htm">Afrique du Nord</option>');
	document.write ('<option' + ChapterSelected(105,108) + ' value="105.htm">Afrique orientale</option>');
	document.write ('<option' + ChapterSelected(109,112) + ' value="109.htm">Iles de l’ouest de l’océan Indien</option>');
	document.write ('<option' + ChapterSelected(113,116) + ' value="113.htm">Afrique australe</option>');
	document.write ('<option' + ChapterSelected(117,119) + ' value="117.htm">Afrique centrale</option>');
	document.write ('<option' + ChapterSelected(120,123) + ' value="120.htm">Afrique occidentale</option>');
	document.write ('<option' + ChapterSelected(124,125) + ' value="124.htm">Conclusion</option>');

	document.write ('<option' + ChapterSelected(126,126) + ' value="126.htm">~[Partie D]: Forests</option>');
	document.write ('<option' + ChapterSelected(126,130) + ' value="126.htm">Présentation régionale</option>');
	document.write ('<option' + ChapterSelected(131,132) + ' value="131.htm">Afrique du Nord</option>');
	document.write ('<option' + ChapterSelected(133,135) + ' value="133.htm">Afrique orientale</option>');
	document.write ('<option' + ChapterSelected(136,137) + ' value="136.htm">Iles de l’ouest de l’océan Indien</option>');
	document.write ('<option' + ChapterSelected(138,139) + ' value="138.htm">Afrique australe</option>');
	document.write ('<option' + ChapterSelected(140,142) + ' value="140.htm">Afrique centrale</option>');
	document.write ('<option' + ChapterSelected(143,145) + ' value="143.htm">Afrique occidentale</option>');
	document.write ('<option' + ChapterSelected(146,147) + ' value="146.htm">Conclusion</option>');

	document.write ('<option' + ChapterSelected(148,148) + ' value="148.htm">~[Partie E]: Freshwater</option>');
	document.write ('<option' + ChapterSelected(148,152) + ' value="148.htm">Présentation régionale</option>');
	document.write ('<option' + ChapterSelected(153,155) + ' value="153.htm">Afrique du Nord</option>');
	document.write ('<option' + ChapterSelected(156,158) + ' value="156.htm">Afrique orientale</option>');
	document.write ('<option' + ChapterSelected(159,160) + ' value="159.htm">Iles de l’ouest de l’océan Indien</option>');
	document.write ('<option' + ChapterSelected(161,163) + ' value="161.htm">Afrique australe</option>');
	document.write ('<option' + ChapterSelected(164,165) + ' value="164.htm">Afrique centrale</option>');
	document.write ('<option' + ChapterSelected(166,168) + ' value="166.htm">Afrique occidentale</option>');
	document.write ('<option' + ChapterSelected(169,170) + ' value="169.htm">Conclusion</option>');

	document.write ('<option' + ChapterSelected(171,171) + ' value="171.htm">~[Partie F]: Land</option>');
	document.write ('<option' + ChapterSelected(171,176) + ' value="171.htm">Présentation régionale</option>');
	document.write ('<option' + ChapterSelected(177,180) + ' value="177.htm">Afrique du Nord</option>');
	document.write ('<option' + ChapterSelected(181,185) + ' value="181.htm">Afrique orientale</option>');
	document.write ('<option' + ChapterSelected(186,188) + ' value="186.htm">Iles de l’ouest de l’océan Indien</option>');
	document.write ('<option' + ChapterSelected(189,192) + ' value="189.htm">Afrique australe</option>');
	document.write ('<option' + ChapterSelected(193,196) + ' value="193.htm">Afrique centrale</option>');
	document.write ('<option' + ChapterSelected(197,200) + ' value="197.htm">Afrique occidentale</option>');
	document.write ('<option' + ChapterSelected(201,202) + ' value="201.htm">Conclusion</option>');

	document.write ('<option' + ChapterSelected(203,203) + ' value="203.htm">~[Partie G]: Urban Areas</option>');
	document.write ('<option' + ChapterSelected(203,206) + ' value="203.htm">Présentation régionale</option>');
	document.write ('<option' + ChapterSelected(207,208) + ' value="207.htm">Afrique du Nord</option>');
	document.write ('<option' + ChapterSelected(209,210) + ' value="209.htm">Afrique orientale</option>');
	document.write ('<option' + ChapterSelected(211,212) + ' value="211.htm">Iles de l’ouest de l’océan Indien</option>');
	document.write ('<option' + ChapterSelected(213,215) + ' value="213.htm">Afrique australe</option>');
	document.write ('<option' + ChapterSelected(216,217) + ' value="216.htm">Afrique centrale</option>');
	document.write ('<option' + ChapterSelected(218,219) + ' value="218.htm">Afrique occidentale</option>');
	document.write ('<option' + ChapterSelected(220,221) + ' value="220.htm">Conclusion</option>');

	document.write ('<option' + ChapterSelected(222,222) + ' value="222.htm">Récapitulatif</option>');
	document.write ('<option' + ChapterSelected(222,222) + ' value="222.htm">Atmosphère</option>');
	document.write ('<option' + ChapterSelected(223,223) + ' value="223.htm">Biodiversité</option>');
	document.write ('<option' + ChapterSelected(224,224) + ' value="224.htm">Environnements côtiers et marins</option>');
	document.write ('<option' + ChapterSelected(225,225) + ' value="225.htm">Forêts</option>');
	document.write ('<option' + ChapterSelected(226,226) + ' value="226.htm">Eau douce</option>');
	document.write ('<option' + ChapterSelected(227,227) + ' value="227.htm">Terre</option>');
	document.write ('<option' + ChapterSelected(228,228) + ' value="228.htm">Zones urbaines</option>');
	document.write ('<option' + ChapterSelected(229,233) + ' value="229.htm">Etude des rapports complexes existant ...</option>');
	
	document.write ('<option' + ChapterSelected(234,234) + ' value="010.htm">---------------------------------------------------------------------</option>');
	document.write ('<option' + ChapterSelected(234,234) + ' value="234.htm">CHAPITRE 3: VULNERABILITE HUMAINE AUX ...</option>');
	document.write ('<option' + ChapterSelected(234,234) + ' value="010.htm">---------------------------------------------------------------------</option>');
	document.write ('<option' + ChapterSelected(234,234) + ' value="234.htm">Introduction</option>');
	document.write ('<option' + ChapterSelected(235,235) + ' value="235.htm">Comprendre la vulnérabilité humaine</option>');
	document.write ('<option' + ChapterSelected(236,241) + ' value="236.htm">Changements environnementaux : impacts ...</option>');
	document.write ('<option' + ChapterSelected(242,246) + ' value="242.htm">Dimensions sociales de la vulnérabilité ...</option>');
	document.write ('<option' + ChapterSelected(247,251) + ' value="247.htm">Dimensions économiques de la vulnérabilité ...</option>');
	document.write ('<option' + ChapterSelected(252,257) + ' value="252.htm">Lutter contre la vulnérabilité humaine aux ...</option>');
	document.write ('<option' + ChapterSelected(258,258) + ' value="258.htm">Obstacles à la réduction de la vulnérabilité ...</option>');
	document.write ('<option' + ChapterSelected(259,260) + ' value="259.htm">Conclusion</option>');

	document.write ('<option' + ChapterSelected(261,261) + ' value="010.htm">---------------------------------------------------------------------</option>');
	document.write ('<option' + ChapterSelected(261,261) + ' value="261.htm">CHAPITRE 4: PERSPECTIVE 2002&#8211;2032</option>');
	document.write ('<option' + ChapterSelected(261,261) + ' value="010.htm">---------------------------------------------------------------------</option>');
	document.write ('<option' + ChapterSelected(261,262) + ' value="261.htm">Visualiser l’avenir</option>');
	document.write ('<option' + ChapterSelected(263,263) + ' value="263.htm">Méthodologie : l’approche par scénarios</option>');
	document.write ('<option' + ChapterSelected(264,264) + ' value="264.htm">Avenirs régionaux de l’Afrique : élaboration de ...</option>');
	document.write ('<option' + ChapterSelected(265,265) + ' value="265.htm">Expressions quantitatives des scénarios</option>');
	document.write ('<option' + ChapterSelected(266,272) + ' value="266.htm">Forces agissantes des scénarios</option>');
	document.write ('<option' + ChapterSelected(273,315) + ' value="273.htm">Les scénarios et leurs implications environnementales</option>');
	document.write ('<option' + ChapterSelected(316,318) + ' value="316.htm">Discussions et synthèse</option>');
	document.write ('<option' + ChapterSelected(319,320) + ' value="319.htm">Conclusion</option>');

	document.write ('<option' + ChapterSelected(321,321) + ' value="010.htm">---------------------------------------------------------------------</option>');
	document.write ('<option' + ChapterSelected(321,321) + ' value="321.htm">CHAPITRE 5: INTERVENTIONS DES POUVOIRS ...</option>');
	document.write ('<option' + ChapterSelected(321,321) + ' value="010.htm">---------------------------------------------------------------------</option>');
	document.write ('<option' + ChapterSelected(321,321) + ' value="321.htm">Introduction</option>');
	document.write ('<option' + ChapterSelected(322,327) + ' value="322.htm">Intervention des pouvoirs publiques et analyse</option>');
	document.write ('<option' + ChapterSelected(328,330) + ' value="328.htm">Proposition d&#39;action</option>');
	document.write ('<option' + ChapterSelected(331,332) + ' value="331.htm">Conclusion</option>');
	document.write ('<option' + ChapterSelected(333,333) + ' value="333.htm">Annexe 1:des principales interventions ...</option>');
	document.write ('<option' + ChapterSelected(334,334) + ' value="334.htm">Annexe 2: Exemples sélectionnés d’échecs, ...</option>');
	document.write ('<option' + ChapterSelected(335,337) + ' value="335.htm">Annexe 3: Proposition de domaines d’action, ...</option>');

	document.write ('<option' + ChapterSelected(338,338) + ' value="338.htm">Acronymes et abréviations</option>');
	document.write ('<option' + ChapterSelected(339,339) + ' value="339.htm">Collaborateurs</option>');
	document.write ('<option' + ChapterSelected(340,340) + ' value="340.htm">Figures et tableaux</option>');

	document.write ('</select> ');
	document.write ('<input type="button" name="Button1" value="Go" class="button" onClick="MM_jumpMenuGo(\'ChapterJumpMenu\',\'this\',1)">');
}

function PrevNext() {
	var prevPage, nextPage;

	if (isNaN(CurrentPageNumber())) { 
		document.write('Table des matiéres | <a href="001.htm">Page suivante</a>');
	} else {
		if (CurrentPageNumber() == 1) { 
			prevPage='index'; 
		} else { 
			prevPage=CurrentPageNumber() - 1; 
		}
		if (prevPage < 10) { prevPage = '0' + prevPage; }
		if (prevPage < 100) { prevPage = '0' + prevPage; }		
		document.write('<a href="index.htm">Table des matiéres</a> | <a href=' + prevPage + '.htm>Page précédente</a>');
		if (CurrentPageNumber() != LastPageOfReport) {
			nextPage = CurrentPageNumber() + 1;
			if (nextPage < 10) { nextPage = '0' + nextPage; }
			if (nextPage < 100){ nextPage = '0' + nextPage; } 
			
			document.write(' | <a href=' + nextPage + '.htm>Page suivante</a>');
		} else { if (CurrentPageNumber() == LastPageOfReport){
			document.write(' | Fin de rapport');}
		}
	}
}

function showFootnote (chapter,name) {
	theURL = 'fn' + chapter + '.htm#' + name;
	window.open(theURL,'references_win','width=350,height=200,scrollbars,resizable'); 
}