{*
$Id: change_password.tpl,v 1.28 2009/09/01 12:07:03 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

<h1>{$lng.lbl_chpass}</h1>

{include file="check_password_script.tpl"}

{capture name=dialog}
  <form action="change_password.php{if $password_reset_key ne ''}?password_reset_key={$password_reset_key}&amp;username={$username}{/if}" method="post" name="change_password"{if $config.Security.use_complex_pwd eq 'Y'} onsubmit="javascript: return checkPasswordStrength(document.change_password.new_password, document.change_password.confirm_password);"{/if}>

    <table cellspacing="0" class="data-table">

      <tr>
        <td>{$lng.lbl_username}:</td>
        <td>&nbsp;</td>
        <td><b>{$username}</b><input type="hidden" name="uname" value="{$username}" /></td>
      </tr>

      {if $mode ne 'recover_password'}
        <tr>
          <td>{$lng.lbl_old_password}:</td>
          <td class="data-required">*</td>
          <td><input type="password" size="30" name="old_password" value="{$old_password}" /></td>
        </tr>
      {/if}

      <tr>
        <td>{$lng.lbl_new_password}:</td>
        <td class="data-required">*</td>
        <td>
          <input type="password" size="30" name="new_password" value="{$new_password}"{if $config.Security.use_complex_pwd eq 'Y'} onblur="javascript: $('#passwd_note').hide();" onfocus="showNote('passwd_note', this);"{/if} />
          {if $config.Security.use_complex_pwd eq 'Y'}<div id="passwd_note" class="note-box" style="display: none; width: 200px;">{$lng.txt_password_strength}</div>{/if}
        </td>
      </tr>

      <tr>
        <td>{$lng.lbl_confirm_password}:</td>
        <td class="data-required">*</td>
        <td>
          <input type="password" size="30" name="confirm_password" value="{$confirm_password}"{if $config.Security.use_complex_pwd eq 'Y'} onblur="javascript: $('#passwd_note').hide();" onfocus="showNote('passwd_note', this.form.elements.namedItem('new_password'));"{/if} />
        </td>
      </tr>

      <tr>
        <td colspan="2">&nbsp;</td>
        <td class="button-row">{include file="customer/buttons/submit.tpl" type="input"}</td>
      </tr>

    </table>

  </form>

  {if $config.Security.check_old_passwords eq 'Y'}
  <div>
    {$lng.txt_ch_oldpass_info}
  </div>
  {/if}

{/capture}
{include file="customer/dialog.tpl" title=$lng.lbl_chpass content=$smarty.capture.dialog noborder=true}
