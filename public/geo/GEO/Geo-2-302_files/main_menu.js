//name array defines the categories available
					n = new Array();
						n[0] = 'default'
						n[1] = 'data'
						n[2] = 'analysis'
						n[3] = 'gallery'
						n[4] = 'topics'
						n[5] = 'geographic'
						n[6] = 'archives'
						n[7] = 'related'
					//end array
					
					//coordinate array defines the left pixel of the submenus
					coordinate = new Array();
						coordinate[0] = '0'
						coordinate[1] = '16'
						coordinate[2] = '114'
						coordinate[3] = '175'
						coordinate[4] = '279'
						coordinate[5] = '385'
						coordinate[6] = '500'
						coordinate[7] = '562'
					//end array
					
					//coordinate array defines default link for the main menu
					menulink = new Array();
						menulink[0] = vJSLevel
						menulink[1] = vJSLevel + 'data/national.php'
						menulink[2] = vJSLevel + 'analysis/research.php'
						menulink[3] = vJSLevel + 'gallery/maps.php'
						menulink[4] = vJSLevel + 'topics/schedule.php'
						menulink[5] = vJSLevel + 'geographic/estimatesgeography.php'
						menulink[6] = vJSLevel + 'archives/1990.php'
						menulink[7] = 'http://www.census.gov/population/www/projections/popproj.html'
					//end array
					
					//coordinate array defines default link for the main menu
					alternate = new Array();
						alternate[0] = ''
						alternate[1] = 'view estimates data'
						alternate[2] = 'analysis'
						alternate[3] = 'visit the graphics gallery'
						alternate[4] = 'estimates topics'
						alternate[5] = 'geographic topics'
						alternate[6] = 'archived data'
						alternate[7] = 'related topics'
					//end array
					
					//array to store properties						
				 	buttons = new Array();
					i = 1;
	  
					while (i < n.length) {
						if (window.document.URL.indexOf(n[i]) != -1) {roll = "_over"}
						else {roll = ""}
									
						linkname = n[i] + ".php"

						if (window.document.URL.indexOf(n[i]) != -1) {filename = n[i];}
//else {filename = "default"}
						buttons[i] = "<TD><A HREF=\"" + menulink[i] + "\" ONMOUSEOVER=\"activateMenu(" + i +"," + coordinate[i] + "); changeImages('" + n[i] + "', '" + vJSLevel + "images/nav_estimates_" + n[i] + "_over.gif'); return true;\" ONMOUSEOUT=\"clearTimeout(the_timeout); changeImages(\'" + n[i] + "\', \'" + vJSLevel + "images/nav_estimates_" + n[i] + roll + ".gif\'); return true;\"><IMG NAME=\"" + n[i] + "\" SRC=\"" + vJSLevel + "images/nav_estimates_" + n[i] + roll + ".gif\" BORDER=\"0\" alt=\"" + alternate[i] + "\"></A></TD>";
						i++;
					}	
					//join all the code together
					var navigation = buttons.join("\n");
					
					