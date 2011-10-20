{*
$Id: register.tpl,v 1.47 2009/09/01 12:07:05 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $js_enabled eq 'Y'}
{include file="check_email_script.tpl"}
{include file="check_password_script.tpl"}
{include file="check_zipcode_js.tpl"}
{include file="generate_required_fields_js.tpl"}
{include file="check_required_fields_js.tpl"}
{include file="change_states_js.tpl"}
{/if}

{if $newbie eq "Y"}
{assign var="title" value=$lng.lbl_modify_profile}
{else}
{if $main eq "user_add"}
{if $active_modules.Simple_Mode}
{assign var="title" value=$lng.lbl_create_admin_profile}
{else}
{assign var="title" value=$lng.lbl_create_provider_profile}
{/if}
{else}
{if $active_modules.Simple_Mode}
{assign var="title" value=$lng.lbl_modify_admin_profile}
{else}
{assign var="title" value=$lng.lbl_modify_provider_profile}
{/if}
{/if}
{/if}

{include file="page_title.tpl" title=$title}

<!-- IN THIS SECTION -->

{if $newbie ne "Y"}
{include file="dialog_tools.tpl"}
{/if}

<!-- IN THIS SECTION -->

<font class="Text">

{if $newbie ne "Y"}
<br />
{if $active_modules.Simple_Mode}
{if $main eq "user_add"}
{$lng.txt_create_admin_profile}
{else}
{$lng.txt_modify_admin_profile}
{/if}
{else}
{if $main eq "user_add"} 
{$lng.txt_create_provider_profile}
{else} 
{$lng.txt_modify_provider_profile}
{/if} 
{/if}
<br /><br />
{/if}

{$lng.txt_fields_are_mandatory}

</font>

<br /><br />

{include file="provider/main/profile_menu.tpl"}

{if $smarty.get.submode eq 'seller_address'}
{include file="provider/main/register_provider.tpl"}

{else}
{capture name=dialog}

{if $newbie ne "Y" and $main ne "user_add" and ($usertype eq "P" and $active_modules.Simple_Mode eq "Y" or $usertype eq "A")}
<div align="right">{include file="buttons/button.tpl" button_title=$lng.lbl_go_to_users_list href="users.php?mode=search"}</div>
{/if}

{assign var="reg_error" value=$top_message.reg_error}
{assign var="error" value=$top_message.error}
{assign var="emailerror" value=$top_message.emailerror}

{if $registered eq ""}
{if $reg_error}
<font class="Star">
{if $reg_error eq "F" }
{$lng.txt_registration_error}
{elseif $reg_error eq "E" }
{$lng.txt_email_already_exists}
{elseif $reg_error eq "U" }
{$lng.txt_user_already_exists}
{/if}
</font>
<br />
{/if}

{if $error ne ""}
<font class="Star"><strong>
{if $error eq "b_statecode"}
{$lng.err_billing_state}
{elseif $error eq "s_statecode"}
{$lng.err_shipping_state}
{elseif $error eq "b_county"}
{$lng.err_billing_county}
{elseif $error eq "s_county"}
{$lng.err_shipping_county}
{elseif $error eq "email"}
{$lng.txt_email_invalid}
{elseif $error eq "username"}
{$lng.err_username_invalid}
{else}
{$error}
{/if}
</strong></font>
<br />
{/if}

<form action="{$register_script_name}?{$smarty.server.QUERY_STRING|amp}" method="post" name="registerform"{if $js_enabled} onsubmit="javascript: if (check_zip_code(){if $default_fields.email.required eq 'Y'} &amp;&amp; checkEmailAddress(document.registerform.email){/if} &amp;&amp; checkRequired(requiredFields){if $config.Security.use_complex_pwd eq 'Y'} &amp;&amp; checkPasswordStrength(document.registerform.passwd1,document.registerform.passwd2){/if}) return true; else return false;"{/if}>
{if $config.Security.use_https_login eq "Y"}
<input type="hidden" name="{$XCARTSESSNAME}" value="{$XCARTSESSID}" />
{/if}

<table cellspacing="1" cellpadding="2" width="100%">

{include file="main/register_personal_info.tpl" userinfo=$userinfo}

{include file="main/register_billing_address.tpl" userinfo=$userinfo}

{include file="main/register_shipping_address.tpl" userinfo=$userinfo}

{include file="main/register_contact_info.tpl" userinfo=$userinfo}

{include file="main/register_additional_info.tpl" section='A'}

{include file="main/register_account.tpl" userinfo=$userinfo}


{if $active_modules.News_Management and $newslists}
{include file="modules/News_Management/register_newslists.tpl" userinfo=$userinfo}
{/if}

<tr>
  <td colspan="2">&nbsp;</td>
  <td><br />

<br /><br />

<font class="FormButton">
{if $smarty.get.mode eq "update"}
<input type="hidden" name="mode" value="update" />
{/if}
<input type="hidden" name="anonymous" value="{$anonymous|escape}" />

<input type="submit" value=" {$lng.lbl_save} " />

  </td>
</tr>

</table>
<input type="hidden" name="usertype" value="{if $smarty.get.usertype ne ""}{$smarty.get.usertype|escape:"html"}{else}{$usertype}{/if}" />
</form>

<br /><br />

{$lng.txt_newbie_registration_bottom}

<br />

{else}

{if $smarty.post.mode eq "update" or $smarty.get.mode eq "update"}
{$lng.txt_profile_modified}
{else}
{$lng.txt_profile_created}
{/if}

{/if}

{/capture}
{include file="dialog.tpl" title=$lng.lbl_profile_details content=$smarty.capture.dialog extra='width="100%"'}
{/if}
