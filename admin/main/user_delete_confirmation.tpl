{*
$Id: user_delete_confirmation.tpl,v 1.31 2009/04/18 06:33:02 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="page_title.tpl" title=$lng.lbl_delete_users}

<!-- IN THIS SECTION -->

{include file="dialog_tools.tpl"}

<!-- IN THIS SECTION -->

<br />

{$lng.txt_delete_users_top_text}

<br /><br />

{capture name=dialog}

<div align="right">{include file="buttons/button.tpl" button_title=$lng.lbl_return_to_search_results href="users.php?mode=search`$pagestr`"}</div>
<br />

<form action="process_user.php" method="post" name="processform">

<input type="hidden" name="mode" value="delete" />
<input type="hidden" name="confirmed" value="Y" />

{$lng.txt_delete_users_top_note}

<ul>
{foreach from=$users item=user}
<li><span class="ProductPriceSmall">{$user.login}</span>: {$user.usertype_name}
<dl>
<dd><b>{$user.title} {$user.firstname} {$user.lastname}</b></dd>
<dd>{$user.company}</dd>
<dd><i>{$lng.lbl_phone}:</i> {$user.phone} / <i>{$lng.lbl_email}:</i> {$user.email}</dd>
<dd><i>{$lng.lbl_web_site}:</i> {$user.url|default:$lng.txt_not_available}</dd>
<dd>
<table cellpadding="0" cellspacing="0">
<tr>
  <td>
<i>{$lng.lbl_shipping_address}:</i>
<dd>{$user.s_address},</dd>
{if $user.s_address_2}<dd>{$user.s_address_2},</dd>{/if}
<dd>{$user.s_city},</dd>
<dd>{$user.s_state} {if $user.s_statename ne $user.s_state}({$user.s_statename}){/if} {$user.s_zipcode},</dd>
<dd>{$user.s_countryname}</dd>
  </td>
  <td>&nbsp;&nbsp;&nbsp;</td>
  <td>
<i>{$lng.lbl_billing_address}:</i>
<dd>{$user.b_address},</dd>
{if $user.b_address_2}<dd>{$user.b_address_2},</dd>{/if}
<dd>{$user.b_city},</dd>
<dd>{$user.b_state} {if $user.b_statename ne $user.b_state}({$user.b_statename}){/if} {$user.b_zipcode},</dd>
<dd>{$user.b_countryname}</dd>
  </td>
</tr>

{if $user.provider_counters.total gt 0}
<tr>
  <td>
{if $user.is_provider_profile}
<font class="ErrorMessage">{$lng.lbl_warning}:</font> {$lng.txt_remove_provider_with_data}
{elseif $move_to_providers}
{$lng.txt_remove_provider_and_move_data}<br /><br />
<label for="next_provider_{$user.login|escape}">{$lng.txt_please_specify_user_to_whom_you_information_to_assigned}</label>
<select name="next_provider[{$user.login|escape}]" id="next_provider_{$user.login|escape}">
{foreach from=$move_to_providers item=v}
    <option value="{$v.login|escape}">{$v.firstname} {$v.lastname} ({$v.login})</option>
{/foreach}
</select>
{else}
{$lng.txt_remove_provider_and_anonymyze_data}
{/if}
  </td>
</tr>
{/if}

</table>
</dl>
</li>
{/foreach}
</ul>

{$lng.txt_operation_not_reverted_warning}

<br /><br />

<table cellspacing="0" cellpadding="0">
<tr>
  <td>{$lng.txt_are_you_sure_to_proceed}</td>
  <td>&nbsp;&nbsp;&nbsp;</td>
  <td>{include file="buttons/button.tpl" button_title=$lng.lbl_yes href="javascript:document.processform.submit()" js_to_href="Y"}</td>
  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  <td>{include file="buttons/button.tpl" button_title=$lng.lbl_no href="users.php?mode=search`$pagestr`"}</td>
</tr>
</table>

</form>

{/capture}
{include file="dialog.tpl" title=$lng.lbl_confirmation content=$smarty.capture.dialog extra='width="100%"'}
