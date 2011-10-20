{*
$Id: order_invoice.tpl,v 1.44 2009/04/30 06:43:54 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $customer ne ''}{assign var="_userinfo" value=$customer}{else}{assign var="_userinfo" value=$userinfo}{/if}
{config_load file="$skin_config"}
{$lng.lbl_order_id|mail_truncate}#{$order.orderid}
{$lng.lbl_order_date|mail_truncate}{$order.date|date_format:$config.Appearance.datetime_format}
{$lng.lbl_order_status|mail_truncate}{include file="main/order_status.tpl" status=$order.status mode="static"}

{if $order.applied_taxes}
{foreach from=$order.applied_taxes key=tax_name item=tax}
{$tax.regnumber}
{/foreach}
{/if}

{if $order.tracking}
{$lng.lbl_tracking_number|mail_truncate}{$order.tracking}
{/if}
{if $order.reg_numbers}
{section name=rn loop=$order.reg_numbers}
{if %rn.first%}
{$lng.lbl_registration_number}:
{/if}
{$order.reg_numbers[rn]}
{/section}
{/if}

{$lng.lbl_customer_info}:
---------------------
{if $_userinfo.default_fields.title}{$lng.lbl_title|mail_truncate}{$order.title}
{/if}
{if $_userinfo.default_fields.firstname}{$lng.lbl_first_name|mail_truncate}{$order.firstname}
{/if}
{if $_userinfo.default_fields.lastname}{$lng.lbl_last_name|mail_truncate}{$order.lastname}
{/if}
{if $_userinfo.default_fields.company}{$lng.lbl_company|mail_truncate}{$order.company}
{/if}
{if $_userinfo.default_fields.tax_number}{$lng.lbl_tax_number|mail_truncate}{$order.tax_number}
{/if}
{if $_userinfo.default_fields.phone}{$lng.lbl_phone|mail_truncate}{$order.phone}
{/if}
{if $_userinfo.default_fields.fax}{$lng.lbl_fax|mail_truncate}{$order.fax}
{/if}
{if $_userinfo.default_fields.email}{$lng.lbl_email|mail_truncate}{$order.email}
{/if}
{if $_userinfo.default_fields.url}{$lng.lbl_url|mail_truncate}{$order.url}
{/if}
{foreach from=$_userinfo.additional_fields item=v}{if $v.section eq 'P' || $v.section eq 'C'}
{$v.title|mail_truncate}{$v.value}
{/if}{/foreach}

{$lng.lbl_billing_address}:
----------------
{if $_userinfo.default_fields.b_title}{$lng.lbl_title|mail_truncate}{$order.b_title}
{/if}
{if $_userinfo.default_fields.b_firstname}{$lng.lbl_first_name|mail_truncate}{$order.b_firstname}
{/if}
{if $_userinfo.default_fields.b_lastname}{$lng.lbl_last_name|mail_truncate}{$order.b_lastname}
{/if}
{if $_userinfo.default_fields.b_address}{$lng.lbl_address|mail_truncate}{$order.b_address}
{/if}
{if $_userinfo.default_fields.b_address_2}{$lng.lbl_address_2|mail_truncate}{$order.b_address_2}
{/if}
{if $_userinfo.default_fields.b_city}{$lng.lbl_city|mail_truncate}{$order.b_city}
{/if}
{if $_userinfo.default_fields.b_county}{if $config.General.use_counties eq "Y"}{$lng.lbl_county|mail_truncate}{$order.b_countyname}{/if} 
{/if}
{if $_userinfo.default_fields.b_state}{$lng.lbl_state|mail_truncate}{$order.b_statename}
{/if}
{if $_userinfo.default_fields.b_country}{$lng.lbl_country|mail_truncate}{$order.b_countryname}
{/if}
{if $_userinfo.default_fields.b_zipcode}{$lng.lbl_zip_code|mail_truncate}{$order.b_zipcode}
{/if}
{foreach from=$_userinfo.additional_fields item=v}{if $v.section eq 'B'}
{$v.title|mail_truncate}{$v.value}
{/if}{/foreach}

{$lng.lbl_shipping_address}:
-----------------
{if $_userinfo.default_fields.s_title}{$lng.lbl_title|mail_truncate}{$order.s_title}
{/if}
{if $_userinfo.default_fields.s_firstname}{$lng.lbl_first_name|mail_truncate}{$order.s_firstname}
{/if}
{if $_userinfo.default_fields.s_lastname}{$lng.lbl_last_name|mail_truncate}{$order.s_lastname}
{/if}
{if $_userinfo.default_fields.s_address}{$lng.lbl_address|mail_truncate}{$order.s_address}
{/if}
{if $_userinfo.default_fields.s_address_2}{$lng.lbl_address_2|mail_truncate}{$order.s_address_2}
{/if}
{if $_userinfo.default_fields.s_city}{$lng.lbl_city|mail_truncate}{$order.s_city}
{/if}
{if $_userinfo.default_fields.s_county}{if $config.General.use_counties eq "Y"}{$lng.lbl_county|mail_truncate}{$order.s_countyname}{/if} 
{/if}
{if $_userinfo.default_fields.s_state}{$lng.lbl_state|mail_truncate}{$order.s_statename}
{/if}
{if $_userinfo.default_fields.s_country}{$lng.lbl_country|mail_truncate}{$order.s_countryname}
{/if}
{if $_userinfo.default_fields.s_zipcode}{$lng.lbl_zip_code|mail_truncate}{$order.s_zipcode}
{/if}
{foreach from=$_userinfo.additional_fields item=v}{if $v.section eq 'S'}
{$v.title|mail_truncate}{$v.value}
{/if}{/foreach}{assign var="is_header" value=""}
{foreach from=$_userinfo.additional_fields item=v}{if $v.section eq 'A'}
{if $is_header ne 'Y'}

{$lng.lbl_additional_information}:
-----------------
{assign var="is_header" value="Y"}{/if}
{$v.title|mail_truncate}{$v.value}
{/if}{/foreach} 

{if $config.Email.show_cc_info eq "Y" and $show_order_details eq "Y" && $order.details ne ""}
{$lng.lbl_order_payment_details}:
------------------------
{$order.details|order_details_translate|escape}
{if $order.extra.advinfo ne ""}
{$order.extra.advinfo|order_details_translate|escape}
{/if}
{/if}
{if $order.netbanx_reference}
NetBanx Reference: {$order.netbanx_reference}
{/if}


{include file="mail/order_data.tpl"}

{if $order.customer_notes ne ""}
{$lng.lbl_customer_notes}:
------------------------
{$order.customer_notes}
{/if}

