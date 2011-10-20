{*
$Id: register_account.tpl,v 1.15 2009/06/29 07:54:30 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $hide_account_section ne "Y"}

{if $config.Security.use_complex_pwd eq 'Y' && $userinfo.login|default:$userinfo.uname eq ''}{assign var='show_passwd_note' value='Y'}{/if}

{if $hide_header eq ""}
      <tr>
        <td colspan="3" class="register-section-title">
          <div>
            <label>{$lng.lbl_username_n_password}</label>
          </div>
        </td>
      </tr>
{/if}

{if $anonymous ne "" and $config.General.disable_anonymous_checkout ne "Y"}

{* Anonymous account *}

      <tr>
        <td colspan="3">{$lng.txt_anonymous_account_msg}</td>
      </tr>

{/if}

{if $userinfo.login eq $login and $login and $userinfo.usertype ne "C"}

{* Display membership level *}

      <tr style="display: none;">
        <td>
          <input type="hidden" name="membershipid" value="{$userinfo.membershipid}" />
          <input type="hidden" name="pending_membershipid" value="{$userinfo.pending_membershipid}" />
        </td>
      </tr>

{else}

{if $config.General.membership_signup eq "Y" and ($usertype eq "C" or ($active_modules.Simple_Mode ne "" and $usertype eq "P") or $usertype eq "A" or $usertype eq "B") && $membership_levels}
{include file="customer/main/membership_signup.tpl"}
{/if}

{* /Display membership level *}

{/if}

{if $anonymous ne "" and $config.General.disable_anonymous_checkout ne "Y"}

{* Anonymous account *}
  <tr style="display: none;">
    <td>
<script type="text/javascript">
<!--

{literal}
function check_anonymous_fields (evnt) {
  var uname = document.getElementById('uname');

  if (evnt == 'onchange') {
    if (uname.value == '' && uname.form.elements.namedItem('passwd1').value == '' && uname.form.elements.namedItem('passwd2').value == '') {
      uname.form.elements.namedItem('password_is_modified').value = 'N';
      uname.form.elements.namedItem('uname').parentNode.parentNode.cells[1].innerHTML = ''; uname.form.elements.namedItem('uname').parentNode.parentNode.cells[1].className = '';
      uname.form.elements.namedItem('passwd1').parentNode.parentNode.cells[1].innerHTML = ''; uname.form.elements.namedItem('passwd1').parentNode.parentNode.cells[1].className = '';
      uname.form.elements.namedItem('passwd2').parentNode.parentNode.cells[1].innerHTML = ''; uname.form.elements.namedItem('passwd2').parentNode.parentNode.cells[1].className = '';
    }
  }

  if (evnt == 'onkeydown') {
    uname.form.elements.namedItem('uname').parentNode.parentNode.cells[1].innerHTML = '*'; uname.form.elements.namedItem('uname').parentNode.parentNode.cells[1].className = 'data-required';
    uname.form.elements.namedItem('passwd1').parentNode.parentNode.cells[1].innerHTML = '*'; uname.form.elements.namedItem('passwd1').parentNode.parentNode.cells[1].className = 'data-required';
    uname.form.elements.namedItem('passwd2').parentNode.parentNode.cells[1].innerHTML = '*'; uname.form.elements.namedItem('passwd2').parentNode.parentNode.cells[1].className = 'data-required';
  }
}
{/literal}

-->
</script>
        </td>
      </tr>
      <tr>
        <td class="data-name">{$lng.lbl_username}</td>
        {if $reg_error eq "P"}<td class="data-required">*</td>{else}<td>&nbsp;</td>{/if}
        <td>
          <input type="text" id="uname" name="uname" size="32" maxlength="32" value="{if $userinfo.uname}{$userinfo.uname}{else}{$userinfo.login}{/if}" onchange="javascript: check_anonymous_fields('onchange');" onkeydown="javascript: check_anonymous_fields('onkeydown');" />
{if ($reg_error ne "" && $reg_error ne 'A' && $reg_error ne 'F' && $reg_error ne 'I' && $userinfo.uname eq "" && $userinfo.login eq "") || $reg_error eq "U" || $error eq "username"}<span class="error-message">&lt;&lt;</span>{/if}
        </td>
      </tr>
{if $allow_pwd_modify eq 'Y'}
      <tr style="display:none;"><td><input type="hidden" name="password_is_modified" value="N" /></td></tr>
      <tr>
        <td class="data-name">{$lng.lbl_password}</td>
        {if $reg_error eq "P"}<td class="data-required">*</td>{else}<td>&nbsp;</td>{/if}
        <td>
            <input type="password" name="passwd1" size="32" maxlength="64" value="{$userinfo.passwd1|escape}" onchange="javascript: check_anonymous_fields('onchange'); this.form.elements.namedItem('password_is_modified').value = 'Y';" onkeydown="javascript: check_anonymous_fields('onkeydown');"{if $show_passwd_note eq 'Y'} onblur="javascript: $('#passwd_note').hide();" onfocus="javascript: showNote('passwd_note', this);"{/if} />
            {if $show_passwd_note eq 'Y'}<div id="passwd_note" class="note-box" style="display: none;">{$lng.txt_password_strength}</div>{/if}
            {if $reg_error eq "P"}<span class="error-message">&lt;&lt;</span>{/if} 
        </td>
      </tr>

      <tr>
        <td class="data-name">{$lng.lbl_confirm_password}</td>
        {if $reg_error eq "P"}<td class="data-required">*</td>{else}<td>&nbsp;</td>{/if}
        <td>
            <input type="password" name="passwd2" size="32" maxlength="64" value="{$userinfo.passwd2|escape}" onchange="javascript: check_anonymous_fields('onchange'); this.form.elements.namedItem('password_is_modified').value = 'Y';" onkeydown="javascript: check_anonymous_fields('onkeydown');"{if $show_passwd_note eq 'Y'} onblur="javascript: $('#passwd_note').hide();" onfocus="javascript: showNote('passwd_note', this.form.elements.namedItem('passwd1'));"{/if} />
            {if $reg_error eq "P"}<span class="error-message">&lt;&lt;</span>{/if} 
        </td>
      </tr>
{/if}
{* /Anonymous account *}

{else}

{* NOT anonymous account *}

      <tr>
        <td class="data-name">{$lng.lbl_username}</td>
{if $userinfo.login ne "" || ($login eq $userinfo.uname && $login ne '')}
          <td></td>
          <td>
          <b>{$userinfo.login|default:$userinfo.uname}</b>
          <input type="hidden" name="uname" value="{$userinfo.login|default:$userinfo.uname}" />

{else}
          <td class="data-required">*</td>
          <td>
          <input type="text" id="uname" name="uname" size="32" maxlength="32" value="{if $userinfo.uname}{$userinfo.uname}{else}{$userinfo.login}{/if}" />
{if ($reg_error ne "" and $userinfo.uname eq "" and $userinfo.login eq "") or $reg_error eq "U" or $error eq "username"}<span class="error-message">&lt;&lt;</span>{/if}

{/if}
        </td>
      </tr>
{if $allow_pwd_modify eq 'Y'}
      <tr style="display:none;"><td><input type="hidden" name="password_is_modified" value="N" /></td></tr>
      <tr>
        <td class="data-name">{$lng.lbl_password}</td>
        <td class="data-required">*</td>
        <td>
          <input type="password" id="passwd1" name="passwd1" size="32" maxlength="64" value="{$userinfo.passwd1|escape}" onchange="javascript: this.form.elements.namedItem('password_is_modified').value = 'Y';"{if $show_passwd_note eq 'Y'}  onblur="javascript: $('#passwd_note').hide();" onfocus="javascript: showNote('passwd_note', this);"{/if} />
          {if $show_passwd_note eq 'Y'}<div id="passwd_note" class="note-box" style="display: none;">{$lng.txt_password_strength}</div>{/if}
          {if ($reg_error ne "" and $userinfo.passwd1 eq "") || $reg_error eq "P"}<span class="error-message">&lt;&lt;</span>{/if} 
        </td>
      </tr>

      <tr>
        <td class="data-name">{$lng.lbl_confirm_password}</td>
        <td class="data-required">*</td>
        <td>
          <input type="password" id="passwd2" name="passwd2" size="32" maxlength="64" value="{$userinfo.passwd2|escape}" onchange="javascript: this.form.elements.namedItem('password_is_modified').value = 'Y';"{if $show_passwd_note eq 'Y'}  onblur="javascript: $('#passwd_note').hide();" onfocus="javascript: showNote('passwd_note', this.form.elements.namedItem('passwd1'));"{/if} />
          {if ($reg_error ne "" and $userinfo.passwd2 eq "") || $reg_error eq "P"}<span class="error-message">&lt;&lt;</span>{/if} 
        </td>
      </tr>
{else}
      <tr>
        <td class="data-name">{$lng.lbl_password}</td>
        <td></td>
        <td><a href="change_password.php">{$lng.lbl_chpass}</a></td>
      </tr>
{/if}
{* / NOT anonymous account *}

{/if}

{if (($active_modules.Simple_Mode ne "" and $usertype eq "P") or $usertype eq "A") and ($userinfo.uname && $userinfo.uname ne $login or !$userinfo.uname and $userinfo.login ne $login)}

{if $userinfo.status ne "A"}{* only for non-anonymous users *}
      <tr>
        <td class="data-name">{$lng.lbl_account_status}:</td>
        <td>&nbsp;</td>
        <td>

          <select name="status">
            <option value="N"{if $userinfo.status eq "N"} selected="selected"{/if}>{$lng.lbl_account_status_suspended}</option>
            <option value="Y"{if $userinfo.status eq "Y"} selected="selected"{/if}>{$lng.lbl_account_status_enabled}</option>
{if $active_modules.XAffiliate ne "" and ($userinfo.usertype eq "B" or $smarty.get.usertype eq "B")}
            <option value="Q"{if $userinfo.status eq "Q"} selected="selected"{/if}>{$lng.lbl_account_status_not_approved}</option>
            <option value="D"{if $userinfo.status eq "D"} selected="selected"{/if}>{$lng.lbl_account_status_declined}</option>
{/if}
          </select>
        </td>
      </tr>

{if $display_activity_box eq "Y"}
      <tr>
        <td class="data-name">{$lng.lbl_account_activity}:</td>
        <td>&nbsp;</td>
        <td>

          <select name="activity">
            <option value="Y"{if $userinfo.activity eq "Y"} selected="selected"{/if}>{$lng.lbl_account_activity_enabled}</option>
            <option value="N"{if $userinfo.activity eq "N"} selected="selected"{/if}>{$lng.lbl_account_activity_disabled}</option>
          </select>

        </td>
      </tr>
{/if}

{/if}{* $userinfo.status ne "A" *}

      <tr>
        <td colspan="2">&nbsp;</td>
        <td>

          <label>
            <input type="checkbox" id="change_password" name="change_password" value="Y"{if $userinfo.change_password eq "Y"} checked="checked"{/if} />
            {$lng.lbl_reg_chpass}
          </label>

        </td>
      </tr>

{if ($userinfo.usertype eq "P" or $smarty.get.usertype eq "P") && $usertype eq "A" && $active_modules.Simple_Mode eq ""}
      <tr>
        <td colspan="2">&nbsp;</td>
        <td>

          <label>
            <input type="checkbox" id="trusted_provider" name="trusted_provider" value="Y"{if $userinfo.trusted_provider eq "Y"} checked="checked"{/if} />
            {$lng.lbl_trusted_providers}
          </label>

        </td>
      </tr>
{/if}

{/if}

{else}

      <tr style="display: none;">
        <td>
          <input type="hidden" name="uname" value="{$userinfo.login|default:$userinfo.uname}" />
        </td>
      </tr>

{/if}
