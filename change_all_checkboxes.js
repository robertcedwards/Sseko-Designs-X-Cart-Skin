/* $Id: change_all_checkboxes.js,v 1.4 2006/04/25 06:09:41 max Exp $ */

/*
	Parameters: 
	checkboxes 			- array of tag names
	checkboxes_form		- form name with these checkboxes
*/

function change_all(flag, formname, arr) {
	if (!formname)
		formname = checkboxes_form;
	if (!arr)
		arr = checkboxes;
	if (!document.forms[formname] || arr.length == 0)
		return false;
	for (var x = 0; x < arr.length; x++) {
		if (arr[x] != '' && document.forms[formname].elements[arr[x]] && !document.forms[formname].elements[arr[x]].disabled) {
   			document.forms[formname].elements[arr[x]].checked = flag;
			if (document.forms[formname].elements[arr[x]].onclick)
				document.forms[formname].elements[arr[x]].onclick();
		}
	}
}

function checkAll(flag, form, prefix) {
	if (!form)
		return;

	if (prefix)
		var reg = new RegExp("^"+prefix, "");
	for (var i = 0; i < form.elements.length; i++) {
		if (form.elements[i].type == "checkbox" && (!prefix || form.elements[i].name.search(reg) == 0) && !form.elements[i].disabled)
			form.elements[i].checked = flag;
	}
}

