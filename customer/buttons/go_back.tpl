{*
$Id: go_back.tpl,v 1.2 2008/09/03 13:09:15 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="customer/buttons/button.tpl" button_title=$lng.lbl_go_back href=$href|default:"javascript: history.go(-1);" style="link"}
