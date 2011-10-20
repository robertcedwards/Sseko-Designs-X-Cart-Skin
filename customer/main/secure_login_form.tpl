{*
$Id: secure_login_form.tpl,v 1.21 2009/08/11 13:02:42 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<h1>{$lng.lbl_secure_login_form}</h1>
<p class="text-block">{$lng.txt_secure_login_form}</p>
{capture name=dialog}
  <form action="{$https_location}/include/login.php" method="post" name="secureform">
    <input type="hidden" name="redirect" value="{$redirect|amp}" />
    <input type="hidden" name="mode" value="login" />
    <input type="hidden" name="usertype" value="{$auth_usertype|escape}" />
    <table cellspacing="0" class="data-table">
      <tr>
        <td class="data-name">{$lng.lbl_username}</td>
        {*<td class="data-required">*</td>*}
        <td><input type="text" name="username" size="30" value="{$username|escape}"/></td>
      </tr>
      <tr> 
        <td class="data-name">{$lng.lbl_password}</td>
        {*<td class="data-required">*</td>*}
        <td><input type="password" name="password" size="30" /></td>
      </tr>
      {if $active_modules.Image_Verification and $show_antibot.on_login eq 'Y' && $login_antibot_on}
        {include file="modules/Image_Verification/spambot_arrest.tpl" mode="data-table" id=$antibot_sections.on_login}
      {/if}
      {if $antibot_err}
        <tr>
          <td colspan="2">&nbsp;</td>
          <td class="error-message">{$lng.msg_err_antibot}</td>
        </tr>
      {/if}
      <tr>
        <td colspan="2">&nbsp;</td>
        <td class="button-row">
          {include file="customer/buttons/submit.tpl" type="input"}
        </td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
        <td>
          <div class="recovery">
            <a href="help.php?section=Password_Recovery">{$lng.lbl_recover_password}</a>
          </div>
        </td>
      </tr>
    </table>
  </form>
{/capture}
{include file="customer/dialog.tpl" title=$lng.lbl_secure_login_form content=$smarty.capture.dialog noborder=true}
