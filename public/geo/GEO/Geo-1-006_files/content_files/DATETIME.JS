//DateTime Script v1.0 by Shady Abou-Zahra
//  please read the documentation for information about usage

var days = new Array ("Mo","Tu","We","Th","Fr","Sa","Su");
var days_long = new Array ("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
var months = new Array ("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
var months_long = new Array ("January","February","March","April","May","June","July","August","September","October","November","December");

function currentDate() {
  var now = new Date()
  document.write(days_long[now.getDay()]+", "+now.getDate()+" "+months_long[now.getMonth()]+" "+getY2K(now.getYear()));
}

function getY2K(year) {
  if (year < 1000)
    return eval(year+1900)
  else
    return year
}
