/*
$Id: edit_product_options.js,v 1.2 2008/08/26 12:32:19 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*/
function openPopupPOptions(target, id) {
    return window.open('popup_poptions.php?target='+target+'&id='+id,'POptions','width=400,height=350,toolbar=no,status=no,scrollbars=yes,resizable=no,menubar=no,location=no,direction=no');
}
