{*
$Id: error_login.tpl,v 1.2 2009/04/17 13:03:09 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

<h1>{$lng.lbl_authentication}</h1>

<div class="text-block">{$lng.txt_login_incorrect}</div>
{capture name=dialog}

  {include file="customer/main/login_form.tpl}

{/capture}
{include file="customer/dialog.tpl" title=$lng.lbl_authentication content=$smarty.capture.dialog noborder=true}
