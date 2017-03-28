
var version = 0;
browserName = navigator.appName;
browserVer = parseInt(navigator.appVersion);
if (browserName=="Netscape" && browserVer>=4) { version=4; var nsRoll4=true; }
else if (browserName=="Microsoft Internet Explorer" && browserVer >= 4) { version=3.5; }
else if (browserName=="Netscape" && browserVer==3) { version=3; }
else { version=2; }

preloaded = false;

if (version >= 3) {
		
	//preload the button images
	about_off = new Image();
	about_off.src = "/bb/images/navigation/aNavAboutOff.gif";
	about_on = new Image();
	about_on.src = "/bb/images/navigation/aNavAboutOn.gif";

	investor_off = new Image();
	investor_off.src = "/bb/images/navigation/aNavInvestorOff.gif";
	investor_on = new Image();
	investor_on.src = "/bb/images/navigation/aNavInvestorOn.gif";

	news_off = new Image();
	news_off.src = "/bb/images/navigation/aNavNewsOff.gif";
	news_on = new Image();
	news_on.src = "/bb/images/navigation/aNavNewsOn.gif";

	customer_off = new Image();
	customer_off.src = "/bb/images/navigation/aNavCustomerOff.gif";
	customer_on = new Image();
	customer_on.src = "/bb/images/navigation/aNavCustomerOn.gif";

	research_off = new Image();
	research_off.src = "/bb/images/navigation/aNavResearchOff.gif";
	research_on = new Image();
	research_on.src = "/bb/images/navigation/aNavResearchOn.gif";

	sustainable_off = new Image();
	sustainable_off.src = "/bb/images/navigation/aNavSustainableOff.gif";
	sustainable_on = new Image();
	sustainable_on.src = "/bb/images/navigation/aNavSustainableOn.gif";

	people_off = new Image();
	people_off.src = "/bb/images/navigation/aNavPeopleOff.gif";
	people_on = new Image();
	people_on.src = "/bb/images/navigation/aNavPeopleOn.gif";

	company_off = new Image();
	company_off.src = "/bb/images/navigation/aNavCompanyOff.gif";
	company_on = new Image();
	company_on.src = "/bb/images/navigation/aNavCompanyOn.gif";

	products_off = new Image();
	products_off.src = "/bb/images/navigation/aNavProductsOff.gif";
	products_on = new Image();
	products_on.src = "/bb/images/navigation/aNavProductsOn.gif";

	minerals_off = new Image();
	minerals_off.src = "/bb/images/navigation/aNavMineralsOff.gif";
	minerals_on = new Image();
	minerals_on.src = "/bb/images/navigation/aNavMineralsOn.gif";

	environment_off = new Image();
	environment_off.src = "/bb/images/navigation/aNavEnvironmentOff.gif";
	environment_on = new Image();
	environment_on.src = "/bb/images/navigation/aNavEnvironmentOn.gif";

	community_off = new Image();
	community_off.src = "/bb/images/navigation/aNavCommunityOff.gif";
	community_on = new Image();
	community_on.src = "/bb/images/navigation/aNavCommunityOn.gif";

	gradRecruitment_off = new Image();
	gradRecruitment_off.src = "/bb/images/navigation/aNavGradRecruitmentOff.gif";
	gradRecruitment_on = new Image();
	gradRecruitment_on.src = "/bb/images/navigation/aNavGradRecruitmentOn.gif";
	
	preloaded = true;
}

function mouseOn(name) { 
	if (preloaded) { 
		if (nsRoll4 && (name == 'minerals' || name == 'products' || name == 'company' || name == 'environment' || name == 'community' || name == 'gradRecruitment')) {

		} else {
			document.images[name].src = eval(name + "_on.src"); 
		}
	} 
}

function mouseOff(name) { 
	if (preloaded) { 
		if (nsRoll4 && (name == 'minerals' || name == 'products' || name == 'company' || name == 'environment' || name == 'community' || name == 'gradRecruitment')) {

		} else {
			document.images[name].src = eval(name + "_off.src"); 
		}
	}
}

function switchOn() {
	var locString = document.location.href;
	if (locString.indexOf('aboutUs') > 0) {
		about_off.src = about_on.src;
		mouseOn('about');	
	} else if (locString.indexOf('investorCentre') > 0) {
		investor_off.src = investor_on.src;
		mouseOn('investor');	
	} else if (locString.indexOf('newsCentre') > 0) {
		news_off.src = news_on.src;
		mouseOn('news');	
	} else if (locString.indexOf('customerCentre') > 0) {
		customer_off.src = customer_on.src;
		mouseOn('customer');	
	} else if (locString.indexOf('sustainableDevelopment') > 0) {
		sustainable_off.src = sustainable_on.src;
		mouseOn('sustainable');	
	} else if (locString.indexOf('peopleEmployment') > 0) {
		people_off.src = people_on.src;
		mouseOn('people');	
	} else if (locString.indexOf('researchCentre') > 0) {
		research_off.src = research_on.src;
		mouseOn('research');	
	}
}
