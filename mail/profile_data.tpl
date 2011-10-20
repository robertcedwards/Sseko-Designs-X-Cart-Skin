{*
$Id: profile_data.tpl,v 1.14 2009/03/23 13:15:11 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{$lng.lbl_personal_information}:
---------------------
{$lng.lbl_username|mail_truncate}{$userinfo.login}
{if $show_pwd}{$lng.lbl_password|mail_truncate}{$userinfo.password}
{/if}
{if $userinfo.default_fields.title}{$lng.lbl_title|mail_truncate}{$userinfo.title}
{/if}
{if $userinfo.default_fields.firstname}{$lng.lbl_first_name|mail_truncate}{$userinfo.firstname}
{/if}
{if $userinfo.default_fields.lastname}{$lng.lbl_last_name|mail_truncate}{$userinfo.lastname}
{/if}
{if $userinfo.default_fields.company}{$lng.lbl_company|mail_truncate}{$userinfo.company}
{/if}
{if $userinfo.default_fields.ssn}{$lng.lbl_ssn|mail_truncate}{$userinfo.ssn}
{/if}
{if $userinfo.default_fields.tax_number}{$lng.lbl_tax_number|mail_truncate}{$userinfo.tax_number}
{/if}
{if $userinfo.tax_exempt eq 'Y'}{$lng.lbl_tax_exempt|mail_truncate}{$lng.txt_tax_exemption_assigned}
{/if}
{if $userinfo.membership}{$lng.lbl_membership|mail_truncate}{$userinfo.membership}
{/if}
{if $userinfo.pending_membershipid ne $userinfo.membershipid}{$lng.lbl_signup_for_membership|mail_truncate}{$userinfo.pending_membership}
{/if}
{foreach from=$userinfo.additional_fields item=v}{if $v.section eq 'P'}
{$v.title|mail_truncate}{$v.value}
{/if}{/foreach}

{if $userinfo.field_sections.B}
{$lng.lbl_billing_address}:
----------------
{if $userinfo.default_fields.b_title}{$lng.lbl_title|mail_truncate}{$userinfo.b_title}
{/if}
{if $userinfo.default_fields.b_firstname}{$lng.lbl_first_name|mail_truncate}{$userinfo.b_firstname}
{/if}
{if $userinfo.default_fields.b_lastname}{$lng.lbl_last_name|mail_truncate}{$userinfo.b_lastname}
{/if}
{if $userinfo.default_fields.b_address}{$lng.lbl_address|mail_truncate}{$userinfo.b_address}
{/if}
{if $userinfo.default_fields.b_address_2}{$lng.lbl_address_2|mail_truncate}{$userinfo.b_address_2}
{/if}
{if $userinfo.default_fields.b_city}{$lng.lbl_city|mail_truncate}{$userinfo.b_city}
{/if}
{if $userinfo.default_fields.b_county && $config.General.use_counties eq "Y"}{$lng.lbl_counties|mail_truncate}{$userinfo.b_countyname}
{/if}
{if $userinfo.default_fields.b_state}{$lng.lbl_state|mail_truncate}{$userinfo.b_statename}
{/if}
{if $userinfo.default_fields.b_country}{$lng.lbl_country|mail_truncate}{$userinfo.b_countryname}
{/if}
{if $userinfo.default_fields.b_zipcode}{$lng.lbl_zip_code|mail_truncate}{$userinfo.b_zipcode}
{/if}
{foreach from=$userinfo.additional_fields item=v}{if $v.section eq 'B'}
{$v.title|mail_truncate}{$v.value}
{/if}{/foreach}
{/if}

{if $userinfo.field_sections.S}
{$lng.lbl_shipping_address}:
-----------------
{if $userinfo.default_fields.s_title}{$lng.lbl_title|mail_truncate}{$userinfo.s_title}
{/if}
{if $userinfo.default_fields.s_firstname}{$lng.lbl_first_name|mail_truncate}{$userinfo.s_firstname}
{/if}
{if $userinfo.default_fields.s_lastname}{$lng.lbl_last_name|mail_truncate}{$userinfo.s_lastname}
{/if}
{if $userinfo.default_fields.s_address}{$lng.lbl_address|mail_truncate}{$userinfo.s_address}
{/if}
{if $userinfo.default_fields.s_address_2}{$lng.lbl_address_2|mail_truncate}{$userinfo.s_address_2}
{/if}
{if $userinfo.default_fields.s_city}{$lng.lbl_city|mail_truncate}{$userinfo.s_city}
{/if}
{if $userinfo.default_fields.s_county && $config.General.use_counties eq "Y"}{$lng.lbl_counties|mail_truncate}{$userinfo.s_countyname}
{/if}
{if $userinfo.default_fields.s_state}{$lng.lbl_state|mail_truncate}{$userinfo.s_statename}
{/if}
{if $userinfo.default_fields.s_country}{$lng.lbl_country|mail_truncate}{$userinfo.s_countryname}
{/if}
{if $userinfo.default_fields.s_zipcode}{$lng.lbl_zip_code|mail_truncate}{$userinfo.s_zipcode}
{/if}
{foreach from=$userinfo.additional_fields item=v}{if $v.section eq 'S'}
{$v.title|mail_truncate}{$v.value}
{/if}{/foreach}
{/if}

{if $userinfo.default_fields.phone}{$lng.lbl_phone|mail_truncate}{$userinfo.phone}
{/if}
{if $userinfo.default_fields.fax}{$lng.lbl_fax|mail_truncate}{$userinfo.fax}
{/if}
{if $userinfo.default_fields.email}{$lng.lbl_email|mail_truncate}{$userinfo.email}
{/if}
{if $userinfo.default_fields.url}{$lng.lbl_url|mail_truncate}{$userinfo.url}
{/if}
{foreach from=$userinfo.additional_fields item=v}{if $v.section eq 'C' || $v.section eq 'A'}
{$v.title|mail_truncate}{$v.value}
{/if}{/foreach}

