<!-- Display the Last updated date -->
<!-- Created by Ricky Sandhu  -->
<!-- July, 2001 -->
<!-- Begin
function lastUpdate() {
	var months = new Array(13);
	months[1] = "January";
	months[2] = "February";
	months[3] = "March";
	months[4] = "April";
	months[5] = "May";
	months[6] = "June";
	months[7] = "July";
	months[8] = "August";
	months[9] = "September";
	months[10] = "October";
	months[11] = "November";
	months[12] = "December";
	var dateObj = new Date(document.lastModified);
	var lmonth = months[dateObj.getMonth() + 1];
	var date = dateObj.getDate();
	var fyear = dateObj.getYear();
	// Fix the year problem in Netscape ver. 4.0 +
	if ((fyear > 50) && (fyear < 2000)) fyear = fyear + 1900;
	// Fix the year problem in Netscape ver. 3.0
	if (fyear<50) fyear = fyear + 2000;
	return (lmonth + " " + date + ", " + fyear);
}

// Display the date
var htmlLine="";

htmlLine += "<TR bgColor=#E2E2E2><TD colSpan=10><font size=-2>Last modified: ";
htmlLine += lastUpdate() + ".</font></TD></TR>";
document.write(htmlLine);
// End -->