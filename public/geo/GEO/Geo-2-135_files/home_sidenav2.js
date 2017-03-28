var back_image = "/img/003366.gif";  // background image for site (color behind left navbar...)
var top_px = "95"; //number of pixels from top of window left nav begins
var left_px = "5"; //number of pixels from left side of window left nav begins
var mouse_over_color = "#cccc66"; //Color for left nav links to turn during mouseover (text or hex)


// For the following section, leave blank if you do not know
var entity_name = ""; // Name of entity
var entity_street = ""; // Entity address
var entity_street2 =""; // Entity address 2nd line
var entity_city = ""; // Entity city
var entity_state = ""; // Entity state
var entity_zip = ""; // Entity zip code
var entity_phone = ""; // Entity phone number
var entity_fax = ""; // Entity fax number
var entity_email = ""; // entity email address


//  Don't touch these 2 lines
var menublock=new Array() // no need to change this
var plus_i=0 // no need to change this

menublock[0]="Arial,Helvetica,sans-serif;"+ 			// font mainlink
			 "2;"+				// fontsize mainlink
			 "#FFFFFF;"+			// fontcolor mainlink
			 "1;"+				// fontweight mainlink, 1 means bold, 0 means normal
			 "Arial,Helvetica,sans-serif;"+ 		// font sublinks
			 "2;"+				// fontsize sublinks
			 "#FFFFFF;"+			// fontcolor sublinks
			 "0;"+				// fontweight sublinks, 1 means bold, 0 means normal
			 "Join|#|;"+ 				        // text|URL|target of mainlink
			 "General|/members/join/membership.html|;"+		// text|URL|target of first sublink
			 "Associate|/members/join/associateappn.html|;"+		// text|URL|target of second sublink
			 "Law Student|/members/join/lsdappn.html|;" +		// text|URL|target of third sublink
			 "Join a Section|https://www.abanet.org/members/join/currentmembers.html|;"+		// text|URL|target of second sublink  
			 "Change of Address|http://www.abanet.org/members/join/coa.html|;"	// text|URL|target of fourth sublink

menublock[1]="Arial,Helvetica,sans-serif;"+ 			// font mainlink
			 "2;"+				// fontsize mainlink
			 "#FFFFFF;"+			// fontcolor mainlink
			 "1;"+				// fontweight mainlink, 1 means bold, 0 means normal
			 "Arial,Helvetica,sans-serif;"+ 		// font sublinks
			 "2;"+				// fontsize sublinks
			 "#FFFFFF;"+			// fontcolor sublinks
			 "0;"+				// fontweight sublinks, 1 means bold, 0 means normal
			 "Member Benefits|#|;"+ 				        // text|URL|target of mainlink
			 "Home|/members/home.html|;"+		// text|URL|target of first sublink
			 "ABASource|/abasource/guide.html|;"+		// text|URL|target of second sublink
			 "Member Advantage|/advantage/home.html|;" +		// text|URL|target of third sublink
			 "Airfare Discounts|/mtd/airline.pdf|;"+		// text|URL|target of second sublink  
			 "Customer Services|/members/customer.html|;"+		// text|URL|target of fourth sublink
			 "FAQs|/members/faqs.html|;" + 		// text|URL|target of fifth sublink	
			 "Career Counsel|/careercounsel/home.html|;"	+	// text|URL|target of sixth sublink
			 "Non Lawyers & International Lawyers|/members/associates.html|;"		// text|URL|target of seventh sublink

menublock[2]="Arial,Helvetica,sans-serif;"+ 			// font mainlink
			 "2;"+				// fontsize mainlink
			 "#FFFFFF;"+			// fontcolor mainlink
			 "1;"+				// fontweight mainlink, 1 means bold, 0 means normal
			 "Arial,Helvetica,sans-serif;"+ 		// font sublinks
			 "2;"+				// fontsize sublinks
			 "#FFFFFF;"+			// fontcolor sublinks
			 "0;"+				// fontweight sublinks, 1 means bold, 0 means normal
			 "Legal & Professional Resources|#|;"+ 				        // text|URL|target of mainlink
			 "Home|/legresource/home.html|;"+		
// text|URL|target of first sublink
			 "List Serves|/discussions/|;"+		
// text|URL|target of second sublink
			 "Discussion Forums|http://discussion.abanet.org:8080/~aba|;" +		// text|URL|target of third sublink
 			 "Online Redbook|/redbook/|;"+		
// text|URL|target of fourth sublink
			 "Legal Technology Resource Center|/tech/ltrc/home.html|;" + 		// text|URL|target of fifth sublink
			 "Futures Committee|/lawfutures/home.html|;" +
// text|URL|target of sixth sublink
			 "Minority Lawyers|/legresource/minority.html|;" +	
// text|URL|target of seventh sublink
			 "Women Lawyers|/legresource/women.html|;" +		
// text|URL|target of eighth sublink
			 "Ethics Resources|/legresource/ethics.html|;" +			 
			 "Division for Legal Services|/legalservices/home.html|;"

menublock[3]="Arial,Helvetica,sans-serif;"+ 			// font mainlink
			 "2;"+				// fontsize mainlink
			 "#FFFFFF;"+			// fontcolor mainlink
			 "1;"+				// fontweight mainlink, 1 means bold, 0 means normal
			 "Arial,Helvetica,sans-serif;"+ 		// font sublinks
			 "2;"+				// fontsize sublinks
			 "#FFFFFF;"+			// fontcolor sublinks
			 "0;"+				// fontweight sublinks, 1 means bold, 0 means normal
			 "Member Entities|#|;"+ 				        // text|URL|target of mainlink
			 "Home|/entity.html|;"+		// text|URL|target of first sublink
			 "Sections|/sections.html|;"+		// text|URL|target of second sublink
			 "Divisions|/divisions.html|;" +		// text|URL|target of third sublink	 
			 "Forums|/forums.html|;"+		// text|URL|target of fourth sublink
			 "SOC|/soc/home.html|;"+		// text|URL|target of fifth sublink
			 "Commissions|/commissions.html|;" + 		// text|URL|target of sixth sublink	
			 "Committees|/committees.html|;"	 +	// text|URL|target of seventh sublink
			 "Centers|/centers.html|;" 		// text|URL|target of eighth sublink
			 
menublock[4]="Arial,Helvetica,sans-serif;"+ 			// font mainlink
			 "2;"+				// fontsize mainlink
			 "#FFFFFF;"+			// fontcolor mainlink
			 "1;"+				// fontweight mainlink, 1 means bold, 0 means normal
			 "Arial,Helvetica,sans-serif;"+ 		// font sublinks
			 "2;"+				// fontsize sublinks
			 "#FFFFFF;"+			// fontcolor sublinks
			 "0;"+				// fontweight sublinks, 1 means bold, 0 means normal
			 "Charities|#|;"+ 				       	// text|URL|target of mainlink
			 "Home|/charities.html|;"+ 				       	// text|URL|target of mainlink
			 "American Bar Endowment|http://www.abendowment.org|new;"+ 				       	// text|URL|target of mainlink
			 "Fund for Justice and Education|/fje/home.html|;"+ 				       	// text|URL|target of mainlink
			 "American Bar Foundation|http://www.abf-sociolegal.org;" 				       		// text|URL|target of mainlink

menublock[5]="Arial,Helvetica,sans-serif;"+ 			// font mainlink
			 "2;"+				// fontsize mainlink
			 "#FFFFFF;"+			// fontcolor mainlink
			 "1;"+				// fontweight mainlink, 1 means bold, 0 means normal
			 "Arial,Helvetica,sans-serif;"+ 		// font sublinks
			 "2;"+				// fontsize sublinks
			 "#FFFFFF;"+			// fontcolor sublinks
			 "0;"+				// fontweight sublinks, 1 means bold, 0 means normal
			 "Diversity Initiatives|#|;"+ 				       	// text|URL|target of mainlink
			 "President's Advisory Council on Diversity|/leadership/diversity.html|;"+
			 "Council on Racial & Ethnic Justice|/r&ejustice/home.html|;"+ 				       	// text|URL|target of mainlink
			 "Commission on Mental and Physical Disability Law|/disability|;"+ 				       	// text|URL|target of mainlink
			 "Commission on Racial and Ethnic Diversity in the Profession|/minorities|;"+ 				       	// text|URL|target of mainlink
			 "Commission on Women|/women|;" 				       	// text|URL|target of mainlink


menublock[6]="Arial,Helvetica,sans-serif;"+ 			// font mainlink
			 "2;"+				// fontsize mainlink
			 "#FFFFFF;"+			// fontcolor mainlink
			 "1;"+				// fontweight mainlink, 1 means bold, 0 means normal
			 "Arial,Helvetica,sans-serif;"+ 		// font sublinks
			 "2;"+				// fontsize sublinks
			 "#FFFFFF;"+			// fontcolor sublinks
			 "0;"+				// fontweight sublinks, 1 means bold, 0 means normal
			 "Legislative & Governmental Advocacy|#|;"+ 				        // text|URL|target of mainlink
			 "Home|/poladv/home.html|;"+		// text|URL|target of first sublink
			 "What's New in Washington|/poladv/new.html|;"+		// text|URL|target of second sublink
			 "Legislative and Governmental Priorities|/poladv/priorities.html|;" +		// text|URL|target of third sublink	 
			 "Grassroots Legislative Action Center|http://congress.nw.dc.us/bar|;"+		// text|URL|target of fourth sublink
			 "Letters and Testimony|/poladv/letters.html|;" + 		// text|URL|target of fifth sublink	
			 "Governmental Affairs Office|/poladv/about.html|;"	 +	// text|URL|target of sixth sublink
			 "State Legislative Clearinghouse|/poladv/state.html|;" +		// text|URL|target of seventh sublink  
			 "GAO Publications|/poladv/pubs.html|;" 		// text|URL|target of eighth sublink         			 


			 
			 
menublock[7]="Arial,Helvetica,sans-serif;"+ 			// font mainlink
			 "2;"+				// fontsize mainlink
			 "#FFFFFF;"+			// fontcolor mainlink
			 "1;"+				// fontweight mainlink, 1 means bold, 0 means normal
			 "Arial,Helvetica,sans-serif;"+ 		// font sublinks
			 "2;"+				// fontsize sublinks
			 "#FFFFFF;"+			// fontcolor sublinks
			 "0;"+				// fontweight sublinks, 1 means bold, 0 means normal
			 "Law Student Resources|#|;"+ 				        // text|URL|target of mainlink
			 "Law Student Division|/lsd/home.html|;"+		// text|URL|target of first sublink
			 "LSD Programs|/lsd/programs.html|;" +		// text|URL|target of second sublink
			 "Legal Education|/legaled/home.html|;"		// text|URL|target of third sublink			 

menublock[8]="Arial,Helvetica,sans-serif;"+ 			// font mainlink
			 "2;"+				// fontsize mainlink
			 "#FFFFFF;"+			// fontcolor mainlink
			 "1;"+				// fontweight mainlink, 1 means bold, 0 means normal
			 "Arial,Helvetica,sans-serif;"+ 		// font sublinks
			 "2;"+				// fontsize sublinks
			 "#FFFFFF;"+			// fontcolor sublinks
			 "0;"+				// fontweight sublinks, 1 means bold, 0 means normal
			 "General Public Resources|#|;"+ 				        // text|URL|target of mainlink
			 "General Info.|/pubresource/home.html|;"+		// text|URL|target of first sublink
			 "Public Education|/publiced/home.html|;"+		// text|URL|target of second sublink
			 "Find Legal Help|/legalservices/public.html|;"+		// text|URL|target of third sublink	 
			 "Prepaid Legal Services|/api/pls.html|;"+		// text|URL|target of fourth sublink
			 "Lawyer Referral Services|/referral/home.html|;"+ 		// text|URL|target of fifth sublink	
			 "Pro Bono Programs|/legalservices/probono/home.html|;"+		// text|URL|target of sixth sublink
			 "Legal Directory|premartindale.html|;"+		// text|URL|target of seventh sublink
			 "Safe Shopping|http://www.safeshopping.org/|;"+		// text|URL|target of eighth sublink
			 "ABA LawInfo.org|/lawinfo/home.html|;"		// text|URL|target of ninth sublink
			 

			 
			 
menublock[9]="Arial,Helvetica,sans-serif;"+ 			// font mainlink
			 "2;"+				// fontsize mainlink
			 "#FFFFFF;"+			// fontcolor mainlink
			 "1;"+				// fontweight mainlink, 1 means bold, 0 means normal
			 "Arial,Helvetica,sans-serif;"+ 		// font sublinks
			 "2;"+				// fontsize sublinks
			 "#FFFFFF;"+			// fontcolor sublinks
			 "0;"+				// fontweight sublinks, 1 means bold, 0 means normal
			 "Press Room|#|;"+ 				        // text|URL|target of mainlink
			 "Home|/media/home.html|;"+		// text|URL|target of first sublink 
			 "News Releases|/media/news.html|;"+		// text|URL|target of second sublink	
             "Fact Books|/media/factbooks/home.html|;"+
                         "Issues by Topic|/media/reportresources.html|;"+
			"News in Brief|/media/newslett.html|;"+
			"Opinion Editorials|/media/opeds.html|;"+
			"Reporters Key|/media/nclm/|;"+
			"Silver Gavel Awards|/publiced/gavel/home.html|;"+		// text|URL|target of first sublink
           "Statements|/media/statements.html|;"+
		   "Supreme Court Preview|/publiced/preview/home.html|;"+		// text|URL|target of first sublink 		 
			"Video Releases|/media/lnn/home.html|;"

menublock[10]="Arial,Helvetica,sans-serif;"+ 			// font mainlink
			 "2;"+				// fontsize mainlink
			 "#FFFFFF;"+			// fontcolor mainlink
			 "1;"+				// fontweight mainlink, 1 means bold, 0 means normal
			 "Arial,Helvetica,sans-serif;"+ 		// font sublinks
			 "2;"+				// fontsize sublinks
			 "#FFFFFF;"+			// fontcolor sublinks
			 "0;"+				// fontweight sublinks, 1 means bold, 0 means normal
			 "Publications|#|;"+ 				        // text|URL|target of mainlink
			 "Home|/store/home.html|;"+		// text|URL|target of first sublink
			 "ABA Publications|/abapubs/home.html|;"+		// text|URL|target of second sublink
			 "CLE Materials|/cle/catalog/home.html|;" +		// text|URL|target of third sublink	 
			 "Law Day|/publiced/lawday/home.html|;"+		// text|URL|target of fourth sublink
			 "Ethics|/cpr/publications.html|;" + 		// text|URL|target of fifth sublink	
			 "Public Education|/publiced/catalog.html|;"		// text|URL|target of sixth sublink

			 
			 
menublock[11]="Arial,Helvetica,sans-serif;"+ 			// font mainlink
			 "2;"+				// fontsize mainlink
			 "#FFFFFF;"+			// fontcolor mainlink
			 "1;"+				// fontweight mainlink, 1 means bold, 0 means normal
			 "Arial,Helvetica,sans-serif;"+ 		// font sublinks
			 "2;"+				// fontsize sublinks
			 "#FFFFFF;"+			// fontcolor sublinks
			 "0;"+				// fontweight sublinks, 1 means bold, 0 means normal
			 "International|#|;"+ 				        // text|URL|target of mainlink
			 "Home|/intnat/home.html|;"+		// text|URL|target of first sublink
			 "Volunteer Opportunities|/legresource/volunteer.html|;"+	// text|URL|target of second sublink
			 "Section of International Law and Practice|/intlaw/home.html|;"+	// text|URL|target of third sublink
			 "Central and East European	Law Initiative |/ceeli/home.html|;"				 


menublock[12]="Arial,Helvetica,sans-serif;"+ 			// font mainlink
			 "2;"+				// fontsize mainlink
			 "#FFFFFF;"+			// fontcolor mainlink
			 "1;"+				// fontweight mainlink, 1 means bold, 0 means normal
			 "Arial,Helvetica,sans-serif;"+ 		// font sublinks
			 "2;"+				// fontsize sublinks
			 "#FFFFFF;"+			// fontcolor sublinks
			 "0;"+				// fontweight sublinks, 1 means bold, 0 means normal
			 "FAQs|#|;"+ 				        // text|URL|target of mainlink
			 "Home|/members/faqs.html|;"+		// text|URL|target of first sublink
			 "About the ABA|/about/home.html|;"+		// text|URL|target of second sublink
			 "ABA Membership Section Guide|/sectionguide/|;" +		// text|URL|target of third sublink	 
			 "Sections, Divisions, & Forums Directory|/scripts/sectdir/osd.asp|;"		// text|URL|target of fourth sublink
			 
menublock[13]="Arial,Helvetica,sans-serif;"+ 			// font mainlink
			 "2;"+				// fontsize mainlink
			 "#FFFFFF;"+			// fontcolor mainlink
			 "1;"+				// fontweight mainlink, 1 means bold, 0 means normal
			 "Arial,Helvetica,sans-serif;"+ 		// font sublinks
			 "2;"+				// fontsize sublinks
			 "#FFFFFF;"+			// fontcolor sublinks
			 "0;"+				// fontweight sublinks, 1 means bold, 0 means normal
			 "Career Counsel|/careercounsel/home.html|;" 				        // text|URL|target of mainlink sublink				 

			 
menublock[14]="Arial,Helvetica,sans-serif;"+ 			// font mainlink
			 "2;"+				// fontsize mainlink
			 "#FFFFFF;"+			// fontcolor mainlink
			 "1;"+				// fontweight mainlink, 1 means bold, 0 means normal
			 "Arial,Helvetica,sans-serif;"+ 		// font sublinks
			 "2;"+				// fontsize sublinks
			 "#FFFFFF;"+			// fontcolor sublinks
			 "0;"+				// fontweight sublinks, 1 means bold, 0 means normal
			 "ABA Governance|#|;"+ 				        // text|URL|target of mainlink
			 "Board of Governors|/leadership/governors.html|;"+		// text|URL|target of first sublink
			 "House of Delegates|/leadership/delegates.html|;"+		// text|URL|target of second sublink					 
			 "Office of the President|/leadership/greetings.html|;"+	// text|URL|target of third sublink	
			 "Blanket Authority Handbook (.pdf)|/ftp/pub/blanketauthority.pdf|;"+
			 "Policy and Procedures Handbook|/policy/handbook.html|;"+		// text|URL|target of fourth sublink		
			  "Constitution and Bylaws|/leadership/constitutionandbylaws.pdf|;"	

menublock[15]="Arial,Helvetica,sans-serif;"+ 			// font mainlink
			 "2;"+				// fontsize mainlink
			 "#FFFFFF;"+			// fontcolor mainlink
			 "1;"+				// fontweight mainlink, 1 means bold, 0 means normal
			 "Arial,Helvetica,sans-serif;"+ 		// font sublinks
			 "2;"+				// fontsize sublinks
			 "#FFFFFF;"+			// fontcolor sublinks
			 "0;"+				// fontweight sublinks, 1 means bold, 0 means normal
			 "Insurance Programs|#|;"+ 				        // text|URL|target of mainlink
			 "American Bar Endowment|http://www.abendowment.org|new;"+		// text|URL|target of first sublink
			 "American Bar Insurance Plans Consultants, INC.|http://www.abiins.com/|;"		// text|URL|target of second sublink	
	 		 					 					 
             		 
// No need to change anything below	 
//  **********************************************************************************
	 
	 
var menusplit
var urlsplit
var font_weight_main
var font_weight_sub
var font_weight_sub

var minusimg=new Image()
minusimg.src="/img/minus131.gif"

var plusimg=new Image()
plusimg.src="/img/plus131.gif"
			 
var showsubmenus=new Array()
for (i=0;i<=menublock.length-1;i++) {
	showsubmenus[i]=-1
}

var plusminusimg=new Array()
for (i=0;i<=menublock.length-1;i++) {
	plusminusimg[i]=plusimg.src
}

function openandclose(visi) {
	showsubmenus[visi]=(-1)*showsubmenus[visi]
    var menucontent=""
    if (showsubmenus[visi]==1) {plusminusimg[visi]=minusimg.src}
    if (showsubmenus[visi]==-1) {plusminusimg[visi]=plusimg.src}
    menucontent+="<table width=138>"
	for (i=0;i<=menublock.length-1;i++) {
		menusplit=menublock[i].split(";")
		urlsplit=menusplit[8].split("|")
		if (menusplit[3]==1) {font_weight_main="<b>"}
		if (menusplit[3]==0) {font_weight_main=""}
		if (menusplit[7]==1) {font_weight_sub="<b>"}
		if (menusplit[7]==0) {font_weight_sub=""} 
		menucontent+="<tr><td valign=top>"

        
       if (menusplit[9].length==0) {
            menucontent+="&nbsp;</td>"
            menucontent+="<td>"
            menucontent+=font_weight_main
            menucontent+="<a style='text-decoration:none' href="+urlsplit[1]+" target="+urlsplit[2]+">"
            menucontent+="<font onMouseOver=\"this.style.color = '" + mouse_over_color + "'\" onMouseOut=\"this.style.color = 'white'\" face="+menusplit[0]+" color="+menusplit[2]+" size="+menusplit[1]+">"
            menucontent+=urlsplit[0]
            menucontent+="</font></a></td></tr>"
            plus_i++ 
        }
        
        if (menusplit[9].length!=0) {
            var thismainmenu=i+plus_i
            menucontent+="<a style='text-decoration:none' href='javascript:openandclose("+i+")'>"
            menucontent+="<img src='"+plusminusimg[i]+"' border=0></a></td>"
            menucontent+="<td>"
            menucontent+=font_weight_main
            menucontent+="<a style='text-decoration:none' href='javascript:openandclose("+i+")'>"
            menucontent+="<font onMouseOver=\"this.style.color = '" + mouse_over_color + "'\" onMouseOut=\"this.style.color = 'white'\" face="+menusplit[0]+" color="+menusplit[2]+" size="+menusplit[1]+">"
            menucontent+=urlsplit[0]
            menucontent+="</font></a></td></tr>"
   
		    if (showsubmenus[i]==1) {
			    for (ii=9;ii<=menusplit.length-1;ii++) {
				    urlsplit=menusplit[ii].split("|")
                    menucontent+="<tr><td></td><td>"
    			    menucontent+=font_weight_sub
                    menucontent+="<a style='text-decoration:none' href="+urlsplit[1]+" target="+urlsplit[2]+">"
                    menucontent+="<font onMouseOver=\"this.style.color = '" + mouse_over_color + "'\" onMouseOut=\"this.style.color = 'white'\" face="+menusplit[4]+" color="+menusplit[6]+" size="+menusplit[5]+">"
                    menucontent+=urlsplit[0]
                    menucontent+="</font></a></td></tr>"
			    }
		    }
        }    
	}
    menucontent+="</table>"
	if (document.all) {
		menu2.innerHTML='<z>' + menucontent + '</z>'  
	}
	if (document.layers) {
		document.menu2.document.open()
		document.menu2.document.write(menucontent)
		document.menu2.document.close()
	}
	
	var isNS6 = (navigator.userAgent.indexOf("Gecko")    > 0) ? 1 : 0;
	
	if (isNS6)
	document.getElementById("menu2").innerHTML = menucontent;

 
	
}


