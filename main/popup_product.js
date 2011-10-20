// $Id: popup_product.js,v 1.3 2009/10/27 11:57:44 vvs Exp $
function popup_product (field_productid, field_product, only_regular) {
	return window.open("popup_product.php?field_productid="+field_productid+"&field_product="+field_product+"&only_regular="+only_regular, "selectproduct", "width=600,height=550,toolbar=no,status=no,scrollbars=yes,resizable=yes,menubar=no,location=no,direction=no");
}
