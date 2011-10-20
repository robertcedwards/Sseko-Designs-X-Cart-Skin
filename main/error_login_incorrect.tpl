{*
$Id: error_login_incorrect.tpl,v 1.38 2009/05/29 08:07:16 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{$lng.txt_login_incorrect}
<br /><br />
{capture name=dialog}
{include file="main/login_form.tpl}
{/capture}
{include file="dialog.tpl" title=$lng.lbl_authentication content=$smarty.capture.dialog extra='width="100%"'}
