{*
$Id: contactus.tpl,v 1.50 2009/09/25 13:27:37 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<script type="text/javascript" language="JavaScript 1.2">
<!--
var requiredFields = [];
{counter start="-1" print=false name="requiredFields"}
{foreach from=$default_fields item=v key=k}
{if $v.required eq 'Y' && $v.avail eq 'Y'}
requiredFields[{counter name="requiredFields"}] = ["{$k}","{$v.title|strip|replace:'"':'\"'}",false];
{/if}
{/foreach}
{foreach from=$additional_fields item=v key=k}
{if $v.required eq 'Y' && $v.type eq 'T'  && $v.avail eq 'Y'} 
requiredFields[{counter name="requiredFields"}] = ["additional_values_{$v.fieldid}","{$v.title|strip|replace:'"':'\"'}",false];
{/if} 
{/foreach}
requiredFields[{counter name="requiredFields"}] = ["subject","{$lng.lbl_subject|strip|replace:'"':'\"'}",false];
requiredFields[{counter name="requiredFields"}] = ["message_body","{$lng.lbl_message|strip|replace:'"':'\"'}",false];

function checkContactusFormFields() {ldelim}
  return (checkEmailAddress(document.registerform.email) && checkRequired(requiredFields) && check_zip_code(document.getElementById('b_country'), document.getElementById('b_zipcode')));
{rdelim}
-->
</script>
{include file="check_required_fields_js.tpl"}
{include file="check_email_script.tpl"}
{include file="check_zipcode_js.tpl"}

{if $smarty.get.mode eq "update" || $smarty.get.mode eq ""}
{$lng.txt_contact_us_header}
{/if}
<br /><br />
{capture name=dialog}
{if $smarty.get.mode eq "sent"}
{$lng.txt_contact_us_sent}
{elseif $smarty.get.mode eq "update" || $smarty.get.mode eq ""}
<form action="help.php?section=contactus&amp;mode=update&amp;action=contactus" method="post" name="registerform">
<table width="100%" cellspacing="1" cellpadding="3">

{if $default_fields.username.avail eq 'Y'}
<tr valign="middle">
<td class="FormButton">{$lng.lbl_username}</td>
<td>{if $default_fields.username.required eq 'Y'}<font class="Star">*</font>{/if}</td>
<td nowrap="nowrap">
<input type="text" id="username" name="username" size="32" maxlength="32" value="{if $userinfo.username ne ''}{$userinfo.username}{else}{$userinfo.login}{/if}" />
</td>
</tr>
{/if}

{if $default_fields.title.avail eq 'Y'}
<tr valign="middle">
<td class="FormButton">{$lng.lbl_title}</td>
<td>{if $default_fields.title.required eq 'Y'}<font class="Star">*</font>{/if}</td>
<td nowrap="nowrap">
<select id="title" name="title">
{include file="main/title_selector.tpl" field=$userinfo.titleid}
</select>
</td>
</tr>
{/if}

{if $default_fields.firstname.avail eq 'Y'}
<tr valign="middle">
<td class="FormButton">{$lng.lbl_first_name}</td>
<td>{if $default_fields.firstname.required eq 'Y'}<font class="Star">*</font>{/if}</td>
<td nowrap="nowrap">
<input type="text" id="firstname" name="firstname" size="32" maxlength="32" value="{$userinfo.firstname|escape}" />
{if $fillerror ne "" and $userinfo.firstname eq "" && $default_fields.firstname.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}
 
{if $default_fields.lastname.avail eq 'Y'}
<tr valign="middle">
<td class="FormButton">{$lng.lbl_last_name}</td>
<td>{if $default_fields.lastname.required eq 'Y'}<font class="Star">*</font>{/if}</td>
<td nowrap="nowrap">
<input type="text" id="lastname" name="lastname" size="32" maxlength="32" value="{$userinfo.lastname|escape}" />
{if $fillerror ne "" and $userinfo.lastname eq "" && $default_fields.lastname.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}

{if $default_fields.company.avail eq 'Y'}
<tr valign="middle">
<td class="FormButton">{$lng.lbl_company}</td>
<td>{if $default_fields.company.required eq 'Y'}<font class="Star">*</font>{/if}</td>
<td nowrap="nowrap">
<input type="text" id="company" name="company" size="32" value="{$userinfo.company|escape}" />
{if $fillerror ne "" and $userinfo.company eq "" && $default_fields.company.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}
 
{if $default_fields.b_address.avail eq 'Y'}
<tr valign="middle">
<td class="FormButton">{$lng.lbl_address}</td>
<td>{if $default_fields.b_address.required eq 'Y'}<font class="Star">*</font>{/if}</td>
<td nowrap="nowrap">
<input type="text" id="b_address" name="b_address" size="32" maxlength="64" value="{$userinfo.b_address|escape}" />
{if $fillerror ne "" and $userinfo.b_address eq "" && $default_fields.b_address.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}
 
{if $default_fields.b_address_2.avail eq 'Y'}
<tr valign="middle">
<td class="FormButton">{$lng.lbl_address_2}</td>
<td>{if $default_fields.b_address_2.required eq 'Y'}<font class="Star">*</font>{/if}</td>
<td nowrap="nowrap">
<input type="text" id="b_address_2" name="b_address_2" size="32" maxlength="64" value="{$userinfo.b_address_2|escape}" />
{if $fillerror ne "" and $userinfo.b_address_2 eq "" && $default_fields.b_address_2.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}
 
{if $default_fields.b_city.avail eq 'Y'}
<tr valign="middle">
<td class="FormButton">{$lng.lbl_city}</td>
<td>{if $default_fields.b_city.required eq 'Y'}<font class="Star">*</font>{/if}</td>
<td nowrap="nowrap">
<input type="text" id="b_city" name="b_city" size="32" maxlength="64" value="{$userinfo.b_city|escape}" />
{if $fillerror ne "" and $userinfo.b_city eq "" && $default_fields.b_city.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}
 
{if $default_fields.b_county.avail eq 'Y' && $config.General.use_counties eq "Y"}
<tr valign="middle">
<td class="FormButton">{$lng.lbl_county}</td>
<td>{if $default_fields.b_county.required eq 'Y'}<font class="Star">*</font>{/if}</td>
<td nowrap="nowrap">
{include file="main/counties.tpl" counties=$counties name="b_county" default=$userinfo.b_county stateid=$userinfo.b_stateid country_name="b_country"}
</td>
</tr>
{/if}

{if $default_fields.b_state.avail eq 'Y'}
<tr valign="middle">
<td class="FormButton">{$lng.lbl_state}</td>
<td>{if $default_fields.b_state.required eq 'Y'}<font class="Star">*</font>{/if}</td>
<td nowrap="nowrap">
{include file="main/states.tpl" states=$states name="b_state" default=$userinfo.b_state|default:$config.General.default_state default_country=$userinfo.b_country|default:$config.General.default_country country_name="b_country"}
</td>
</tr>
{/if}
 
{if $default_fields.b_country.avail eq 'Y'}
<tr valign="middle">
<td class="FormButton">{$lng.lbl_country}</td>
<td>{if $default_fields.b_country.required eq 'Y'}<font class="Star">*</font>{/if}</td>
<td nowrap="nowrap">
<select id="b_country" name="b_country" onchange="javascript: check_zip_code();">
{section name=country_idx loop=$countries}
<option value="{$countries[country_idx].country_code}"{if $userinfo.b_country eq $countries[country_idx].country_code} selected="selected"{elseif $countries[country_idx].country_code eq $config.General.default_country and $userinfo.b_country eq ""} selected="selected"{/if}>{$countries[country_idx].country}</option>
{/section}
</select>
</td>
</tr>
{/if}

{if $js_enabled eq 'Y' && $default_fields.b_state.avail eq 'Y' && $default_fields.b_country.avail eq 'Y'}
<tr style="display: none;">
  <td>
{include file="change_states_js.tpl"}
{include file="main/register_states.tpl" state_name="b_state" country_name="b_country" county_name="b_county" state_value=$userinfo.b_state|default:$config.General.default_state county_value=$userinfo.b_county}
  </td>
</tr>
{/if}

{if $default_fields.b_zipcode.avail eq 'Y'}
<tr valign="middle">
<td class="FormButton">{$lng.lbl_zip_code}</td>
<td>{if $default_fields.b_zipcode.required eq 'Y'}<font class="Star">*</font>{/if}</td>
<td nowrap="nowrap">
<input type="text" id="b_zipcode" name="b_zipcode" size="32" maxlength="32" value="{$userinfo.b_zipcode|escape}" onchange="javascript: check_zip_code(document.getElementById('b_country'), this);" />
{if $fillerror ne "" and $userinfo.b_zipcode eq "" && $default_fields.b_zipcode.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}
 
{if $default_fields.phone.avail eq 'Y'}
<tr valign="middle">
<td class="FormButton">{$lng.lbl_phone}</td>
<td>{if $default_fields.phone.required eq 'Y'}<font class="Star">*</font>{/if}</td>
<td nowrap="nowrap">
<input type="text" id="phone" name="phone" size="32" maxlength="32" value="{$userinfo.phone|escape}" />
{if $fillerror ne "" and $userinfo.phone eq "" && $default_fields.phone.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}
 
{if $default_fields.email.avail eq 'Y'}
<tr valign="middle">
<td class="FormButton">{$lng.lbl_email}</td>
<td>{if $default_fields.email.required eq 'Y'}<font class="Star">*</font>{/if}</td>
<td nowrap="nowrap">
<input type="text" id="email" name="email" size="32" maxlength="128" value="{$userinfo.email|escape}" onchange="javascript: checkEmailAddress(this);" />
{if $fillerror ne "" and $userinfo.email eq "" && $default_fields.email.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}

{if $default_fields.fax.avail eq 'Y'}
<tr valign="middle">
<td class="FormButton">{$lng.lbl_fax}</td>
<td>{if $default_fields.fax.required eq 'Y'}<font class="Star">*</font>{/if}</td>
<td nowrap="nowrap">
<input type="text" id="fax" name="fax" size="32" maxlength="128" value="{$userinfo.fax|escape}" /></td>
</tr>
{/if}
 
{if $default_fields.url.avail eq 'Y'}
<tr valign="middle">
<td class="FormButton">{$lng.lbl_web_site}</td>
<td>{if $default_fields.url.required eq 'Y'}<font class="Star">*</font>{/if}</td>
<td nowrap="nowrap">
<input type="text" id="url" name="url" size="32" maxlength="128" value="{if $userinfo.url eq ""}http://{else}{$userinfo.url}{/if}" />
{if $fillerror ne "" and $userinfo.url eq "" && $default_fields.url.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}

{foreach from=$additional_fields item=v}
{if $v.avail eq "Y"}
<tr valign="middle">
<td class="FormButton">{$v.title|default:$v.field}</td>
<td>{if $v.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap">
{if $v.type eq 'T'}
<input type="text" id="additional_values_{$v.fieldid}" name="additional_values[{$v.fieldid}]" size="32" value="{$v.value|escape}" />
{elseif $v.type eq 'C'}
<input type="checkbox" id="additional_values_{$v.fieldid}" name="additional_values[{$v.fieldid}]" value="Y"{if $v.value eq 'Y'} checked="checked"{/if} />
{elseif $v.type eq 'S'}
<select id="additional_values_{$v.fieldid}" name="additional_values[{$v.fieldid}]">
{foreach from=$v.variants item=o}
<option value='{$o|escape}'{if $v.value eq $o} selected="selected"{/if}>{$o|escape}</option>
{/foreach}
</select>
{/if}
{if $fillerror ne "" and $v.value eq "" && $v.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}
{/foreach}

{if $default_fields.department.avail eq 'Y'}
<tr valign="middle">
<td class="FormButton">{$lng.lbl_department}</td>
<td>{if $default_fields.department.required eq 'Y'}<font class="Star">*</font>{/if}</td>
<td nowrap="nowrap">
<select id="department" name="department">
<option value="All" {if $userinfo.department eq "All" or $userinfo.department eq ""}selected="selected"{/if}>{$lng.lbl_all}</option>
<option value="Partners" {if $userinfo.department eq "Partners"}selected="selected"{/if}>{$lng.lbl_partners}</option>
<option value="Marketing / publicity" {if $userinfo.department eq "Marketing / publicity"}selected="selected"{/if}>{$lng.lbl_marketing_publicity}</option>
<option value="Webdesign" {if $userinfo.department eq "Webdesign"}selected="selected"{/if}>{$lng.lbl_web_design}</option>
<option value="Sales" {if $userinfo.department eq "Sales"}selected="selected"{/if}>{$lng.lbl_sales_department}</option>
</select>
</td>
</tr>
{/if}

<tr valign="middle">
<td class="FormButton">{$lng.lbl_subject}</td>
<td><font class="Star">*</font></td>
<td nowrap="nowrap">
<input type="text" id="subject" name="subject" size="32" maxlength="128" value="{$userinfo.subject|escape}" />
{if $fillerror ne "" and $userinfo.subject eq ""}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>

<tr valign="middle">
<td class="FormButton">{$lng.lbl_message}</td>
<td><font class="Star">*</font></td>
<td nowrap="nowrap">
<textarea cols="48" id="message_body" rows="12" name="body">{$userinfo.body}</textarea>
{if $fillerror ne "" and $userinfo.body eq ""}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>

{if $active_modules.Image_Verification and $show_antibot.on_contact_us eq 'Y'}
{include file="modules/Image_Verification/spambot_arrest.tpl" mode="data-table" id=$antibot_sections.on_contact_us antibot_err=$antibot_contactus_err}
{/if}
<tr valign="middle">
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>
<br />
{if $js_enabled}
{include file="buttons/submit.tpl" href="javascript: if(checkContactusFormFields()) document.registerform.submit()"}
{else}
{include file="submit_wo_js.tpl" value=$lng.lbl_submit}
{/if}
</td>
</tr>
</table>
<input type="hidden" name="usertype" value="{$usertype}" />
</form>
{/if}
{/capture}
{include file="dialog.tpl" title=$lng.lbl_contact_us content=$smarty.capture.dialog extra='width="100%"'}
