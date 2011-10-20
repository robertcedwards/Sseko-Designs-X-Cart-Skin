{*
$Id: login_form.tpl,v 1.13 2009/06/11 07:27:10 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $config.Security.use_https_login eq "Y" and $usertype eq "C"}
{assign var="form_url" value=$https_location}
{else}
{assign var="form_url" value=$current_location}
{/if}
<form action="{$form_url}/include/login.php" method="post" name="errorform">
<input type="hidden" name="{$XCARTSESSNAME}" value="{$XCARTSESSID}" />
<input type="hidden" name="is_remember" value="{$is_remember}" />

<table>
<tr> 
  <td height="10" width="78" class="FormButton">{$lng.lbl_username}</td>
  <td width="10" height="10"><font class="Star">*</font></td>
  <td width="282" height="10"><input type="text" name="username" size="30" value="{#default_login#|default:$username}" /></td>
</tr>
<tr> 
  <td height="10" width="78" class="FormButton">{$lng.lbl_password}</td>
  <td width="10" height="10"><font class="Star">*</font></td>
  <td width="282" height="10"><input type="password" name="password" size="30" maxlength="64" value="{#default_password#}" />
<input type="hidden" name="usertype" value="{$auth_usertype|escape}" />
<input type="hidden" name="redirect" value="{$redirect|amp}" />
<input type="hidden" name="mode" value="login" />
</td>
</tr>
<tr> 
  <td height="10" width="78" class="FormButton"></td>
  <td width="10" height="10">&nbsp;</td>
  <td width="282" height="10" class="ErrorMessage">{ if $main eq "login_incorrect"}{$lng.err_invalid_login}{/if}</td>
</tr>
{if $active_modules.Image_Verification and $show_antibot.on_login eq 'Y' and $login_antibot_on and $main ne 'disabled'}
{include file="modules/Image_Verification/spambot_arrest.tpl" mode="data-table" id=$antibot_sections.on_login}
<tr>
  <td height="10" width="78" class="FormButton"></td>
  <td width="10" height="10">&nbsp;</td>
  <td width="282" height="10" class="ErrorMessage">{if $antibot_err}{$lng.msg_err_antibot}{/if}</td>
</tr>
{/if}

<tr> 
<td height="10" width="78" class="FormButton"></td>
<td width="10" height="10" class="FormButton">&nbsp;</td>
<td width="282" height="10">
{if $js_enabled}
{include file="buttons/submit.tpl" href="javascript:document.errorform.submit()" js_to_href="Y" type="input" style="button"}
{else}
{include file="submit_wo_js.tpl" value=$lng.lbl_submit}
{/if}
</td>
</tr>

</table>

</form>

<div align="right">{include file="buttons/button.tpl" href="help.php?section=Password_Recovery" button_title=$lng.lbl_recover_password}</div>
{if $usertype eq "C" && !$is_flc}
<br />{$lng.txt_new_account_msg}
{elseif $usertype eq "P"}
<br />{$lng.txt_create_account_msg}
{/if}
