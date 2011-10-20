{*
$Id: login_form.tpl,v 1.9 2009/06/11 07:27:10 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<form action="{$auth_form_url}/include/login.php" method="post" name="errorform">
  <input type="hidden" name="{$XCARTSESSNAME}" value="{$XCARTSESSID}" />
  <input type="hidden" name="is_remember" value="{$is_remember}" />
  <input type="hidden" name="usertype" value="{$auth_usertype|escape}" />
  <input type="hidden" name="redirect" value="{$redirect|amp}" />
  <input type="hidden" name="mode" value="login" />
  <table cellspacing="0" class="data-table" summary="{$lng.lbl_authentication|escape}">
    <tr> 
      <td class="data-name">{$lng.lbl_username}</td>
      <td class="data-required">{***}</td>
      <td><input type="text" name="username" size="30" value="{#default_login#|default:$username}" /></td>
    </tr>
    <tr> 
      <td class="data-name">{$lng.lbl_password}</td>
      <td class="data-required">{***}</td>
      <td><input type="password" name="password" size="30" maxlength="64" value="{#default_password#}" /></td>
    </tr>
    {if $main eq "login_incorrect"}
      <tr> 
        <td colspan="2">&nbsp;</td>
        <td class="error-message">{$lng.err_invalid_login}</td>
      </tr>
    {/if}
    {if $active_modules.Image_Verification and $show_antibot.on_login eq 'Y' && $login_antibot_on and $main ne 'disabled'}
      {include file="modules/Image_Verification/spambot_arrest.tpl" mode="data-table" id=$antibot_sections.on_login}
      {if $antibot_err}
        <tr>
          <td colspan="2">&nbsp;</td>
          <td class="error-message">{$lng.msg_err_antibot}</td>
        </tr>
      {/if}
    {/if}
    <tr> 
      <td colspan="2">&nbsp;</td>
      <td class="button-row">{include file="customer/buttons/submit.tpl" type="input" additional_button_class="main-button"}</td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
      <td class="button-row">{include file="customer/buttons/button.tpl" href="help.php?section=Password_Recovery" button_title=$lng.lbl_recover_password style="link"}</td>
    </tr>
  </table>
</form>
{if !$is_flc}
  <br />
  {$lng.txt_new_account_msg}
{/if}
