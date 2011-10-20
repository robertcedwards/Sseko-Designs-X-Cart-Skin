{*
$Id: insecure_login_form.tpl,v 1.20 2009/09/09 08:12:04 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{$lng.txt_insecure_login_form}
<br />
{capture name=dialog}
<form action="{$http_location}/include/login.php" method="post" name="insecureform">

<table>
<tr> 
  <td height="10" width="78" class="FormButton">{$lng.lbl_username}</td>
  <td width="10" height="10"><font class="Star">*</font></td>
  <td width="282" height="10"> 
  <input type="text" name="username" size="30" value="{#default_login#|default:$username}" />
  </td>
</tr>
<tr> 
  <td height="10" width="78" class="FormButton">{$lng.lbl_password}</td>
  <td width="10" height="10"><font class="Star">*</font></td>
  <td width="282" height="10"> 
<input type="password" name="password" size="30" maxlength="64" value="{#default_password#}" />
<input type="hidden" name="usertype" value="{$auth_usertype|escape}" />
<input type="hidden" name="redirect" value="{$redirect|amp}" />
<input type="hidden" name="mode" value="login" />
  </td>
</tr>
{if $active_modules.Image_Verification and $show_antibot.on_login eq 'Y' and $login_antibot_on}
{include file="modules/Image_Verification/spambot_arrest.tpl" mode="data-table" id=$antibot_sections.on_login}
{/if}
<tr>
  <td height="10" width="78" class="FormButton"></td>
  <td width="10" height="10">&nbsp;</td>
  <td width="282" height="10" class="ErrorMessage">{if $antibot_err}{$lng.msg_err_antibot}{/if}</td>
</tr>
<tr> 
  <td height="10" width="78" class="FormButton"></td>
  <td width="10" height="10">&nbsp;</td>
  <td width="282" height="10" class="ErrorMessage">
</td>
</tr>
<tr> 
  <td height="10" width="78" class="FormButton"></td>
  <td width="10" height="10" class="FormButton">&nbsp;</td>
  <td width="282" height="10">
{if $js_enabled}
{include file="buttons/submit.tpl" href="javascript:document.insecureform.submit()" js_to_href="Y"}
{else}
{include file="submit_wo_js.tpl" value=$lng.lbl_submit}
{/if}
  </td>
</tr>

</table>
</form>

<br />
{/capture}
{include file="dialog.tpl" title=$lng.lbl_insecure_login_form content=$smarty.capture.dialog extra='width="100%"'}
