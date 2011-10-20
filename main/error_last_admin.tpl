{*
$Id: error_last_admin.tpl,v 1.8 2008/08/21 09:52:51 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{capture name=dialog}

{$lng.txt_last_admin_warning}

<br /><br />

{include file="buttons/button.tpl" button_title=$lng.lbl_continue href="home.php"}

<br />

{/capture}
{include file="dialog.tpl" title=$lng.lbl_warning content=$smarty.capture.dialog extra='width="100%"'}
