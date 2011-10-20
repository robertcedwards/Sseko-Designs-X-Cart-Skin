// $Id: zone_edit.js,v 1.3 2008/06/09 14:05:12 zaa Exp $



function checkZone(zone, name) {
var codes;

	var obj = document.getElementById(name);
	if (zone == 'ALL') {
		for (var x = 0; x < obj.options.length; x++)
			obj.options[x].selected = true;
		return true;
	}

	eval('codes = zones.'+zone);
	if (codes)
		for(var x = 0; x < obj.options.length; x++)
			eval('obj.options[x].selected = codes.'+obj.options[x].value);
}
