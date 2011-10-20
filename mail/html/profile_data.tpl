{*
$Id: profile_data.tpl,v 1.17 2008/08/21 09:52:50 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<hr noshade="noshade" size="1" color="#CCCCCC" width="70%" align="left" />

<table cellpadding="0" cellspacing="0" width="100%">

<tr>
<td colspan="4"><b>{$lng.lbl_personal_information}</b></td>
</tr>

<tr>
<td width="25">&nbsp;&nbsp;&nbsp;</td>
<td width="20%"><tt>{$lng.lbl_username}:</tt></td>
<td width="10">&nbsp;</td>
<td width="80%"><tt>{$userinfo.login}</tt></td>
</tr>
{if $show_pwd}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_password}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.password}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.title}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_title}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.title}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.firstname}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_first_name}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.firstname}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.lastname}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_last_name}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.lastname}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.company}
<tr> 
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_company}:</tt></td>
<td>&nbsp;</td> 
<td><tt>{$userinfo.company}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.ssn}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_ssn}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.ssn}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.tax_number}
<tr> 
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_tax_number}:</tt></td>
<td>&nbsp;</td> 
<td><tt>{$userinfo.tax_number}</tt></td>
</tr>
{/if}

{if $userinfo.membership}
<tr> 
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_membership}:</tt></td>
<td>&nbsp;</td> 
<td><tt>{$userinfo.membership}</tt></td>
</tr>
{/if}

{if $userinfo.pending_membership ne $userinfo.membership}
<tr> 
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_signup_for_membership}:</tt></td>
<td>&nbsp;</td> 
<td><tt>{$userinfo.pending_membership}</tt></td>
</tr>
{/if}
{foreach from=$userinfo.additional_fields item=v}{if $v.section eq 'P'}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$v.title}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$v.value}</tt></td>
</tr>
{/if}{/foreach}

{if $userinfo.field_sections.B}
<tr>
<td colspan="4"><b>{$lng.lbl_billing_address}:</b></td>
</tr>

{if $userinfo.default_fields.b_title}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_title}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.b_title}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.b_firstname}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_first_name}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.b_firstname}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.b_lastname}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_last_name}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.b_lastname}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.b_address || $userinfo.default_fields.b_address_2}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_address}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.b_address}<br />{$userinfo.b_address_2}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.b_city}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_city}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.b_city}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.b_county && $config.General.use_counties eq "Y"}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_county}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.b_countyname}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.b_state}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_state}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.b_statename}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.b_country}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_country}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.b_countryname}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.b_zipcode}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_zip_code}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.b_zipcode}</tt></td>
</tr>
{/if}
{foreach from=$userinfo.additional_fields item=v}{if $v.section eq 'B'}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$v.title}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$v.value}</tt></td>
</tr>
{/if}{/foreach}
{/if}

{if $userinfo.field_sections.S}
<tr>
<td colspan="4"><b>{$lng.lbl_shipping_address}:</b></td>
</tr>

{if $userinfo.default_fields.s_title}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_title}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.s_title}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.s_firstname}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_first_name}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.s_firstname}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.s_lastname}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_last_name}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.s_lastname}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.s_address || $userinfo.default_fields.s_address_2}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_address}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.s_address}<br />{$userinfo.s_address_2}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.s_city}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_city}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.s_city}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.s_county && $config.General.use_counties eq "Y"}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_county}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.b_countyname}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.s_state}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_state}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.s_statename}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.s_country}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_country}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.s_countryname}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.s_zipcode}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_zip_code}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.s_zipcode}</tt></td>
</tr>
{/if}
{foreach from=$userinfo.additional_fields item=v}{if $v.section eq 'S'}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$v.title}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$v.value}</tt></td>
</tr>
{/if}{/foreach}
{/if}

{if $userinfo.field_sections.C || $userinfo.field_sections.A}
<tr>
<td colspan="4"><b>{$lng.lbl_contact_information}</b></td>
</tr>

{if $userinfo.default_fields.phone}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_phone}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.phone}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.fax}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_fax}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.fax}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.email}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_email}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.email}</tt></td>
</tr>
{/if}
{if $userinfo.default_fields.url}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$lng.lbl_url}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$userinfo.url}</tt></td>
</tr>
{/if}
{foreach from=$userinfo.additional_fields item=v}{if $v.section eq 'C' || $v.section eq 'A'}
<tr>
<td>&nbsp;&nbsp;&nbsp;</td>
<td><tt>{$v.title}:</tt></td>
<td>&nbsp;</td>
<td><tt>{$v.value}</tt></td>
</tr>
{/if}{/foreach}
{/if}

</table>

