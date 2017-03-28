

var newsString = '<%@ taglib uri="http://www.csc.com/e3/bbdotcom/taglib/find1.0" prefix="find" %>' +
'	<input type="hidden" name="findId" value="<find:findid/>">' +
'	<input type="hidden" name="findType" value="1">' +
'	<input type="hidden" name="repository" value="dynamo:/com/csc/e3/bbdotcom/repository/GSADocumentumRepository">' +
'	<input type="hidden" name="itemDescriptor" value="news">' +
'	<input type="hidden" name="maxDocCount" value="100">' +
'	<input type="hidden" name="docsStart" value="1">' +
'	<input type="hidden" name="docsCount" value="10">' +
''+
'	<table border="0" cellpadding="0" cellspacing="0">' +
'	<tr>' +
'		<td align="left" valign="top" width="156" class="formCell" bgcolor="#efefef">' +
'			<select name="year" class="combinedFinder" width="145" style="width:145px">' +
'				<dsp:droplet name="/com/csc/e3/bbdotcom/SqlQuery">' +
'					<dsp:param name="repositoryName" value="/com/csc/e3/bbdotcom/repository/GSADocumentumRepository"/>' +
'					<dsp:param name="itemDescriptor" value="general"/>' +
'					<dsp:param name="sql" value="select max(bb_year) from docattributes_s where r_object_type = \'bb_news\'"/>' +
'					<dsp:param name="element" value="item"/>' +
'					<dsp:oparam name="output">' +
'						<option value="<dsp:valueof param="item"/>" SELECTED>which year?</option>' +
'					</dsp:oparam>' +
'				</dsp:droplet>' +
'				<dsp:droplet name="/com/csc/e3/bbdotcom/SqlQuery">' +
'					<dsp:param name="repositoryName" value="/com/csc/e3/bbdotcom/repository/GSADocumentumRepository"/>' +
'					<dsp:param name="itemDescriptor" value="general"/>' +
'					<dsp:param name="sql" value="select distinct bb_year from docattributes_s where r_object_type = \'bb_news\' order by bb_year desc"/>' +
'					<dsp:param name="element" value="item"/>' +
'					<dsp:oparam name="output">' +
'						<option value="<dsp:valueof param="item"/>"><dsp:valueof param="item"/></option>' +
'					</dsp:oparam>' +
'				</dsp:droplet>' +
'			</select>'+
'		</td>' +
'	</tr>' +
'	<tr>' +
'		<td align="left" valign="top" width="156" class="formCell" bgcolor="#efefef">' +
'			<select name="topic" class="chooseSubject" width="145" style="width:145px">' +
'				<option value="All" SELECTED>what topic?</option>' +
'				<option value="All">All</option>' +
'				<option value="Acquisitions">Acquisitions </option>' +
'				<option value="Alliances">Alliances </option>' +
'				<option value="Appointments">Appointments </option>' +
'				<option value="Closures">Closures </option>' +
'				<option value="Co. Structure">Co. Structure </option>' +
'				<option value="Community">Community </option>' +
'				<option value="Divestments">Divestments </option>' +
'				<option value="Environment">Environment </option>' +
'				<option value="Expansion">Expansion </option>' +
'				<option value="Exploration/Dev">Exploration/Dev </option>' +
'				<option value="Facilities">Facilities </option>' +
'				<option value="Financial Result">Financial Result </option>' +
'				<option value="Governance">Governance </option>' +
'				<option value="Health/Safety">Health/Safety </option>' +
'				<option value="Ind. Relations">Ind. Relations </option>' +
'				<option value="Joint Ventures">Joint Ventures </option>' +
'				<option value="Management/Org">Management/Org </option>' +
'				<option value="Mergers">Mergers </option>' +
'				<option value="Outsourcing">Outsourcing</option>' +
'				<option value="Price Settlement">Price Settlement </option>' +
'				<option value="Production">Production </option>' +
'				<option value="Resignations">Resignations </option>' +
'				<option value="Retirements">Retirements </option>' +
'				<option value="Shared Bus. Serv">Shared Bus. Serv </option>' +
'				<option value="e-business">e-business </option>' +
'			</select>' +
'		</td>' +
'	</tr>' +
'	<tr>' +
'		<td align="left" valign="top" width="156" class="formCell" bgcolor="#efefef">' +
'	       <select name="company" class="combinedFinder" width="145" style="width:145px">' +
'				<%@ include file="/WEB-INF/include/find/combinedFinderCompany.jspf" %>' +
'			</select>'+
'		</td>' +
'	</tr>' +
'	<tr>' +
'		<td align="left" valign="top" width="156" class="formCell" bgcolor="#efefef">' +
'	       <input type="text" name="keyword" class="combinedFinderText" width="145" style="width:145px" value="enter keyword" size="10" onfocus="this.value=\'\';">'+
'		</td>' +
'	</tr>' +
'	<tr>' +
'		<td align="left" class="formCell" bgcolor="#efefef">' +
'			<input type="image" name="find" src="/bb/images/buttons/fbFindItem.gif" width="142" height="16" border="0" vspace="3">'+
'		</td>' +
'	</tr>' +
'	</table>';



var docsString =  '<%@ taglib uri="http://www.csc.com/e3/bbdotcom/taglib/find1.0" prefix="find" %>' +
'	<input type="hidden" name="findId" value="<find:findid/>">' +
'	<input type="hidden" name="findType" value="3">' +
'	<input type="hidden" name="repository" value="dynamo:/com/csc/e3/bbdotcom/repository/GSADocumentumRepository">' +
'	<input type="hidden" name="itemDescriptor" value="general">' +
'	<input type="hidden" name="maxDocCount" value="100">' +
'	<input type="hidden" name="docsStart" value="1">' +
'	<input type="hidden" name="docsCount" value="10">' +
''+
'	<table border="0" cellpadding="0" cellspacing="0">' +
'	<tr>' +
'		<td align="left" valign="top" width="156" class="formCell" bgcolor="#efefef">' +
'	       <select name="topic" class="combinedFinder" width="145" style="width:145px">' +
'				<option value="Presentations/Speeches">Presentation</option> ' +
'				<option value="Financial Reports">Financial Report</option> ' +
'				<option value="Annual Reports">Annual Report</option>' +
'				<option value="Production Reports">Production</option>' +
'				<option value="Exploration and Development Reports">Exploration/Dev</option>' +
'				<option value="Policies">Policy</option>' +
'				<option value="HSEC Report">HSEC Report</option>' +
'				<option value="Business Conduct">Business Conduct</option>' +
'				<option value="Webcast">Webcast</option>' +
'			</select>'+
'		</td>' +
'	</tr>' +
'	<tr>' +
'		<td align="left" valign="top" width="156" class="formCell" bgcolor="#efefef">'+
'			<select name="year" class="combinedFinder" width="145" style="width:145px">' +
'				<dsp:droplet name="/com/csc/e3/bbdotcom/SqlQuery">' +
'					<dsp:param name="repositoryName" value="/com/csc/e3/bbdotcom/repository/GSADocumentumRepository"/>' +
'					<dsp:param name="itemDescriptor" value="general"/>' +
'					<dsp:param name="sql" value="select max(bb_year) from docattributes_s"/>' +
'					<dsp:param name="element" value="item"/>' +
'					<dsp:oparam name="output">' +
'						<option value="<dsp:valueof param="item"/>" SELECTED>which year?</option>' +
'					</dsp:oparam>' +
'				</dsp:droplet>' +
'				<dsp:droplet name="/com/csc/e3/bbdotcom/SqlQuery">' +
'					<dsp:param name="repositoryName" value="/com/csc/e3/bbdotcom/repository/GSADocumentumRepository"/>' +
'					<dsp:param name="itemDescriptor" value="general"/>' +
'					<dsp:param name="sql" value="select distinct bb_year from docattributes_s order by bb_year desc"/>' +
'					<dsp:param name="element" value="item"/>' +
'					<dsp:oparam name="output">' +
'						<option value="<dsp:valueof param="item"/>"><dsp:valueof param="item"/> </option>' +
'					</dsp:oparam>' +
'				</dsp:droplet>' +
'			</select>'+
'		</td>' +
'	</tr>' +
'	<tr>' +
'		<td align="left" valign="top" width="156" class="formCell" bgcolor="#efefef">'+
'			<select name="company" class="combinedFinder" width="145" style="width:145px">' +
'				<%@ include file="/WEB-INF/include/find/combinedFinderCompany.jspf" %>' +
'			</select>'+
'		</td>' +
'	</tr>' +
'	<tr>' +
'		<td align="left" class="formCell" bgcolor="#efefef"><input type="image" name="find" src="/bb/images/buttons/fbFindItem.gif" width="142" height="16" border="0" vspace="3"></td>' +
'	</tr>' +
'	</table>';

function chooseSearch(which) {
	if (which == "news") {
		writeToDiv('combinedFinder', newsString);
		document.images['newsTab'].src = '/bb/images/buttons/fbNewsReleasesOn.gif';
		document.images['docsTab'].src = '/bb/images/buttons/fbDocsDownloadsOff.gif';
	} else if (which == "docs") {
		writeToDiv('combinedFinder', docsString);
		document.images['docsTab'].src = '/bb/images/buttons/fbDocsDownloadsOn.gif';
		document.images['newsTab'].src = '/bb/images/buttons/fbNewsReleasesOff.gif';
	}
}

function writeToDiv(whatDiv, HTMLString) {
	var ns = (navigator.appName=='Netscape');
	var theDiv = (ns) ? document.layers[whatDiv] : document.all[whatDiv];
	if (ns) {
		//alert(document.images['locatorPix'].x);

		var xPos = parseInt(document.images['locatorPix'].x);
		var yPos = parseInt(document.images['locatorPix'].y);
		theDiv.left = xPos+6;
		theDiv.top = yPos+6;
		theDiv.visibility="show";

		//var testString = '<img src="/bb/images/pixel.gif" width="1" height="1">' + '<table border="0" cellpadding="0" cellspacing="0"><tr><td>TRAVO</td></tr></table>' +
		//	'	<form name="test"><input type="text" name="test" size="5"></form>travo is here and has just about got it is there any limit to the amount of text that you can squeeze into a div layery thing?';

		theDiv.document.open();
		theDiv.document.write('<form name="combinedFinder" action="<%=request.getContextPath()%>/findController" method="POST">' + HTMLString + '</form>');
		theDiv.document.close();

/*
		theDiv.document.open();
		theDiv.document.write('<img src="/bb/images/pixel.gif" width="1" height="1">' + '<table border="0" cellpadding="0" cellspacing="0">' +
			'<tr>' +
			'	<td align="left" valign="top" width="156" class="formCell"><select name="year" class="combinedFinder">' +
			'		<option value="0" SELECTED>which year? </option>' +
			'		<option value="2001">2001</option>' +
			'		<option value="2000">2000</option>' +
			'		<option value="1999">1999</option>' +
			'		<option value="1998">1998</option>' +
			'		<option value="1997">1997</option>' +
			'	</select></td>' +
			'</tr>' +
			'<tr>' +
			'	<td align="left" valign="top" width="156" class="formCell"><select name="subject" class="combinedFinderStyle">' +
			'		<option value="0" SELECTED>which subject? </option>' +
			'		<option value="0">-- About Us --</option>' +
			'		<option value="0">Company</option>' +
			'		<option value="0">Executives</option>' +
			'		<option value="0">-- Investors --</option>' +
			'		<option value="0">Management presentations</option>' +
			'		<option value="0">Financial results</option>' +
			'		<option value="0">Shareholders</option>' +
			'		<option value="0">-- Customers --</option>' +
			'		<option value="0">Products</option>' +
			'		<option value="0">Assets</option>' +
			'		<option value="0">Exploration</option>' +
			'		<option value="0">E-Business</option>' +
			'		<option value="0">-- Sustainable Development --</option>' +
			'		<option value="0">Health</option>' +
			'		<option value="0">Safety</option>' +
			'		<option value="0">Environment</option>' +
			'		<option value="0">Community</option>' +
			'		<option value="0">-- People &amp; Employment --</option>' +
			'		<option value="0">Appointments / Retirements</option>' +
			'	</select></td>' +
			'</tr>' +
			'<tr>' +
			'	<td align="left" valign="top" width="156" class="formCell"><select name="entity" class="combinedFinderStyle">' +
			'		<option value="0" SELECTED>BHP Billiton</option>' +
			'		<option>All</option>' +
			'		<option>BHP</option>' +
			'		<option>Billiton</option>' +
			'	</select></td>' +
			'</tr>' +
			'<tr>' +
			'	<td align="left" valign="top" width="156" class="formCell"><input type="text" name="keywords" class="combinedFinderStyle" value="enter keyword" size="15" onfocus="this.value=\'\';"></td>' +
			'</tr>' +
			'<tr>' +
			'	<td align="left" class="formCell"><input type="image" name="find" src="/bb/images/buttons/fbFindItem.gif" width="142" height="16" border="0"></td>' +
			'</tr>' +
			'</table>');
		theDiv.document.close();
*/
		//chk(theDiv);

	} else {
		theDiv.innerHTML = HTMLString;
	}
}

function selectFinder() {
	var whatDiv = 'combinedFinder';
	var ns = (navigator.appName=='Netscape');
	if ((ns) ? document.layers[whatDiv] : document.all[whatDiv]) {
		chooseSearch('news');
	}
}
