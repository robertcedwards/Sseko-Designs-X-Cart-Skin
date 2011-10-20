{*
$Id: register_ccinfo.tpl,v 1.40 2009/04/18 06:33:04 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<tr style="display: none;">
<td>{include file="check_cc_number_script.tpl"}</td>
</tr>

{if $hide_header ne "Y"}
<tr>
<td valign="middle" height="20" colspan="5"><a name="ccinfo"></a><font class="RegSectionTitle">{$lng.lbl_credit_card_information}</font><hr size="1" noshade="noshade" /></td>
</tr>
{/if}

<tr>
<td valign="middle" align="right">{if $hide_header eq 'Y'}<a name="ccinfo"></a>{/if}{$lng.lbl_cc_type}</td>
<td><font class="Star">{if $config.General.check_cc_number eq "Y" || $smarty.get.mode eq 'checkout' || $action eq "cart"}*{else}&nbsp;{/if}</font></td>
<td nowrap="nowrap" colspan="3">
{if #safeCCNum# eq ""}
<select name="card_type" onchange="javascript: markCVV2(this)">
{section name=card_type loop=$card_types}
<option value="{$card_types[card_type].code}"{if $userinfo.card_type eq $card_types[card_type].code} selected="selected"{/if}>{$card_types[card_type].type}</option>
{/section}
</select>
{if $smarty.get.err eq 'fields' && $userinfo.card_type eq ''}<font class="Star">&lt;&lt;</font>{/if}
{else}
{#safeCCType#}
<input type="hidden" name="card_type" value="{#safeCCType#}" />
{/if}
</td>
</tr>

<tr>
<td valign="middle" align="right">{$lng.lbl_cc_name_explanation}</td>
<td><font class="Star">{if $config.General.check_cc_number eq "Y" || $smarty.get.mode eq 'checkout' || $action eq "cart"}*{else}&nbsp;{/if}</font></td>
<td nowrap="nowrap" colspan="3">
{if #safeCCNum# eq ""}
{if $userinfo.b_firstname ne ''}{assign var="card_firstname" value=$userinfo.b_firstname}{else}{assign var="card_firstname" value=$userinfo.firstname}{/if}
{if $userinfo.b_lastname ne ''}{assign var="card_lastname" value=$userinfo.b_lastname}{else}{assign var="card_lastname" value=$userinfo.lastname}{/if}
<input type="text" name="card_name" size="32" maxlength="50" value="{if $userinfo.card_name ne ""}{$userinfo.card_name|escape}{else}{$card_firstname|escape}{if $card_firstname ne ''} {/if}{$card_lastname|escape}{/if}" />
{if $smarty.get.err eq 'fields' && $userinfo.card_name eq ''}<font class="Star">&lt;&lt;</font>{/if}
{else}
{#safeCCName#}
<input type="hidden" name="card_name" value="{#safeCCName#}" />
{/if}
</td>
</tr>

<tr>
<td valign="middle" align="right">{$lng.lbl_cc_number_explanation}</td>
<td><font class="Star">{if $config.General.check_cc_number eq "Y" || $smarty.get.mode eq 'checkout' || $action eq "cart"}*{else}&nbsp;{/if}</font></td>
<td nowrap="nowrap" colspan="3">
{if #safeCCNum# eq ""}
<input type="text" name="card_number" size="32" maxlength="20" value="{if $smarty.get.err eq 'fields'}{$userinfo.card_number}{/if}" />
{if $smarty.get.err eq 'fields' && $userinfo.card_number eq ''}<font class="Star">&lt;&lt;</font>{/if}
{else}
{#safeCCNum#}
<input type="hidden" name="card_number" value="{#safeCCNum#}" />
{/if}
</td>
</tr>

{if $config.General.uk_oriented_ccinfo eq "Y" || $force_uk_ccinfo}
<tr>
<td valign="middle" align="right">{$lng.lbl_cc_validfrom}</td>
<td><font class="Star">{if $config.General.check_cc_number eq "Y" || $smarty.get.mode eq 'checkout' || $action eq "cart"}*{else}&nbsp;{/if}</font></td>
<td nowrap="nowrap" colspan="3">
{html_select_date prefix="card_valid_from_" display_days=false start_year="-5" month_format="%m" time=$userinfo.card_valid_from_time}
</td>
</tr>
{/if}

<tr>
<td valign="middle" align="right">{$lng.lbl_cc_expiration}</td>
<td><font class="Star">{if $config.General.check_cc_number eq "Y" || $smarty.get.mode eq 'checkout' || $action eq "cart"}*{else}&nbsp;{/if}</font></td>
<td nowrap="nowrap" colspan="3">
{if #safeCCNum# eq ""}
{html_select_date prefix="card_expire_" display_days=false end_year="+10" month_format="%m" time=$userinfo.card_expire_time}
{else}
{#safeCCExp#}
<input type="hidden" name="card_expire" value="{#safeCCExp#}" />
{/if}
</td>
</tr>

{if $payment_cc_data.disable_ccinfo eq "N" || ($payment_cc_data.disable_ccinfo eq "" && $config.General.enable_manual_cc_cvv2 eq 'Y')}
<tr>
<td valign="middle" align="right">{$lng.lbl_cc_cvv2}</td>
<td><font class="Star"><span id="cvv2_star">{if $config.General.check_cc_number eq "Y" || $smarty.get.mode eq 'checkout' || $action eq "cart"}*{else}&nbsp;{/if}</span></font></td>
<td nowrap="nowrap" colspan="3">
{if #safeCCNum# eq ""}
<table cellspacing="0" cellpadding="0" border="0">
<tr>
  <td valign="middle"><input type="text" name="card_cvv2" size="4" maxlength="4" value="{if $smarty.get.err eq 'fields'}{$userinfo.card_cvv2}{/if}" />&nbsp;</td>
  <td valign="middle">{include file="main/popup_help_link.tpl" section="cvv2"}</td>
  {if $smarty.get.err eq 'fields' && $userinfo.card_cvv2 eq ''}
  <td><font class="Star">&lt;&lt;</font></td>
  {/if}
</tr>
</table>
{else}
{#safeCCcvv2#}
<input type="hidden" name="card_cvv2" value="{#safeCCcvv2#}" />
{/if}
</td>
</tr>
{/if}

{if $config.General.uk_oriented_ccinfo eq "Y" || $force_uk_ccinfo}
<tr>
<td valign="middle" align="right">{$lng.lbl_cc_issueno}</td>
<td>&nbsp;</td>
<td nowrap="nowrap">
<input type="text" name="card_issue_no" size="4" maxlength="2" value="" />
</td>
<td colspan="2">{$lng.lbl_cc_leave_empty}</td>
</tr>
{/if}
