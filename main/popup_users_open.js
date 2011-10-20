/* $Id: popup_users_open.js,v 1.2 2008/06/09 14:04:30 zaa Exp $ */

function open_popup_users(form, format, force_submit) {
	return window.open ("popup_users.php?form="+form+"&format="+escape(format)+'&force_submit='+(force_submit ? "Y" : ""), "selectusers", "width=600,height=550,toolbar=no,status=no,scrollbars=yes,resizable=no,menubar=no,location=no,direction=no");
}
