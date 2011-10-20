// $Id: popup_category.js,v 1.1 2009/04/20 16:46:32 vvs Exp $
function popup_category(field_categoryid, field_category) {

	wnd_handle = window.open("popup_category.php?field_categoryid="+field_categoryid+"&field_category="+field_category, "selectcategory", "width=600,height=550,toolbar=no,status=no,scrollbars=yes,resizable=yes,menubar=no,location=no,direction=no");

	return wnd_handle;
}
