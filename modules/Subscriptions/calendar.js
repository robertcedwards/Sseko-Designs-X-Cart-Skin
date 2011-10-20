// $Id: calendar.js,v 1.3 2009/03/02 09:33:38 joy Exp $

var pay_dates = new Array();
var index=0;

function isDateInArray(dateValue) {
	for (var i = 0; i < pay_dates.length; i++) {
		if (dateValue == pay_dates[i])
			return dateValue;
	}
	return -1;
}

function removeDateFromArray(dateValue) {
	var new_pay_array = new Array();
	var j = 0;
	for(var i = 0; i < pay_dates.length; i++) {
		if (dateValue != pay_dates[i])
    	  new_pay_array[j++] = pay_dates[i];
	}
	pay_dates = new_pay_array;
	return 1;
}

function ChangeStatDate(oDate, dateValue, num) {
	if (isDateInArray(dateValue) < 0) {
		pay_dates[pay_dates.length] = dateValue;
		document.pay_dates_form[num+5].value = dateValue;
		oDate.className = oDate.title + "On";
	} else {
		removeDateFromArray(dateValue);
		document.pay_dates_form[num+5].value = "";
		oDate.className = oDate.title + "Off";
	}
	return 0;
}
