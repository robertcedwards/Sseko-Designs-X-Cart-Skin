{*
$Id: edit_customer.tpl,v 1.28 2009/09/09 08:12:04 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="change_states_js.tpl"}
{include file="check_zipcode_js.tpl"}

{capture name=dialog}
<form action="order.php" method="post" name="editcustomer_form">
<input type="hidden" name="mode" value="edit" />
<input type="hidden" name="action" value="update_customer" />
<input type="hidden" name="show" value="customer" />
<input type="hidden" name="orderid" value="{$orderid}" />
<input type="hidden" name="customer_info[tax_exempt]" value="N" />

{include file="main/subheader.tpl" title=$lng.lbl_customer_info}

<table cellspacing="1" cellpadding="3" width="100%">

<tr valign="top">
  <td colspan="3"><i>{$lng.lbl_personal_information}:</i></td>
</tr>

<tr class="TableHead">
  <td height="16">&nbsp;</td>
  <th align="left">{$lng.lbl_aom_current_value}</th>
  <th align="left">{$lng.lbl_aom_original_value}</th>
</tr>

{if $default_fields.title.avail eq 'Y'}
<tr{cycle name=c1 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_title}</td>
  <td>
  <select name="customer_info[titleid]">
{include file="main/title_selector.tpl" field=$cart_customer.titleid use_title_id="Y"}
  </select>
  </td>
  <td>{$customer.title}</td>
</tr>
{/if}
{if $default_fields.firstname.avail eq 'Y'}
<tr{cycle name=c1 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_first_name}</td>
  <td><input type="text" name="customer_info[firstname]" size="32" maxlength="32" value="{$cart_customer.firstname|escape}" /></td>
  <td>{$customer.firstname}</td>
</tr>
{/if}
{if $default_fields.lastname.avail eq 'Y'}
<tr{cycle name=c1 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_last_name}</td>
  <td><input type="text" name="customer_info[lastname]" size="32" maxlength="32" value="{$cart_customer.lastname|escape}" /></td>
  <td>{$customer.lastname}</td>
</tr>
{/if}
{if $default_fields.company.avail eq 'Y'}
<tr{cycle name=c1 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_company}</td>
  <td><input type="text" name="customer_info[company]" size="32" maxlength="32" value="{$cart_customer.company|escape}" /></td>
  <td>{$customer.company}</td>
</tr>
{/if}
{if $default_fields.tax_number.avail eq 'Y'}
<tr{cycle name=c1 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_tax_number}</td>
  <td><input type="text" name="customer_info[tax_number]" size="32" maxlength="32" value="{$cart_customer.tax_number|escape}" /></td>
  <td>{$customer.tax_number}</td>
</tr>
{/if}
{if $config.Taxes.enable_user_tax_exemption eq 'Y'}
<tr{cycle name=c1 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_tax_exemption}</td>
  <td><input type="checkbox" name="customer_info[tax_exempt]" value="Y"{if $cart_customer.tax_exempt eq "Y"} checked="checked"{/if} /></td>
  <td>{if $customer.tax_exempt eq "Y"}{$lng.txt_tax_exemption_assigned}{else}{$lng.txt_not_available}{/if}</td>
</tr>
{/if}
{if $membership_levels}
<tr{cycle name=c1 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_membership}</td>
  <td>
  <select name="customer_info[membershipid]">
    <option value="">{$lng.lbl_not_member}</option> 
  {foreach from=$membership_levels item=m key=mid}
    <option value="{$mid}"{if $cart_customer.membershipid eq $mid} selected="selected"{/if}>{$m.membership}</option>
  {/foreach}
  </select>
  </td>
  <td>{$customer.membership|default:$lng.lbl_not_member}</td>
</tr>
{/if}
{foreach from=$cart_customer.additional_fields item=v key=k}
{if $v.section eq 'C'}
<tr{cycle name=c1 values=', class="TableSubHead"'}>
  <td>
<input type="hidden" name="additional_fields[{$k}][fieldid]" value="{$v.fieldid}" />
<input type="hidden" name="additional_fields[{$k}][section]" value="{$v.section}" />
<input type="hidden" name="additional_fields[{$k}][title]" value="{$v.title}" />
{$v.title}
  </td>
  <td><input type="text" name="additional_fields[{$k}][value]" value="{$v.value|escape}" /></td>
  <td>{$v.value}</td>
</tr>
{/if}
{/foreach}

<tr>
  <td colspan="3">&nbsp;</td>
</tr>

<tr valign="top">
  <td colspan="3"><i>{$lng.lbl_billing_address}:</i></td>
</tr>
<tr class="TableHead">
  <td height="16">&nbsp;</td>
  <th height="16" align="left">{$lng.lbl_aom_current_value}</th>
  <th height="16" align="left">{$lng.lbl_aom_original_value}</th>
</tr>
{if $default_fields.b_title.avail eq 'Y'}
<tr{cycle name=c2 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_title}</td>
  <td>
  <select name="customer_info[b_titleid]">
{include file="main/title_selector.tpl" field=$cart_customer.b_titleid use_title_id="Y"}
  </select>
  </td>
  <td>{$customer.b_title}</td>
</tr>
{/if}
{if $default_fields.b_firstname.avail eq 'Y'}
<tr{cycle name=c2 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_first_name}</td>
  <td><input type="text" name="customer_info[b_firstname]" size="32" maxlength="32" value="{$cart_customer.b_firstname|escape}" /></td>
  <td>{$customer.b_firstname}</td>
</tr>
{/if}
{if $default_fields.b_lastname.avail eq 'Y'}
<tr{cycle name=c2 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_last_name}</td>
  <td><input type="text" name="customer_info[b_lastname]" size="32" maxlength="32" value="{$cart_customer.b_lastname|escape}" /></td>
  <td>{$customer.b_lastname}</td>
</tr>
{/if}
{if $default_fields.b_address.avail eq 'Y'}
<tr{cycle name=c2 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_address}</td>
  <td><input type="text" name="customer_info[b_address]" size="32" maxlength="64" value="{$cart_customer.b_address|escape}" /></td>
  <td>{$customer.b_address}</td>
</tr>
{/if}
{if $default_fields.b_address_2.avail eq 'Y'}
<tr{cycle name=c2 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_address_2}</td>
  <td><input type="text" name="customer_info[b_address_2]" size="32" maxlength="64" value="{$cart_customer.b_address_2|escape}" /></td>
  <td>{$customer.b_address_2}</td>
</tr>
{/if}
{if $default_fields.b_city.avail eq 'Y'}
<tr{cycle name=c2 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_city}</td>
  <td><input type="text" name="customer_info[b_city]" size="32" maxlength="64" value="{$cart_customer.b_city|escape}" /></td>
  <td>{$customer.b_city}</td>
</tr>
{/if}
{if ($config.General.use_counties eq "Y" or $customer.b_county ne "") and $default_fields.b_county.avail eq 'Y'}
<tr{cycle name=c2 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_county}</td>
  <td>{include file="main/counties.tpl" counties=$counties name="customer_info[b_county]" default=$cart_customer.b_county}</td>
  <td>{$customer.b_countyname}</td>
</tr>
{/if}
{if $default_fields.b_state.avail eq 'Y'}
<tr{cycle name=c2 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_state}</td>
  <td>{include file="main/states.tpl" states=$states name="customer_info[b_state]" default=$cart_customer.b_state default_country=$cart_customer.b_country}</td>
  <td>{$customer.b_statename}</td>
</tr>
{/if}
{if $default_fields.b_country.avail eq 'Y'}
<tr{cycle name=c2 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_country}</td>
  <td>
  <select name="customer_info[b_country]" id="customer_info_b_country" onchange="javascript: check_zip_code_field(this.form['customer_info[b_country]'], this.form['customer_info[b_zipcode]']);">
  {section name=country_idx loop=$countries}
    <option value="{$countries[country_idx].country_code|escape}"{if $cart_customer.b_country eq $countries[country_idx].country_code || ($countries[country_idx].country_code eq $config.General.default_country and $cart_customer.b_country eq "")} selected="selected"{/if}>{$countries[country_idx].country}</option>
  {/section}
  </select>
  </td>
  <td>{$customer.b_countryname}</td>
</tr>
{/if}
{if $default_fields.b_zipcode.avail eq 'Y'}
<tr{cycle name=c2 values=', class="TableSubHead"'}>
    <td>{$lng.lbl_zip_code}</td>
    <td><input type="text" name="customer_info[b_zipcode]" size="32" maxlength="32" value="{$cart_customer.b_zipcode|escape}" onchange="javascript: check_zip_code_field(this.form['customer_info[b_country]'], this.form['customer_info[b_zipcode]']);" /></td>
    <td>{$customer.b_zipcode}</td>
</tr>
{/if}
{foreach from=$cart_customer.additional_fields item=v key=k}
{if $v.section eq 'B'}
<tr{cycle name=c1 values=', class="TableSubHead"'}>
  <td>{$v.title}</td>
  <td>
<input type="text" name="additional_fields[{$k}][value]" value="{$v.value|escape}" />
<input type="hidden" name="additional_fields[{$k}][fieldid]" value="{$v.fieldid}" />
<input type="hidden" name="additional_fields[{$k}][section]" value="{$v.section}" />
<input type="hidden" name="additional_fields[{$k}][title]" value="{$v.title}" />
  </td>
  <td>{$v.value}</td>
</tr>
{/if}
{/foreach}

<tr>
  <td colspan="3">&nbsp;</td>
</tr>

<tr valign="top">
  <td colspan="3"><i>{$lng.lbl_shipping_address}:</i></td>
</tr>

<tr class="TableHead">
  <td height="16">&nbsp;</td>
  <th height="16" align="left">{$lng.lbl_aom_current_value}</th>
  <th height="16" align="left">{$lng.lbl_aom_original_value}</th>
</tr>
{if $default_fields.s_title.avail eq 'Y'}
<tr{cycle name=c3 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_title}</td>
  <td>
  <select name="customer_info[s_titleid]">
{include file="main/title_selector.tpl" field=$cart_customer.s_titleid use_title_id="Y"}
  </select>
  </td>
  <td>{$customer.s_title}</td>
</tr>
{/if}
{if $default_fields.s_firstname.avail eq 'Y'}
<tr{cycle name=c3 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_first_name}</td>
  <td><input type="text" name="customer_info[s_firstname]" size="32" maxlength="32" value="{$cart_customer.s_firstname|escape}" /></td>
  <td>{$customer.s_firstname}</td>
</tr>
{/if}
{if $default_fields.s_lastname.avail eq 'Y'}
<tr{cycle name=c3 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_last_name}</td>
  <td><input type="text" name="customer_info[s_lastname]" size="32" maxlength="32" value="{$cart_customer.s_lastname|escape}" /></td>
  <td>{$customer.s_lastname}</td>
</tr>
{/if}
{if $default_fields.s_address.avail eq 'Y'}
<tr{cycle name=c3 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_address}</td>
  <td><input type="text" name="customer_info[s_address]" size="32" maxlength="64" value="{$cart_customer.s_address|escape}" /></td>
  <td>{$customer.s_address}</td>
</tr>
{/if}
{if $default_fields.s_address_2.avail eq 'Y'}
<tr{cycle name=c3 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_address_2}</td>
  <td><input type="text" name="customer_info[s_address_2]" size="32" maxlength="64" value="{$cart_customer.s_address_2|escape}" /></td>
  <td>{$customer.s_address_2}</td>
</tr>
{/if}
{if $default_fields.s_city.avail eq 'Y'}
<tr{cycle name=c3 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_city}</td>
  <td><input type="text" name="customer_info[s_city]" size="32" maxlength="64" value="{$cart_customer.s_city|escape}" /></td>
  <td>{$customer.s_city}</td>
</tr>
{/if}
{if ($config.General.use_counties eq "Y" or $customer.s_county ne "") and $default_fields.s_county.avail eq 'Y'}
<tr{cycle name=c2 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_county}</td>
  <td>{include file="main/counties.tpl" counties=$counties name="customer_info[s_county]" default=$cart_customer.s_county}</td>
  <td>{$customer.s_countyname}</td>
</tr>
{/if}
{if $default_fields.s_state.avail eq 'Y'}
<tr{cycle name=c3 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_state}</td>
  <td>{include file="main/states.tpl" states=$states name="customer_info[s_state]" default=$cart_customer.s_state default_country=$cart_customer.s_country}</td>
  <td>{$customer.s_statename}</td>
</tr>
{/if}
{if $default_fields.s_country.avail eq 'Y'}
<tr{cycle name=c3 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_country}</td>
  <td>
  <select name="customer_info[s_country]" id="customer_info_s_country" onchange="javascript: check_zip_code_field(this.form['customer_info[s_country]'], this.form['customer_info[s_zipcode]']);">
  {section name=country_idx loop=$countries}
    <option value="{$countries[country_idx].country_code|escape}"{if $cart_customer.s_country eq $countries[country_idx].country_code || ($countries[country_idx].country_code eq $config.General.default_country and $cart_customer.b_country eq "")} selected="selected"{/if}>{$countries[country_idx].country}</option>
  {/section}
  </select>
  </td>
  <td>{$customer.s_countryname}</td>
</tr>
{/if}
{if $default_fields.s_zipcode.avail eq 'Y'}
<tr{cycle name=c3 values=', class="TableSubHead"'}>
    <td>{$lng.lbl_zip_code}</td>
    <td><input type="text" name="customer_info[s_zipcode]" size="32" maxlength="32" value="{$cart_customer.s_zipcode|escape}" onchange="javascript: check_zip_code_field(this.form['customer_info[s_country]'], this.form['customer_info[s_zipcode]']);" /></td>
    <td>{$customer.s_zipcode}</td>
</tr>
{/if}
{foreach from=$cart_customer.additional_fields item=v key=k}
{if $v.section eq 'S'}
<tr{cycle name=c1 values=', class="TableSubHead"'}>
  <td>
<input type="hidden" name="additional_fields[{$k}][fieldid]" value="{$v.fieldid}" />
<input type="hidden" name="additional_fields[{$k}][section]" value="{$v.section}" />
<input type="hidden" name="additional_fields[{$k}][title]" value="{$v.title}" />
{$v.title}
  </td>
  <td><input type="text" name="additional_fields[{$k}][value]" value="{$v.value|escape}" /></td>
  <td>{$v.value}</td>
</tr>
{/if}
{/foreach}

<tr>
  <td colspan="3">&nbsp;</td>
</tr>

<tr valign="top">
  <td colspan="3"><i>{$lng.lbl_contact_information}:</i></td>
</tr>

<tr class="TableHead">
  <td height="16">&nbsp;</td>
  <th height="16" align="left">{$lng.lbl_aom_current_value}</th>
  <th height="16" align="left">{$lng.lbl_aom_original_value}</th>
</tr>
{if $default_fields.phone.avail eq 'Y'}
<tr{cycle name=c4 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_phone}</td>
  <td><input type="text" name="customer_info[phone]" size="32" maxlength="32" value="{$cart_customer.phone|escape}" /></td>
  <td>{$customer.phone}</td>
</tr>
{/if}
{if $default_fields.email.avail eq 'Y'}
<tr{cycle name=c4 values=', class="TableSubHead"'}>
    <td>{$lng.lbl_email}</td>
    <td><input type="text" name="customer_info[email]" size="32" maxlength="128" value="{$cart_customer.email|escape}" /></td>
    <td><a href="mailto:{$customer.email}">{$customer.email}</a></td>
</tr>
{/if}
{if $default_fields.fax.avail eq 'Y'}
<tr{cycle name=c4 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_fax}</td>
  <td><input type="text" name="customer_info[fax]" size="32" maxlength="128" value="{$cart_customer.fax|escape}" /></td>
  <td>{$customer.fax}</td>
</tr>
{/if}
{if $default_fields.url.avail eq 'Y'}
<tr{cycle name=c4 values=', class="TableSubHead"'}>
  <td>{$lng.lbl_web_site}</td>
  <td><input type="text" name="customer_info[url]" size="32" maxlength="128" value="{$cart_customer.url|escape}" /></td>
  <td>{if $customer.url}<a href="{$customer.url}">{$customer.url}</a>{else}&nbsp;{/if}</td>
</tr>
{/if}
{foreach from=$cart_customer.additional_fields item=v key=k}
{if $v.section eq 'C'}
<tr{cycle name=c1 values=', class="TableSubHead"'}>
  <td>
<input type="hidden" name="additional_fields[{$k}][fieldid]" value="{$v.fieldid}" />
<input type="hidden" name="additional_fields[{$k}][section]" value="{$v.section}" />
<input type="hidden" name="additional_fields[{$k}][title]" value="{$v.title}" />
{$v.title}
  </td>
  <td><input type="text" name="additional_fields[{$k}][value]" value="{$v.value|escape}" /></td>
</tr>
{/if}
{/foreach}

{assign var="is_header" value=""}
{foreach from=$cart_customer.additional_fields item=v key=k}
{if $v.section eq 'A'}
{if $is_header ne 'Y'}
<tr>
  <td colspan="3">&nbsp;</td>
</tr>

<tr valign="top">
  <td colspan="3"><i>{$lng.lbl_additional_information}:</i></td>
</tr>
<tr class="TableHead">
  <td height="16">&nbsp;</td>
  <th height="16" align="left">{$lng.lbl_aom_current_value}</th>
  <th height="16" align="left">{$lng.lbl_aom_original_value}</th>
</tr>
{assign var="is_header" value="Y"}
{/if}
<input type="hidden" name="additional_fields[{$k}][fieldid]" value="{$v.fieldid}" />
<input type="hidden" name="additional_fields[{$k}][section]" value="{$v.section}" />
<input type="hidden" name="additional_fields[{$k}][title]" value="{$v.title}" />
<tr{cycle name=c1 values=', class="TableSubHead"'}>
  <td>{$v.title}</td>
  <td><input type="text" name="additional_fields[{$k}][value]" value="{$v.value|escape}" /></td>
  <td>{$v.value}</td>
</tr>
{/if}
{/foreach}

<tr>
<td colspan="3"><br />
<input type="submit" value="{$lng.lbl_update}" />
<br /><br />
</td>
</tr>

</table>
</form>
{/capture}
{include file="dialog.tpl" title=$lng.lbl_aom_edit_customer_title|substitute:"orderid":$order.orderid content=$smarty.capture.dialog extra='width="100%"'}

{include file="main/register_states.tpl" state_name="customer_info[b_state]" country_name="customer_info_b_country" county_name="customer_info[b_county]" state_value=$cart_customer.b_state county_value=$cart_customer.b_county}
{include file="main/register_states.tpl" state_name="customer_info[s_state]" country_name="customer_info_s_country" county_name="customer_info[s_county]" state_value=$cart_customer.s_state county_value=$cart_customer.s_county}
