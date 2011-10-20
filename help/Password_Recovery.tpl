{*
$Id: Password_Recovery.tpl,v 1.21 2009/05/29 08:07:16 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{$lng.txt_password_recover}
<br /><br />
{capture name=dialog}
<form action="help.php" method="post" name="processform">
<table cellpadding="0" cellspacing="1">
<tr> 
<td height="10" width="78" class="FormButton">{$lng.lbl_username}</td>
<td width="10" height="10"><font class="CustomerMessage">*</font></td>
<td width="282" height="10"> 
  <input type="text" name="username" size="30" value="{$username|escape:"html"}" />
</td>
</tr>
<tr> 
<td height="10" width="78" class="FormButton">{$lng.lbl_email}</td>
<td width="10" height="10"><font class="CustomerMessage">*</font></td>
<td width="282" height="10"> 
  <input type="text" name="email" size="30" value="{$email|escape:"html"}" />
</td>
</tr>
{if $smarty.get.section eq "Password_Recovery_error"}
<tr>
<td width="78" class="FormButton" height="5">&nbsp;</td>
<td width="10" height="5">&nbsp;</td>
<td width="282" height="5" class="ErrorMessage">{$lng.txt_login_email_not_match}</td>
</tr>
{/if}
<tr>
<td width="78" class="FormButton" height="5">&nbsp;</td>
<td width="10" height="5">&nbsp;</td>
<td width="282" height="5">&nbsp;</td>
</tr>
<tr> 
<td width="78" class="FormButton">&nbsp;</td>
<td width="10">&nbsp;</td>
<td width="282">{if $js_enabled}
{include file="buttons/submit.tpl" href="javascript:void(document.processform.submit());" js_to_href="Y" type="input"}
{else}
{include file="submit_wo_js.tpl" value=$lng.lbl_submit}
{/if}</td>
</tr>
</table>
<input type="hidden" name="action" value="recover_password" />
</form>
{/capture}
{include file="dialog.tpl" title=$lng.lbl_forgot_password content=$smarty.capture.dialog extra='width="100%"'}
