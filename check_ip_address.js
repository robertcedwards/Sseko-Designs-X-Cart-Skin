// $Id: check_ip_address.js,v 1.2 2008/06/09 14:04:20 zaa Exp $

// Check IP address
function checkIPAddress(str, blockAlert) {
	var obj = false;
    if (typeof(str) != 'string' && str.tagName && str.tagName.toUpperCase() == 'INPUT') {
		obj = str;
        str = str.value;
	}

	if (typeof(str) != 'string')
		return false;

    var arr = str.split('.');
    var res = false;
    if (arr.length == 4) {
        res = true;
        var isMask = false;
        for (var i = 0; i < 4; i++) {
            if (arr[i] == '*') {
                isMask = true;

            } else if (arr[i].search(/^\d+$/) == -1 || parseInt(arr[i]) < 0 || parseInt(arr[i]) > 255 || isMask) {
                res = false;
                break;
            } 
        }
    }

    if (!res && !blockAlert && window.lbl_ip_address_format_incorrect) {
        alert(lbl_ip_address_format_incorrect);
		if (obj && obj.focus)
			obj.focus();
	}

    return res;
}
