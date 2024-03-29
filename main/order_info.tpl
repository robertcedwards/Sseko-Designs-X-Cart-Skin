{*
$Id: order_info.tpl,v 1.48 2009/09/07 09:20:42 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="main/subheader.tpl" title=$lng.lbl_products_info}

<table cellspacing="0" cellpadding="0" width="100%">

{section name=prod_num loop=$products}

{if $products[prod_num].deleted eq "" and ($active_modules.Product_Configurator eq "" or $products[prod_num].extra_data.pconf.parent eq "")}
<tr> 
  <td colspan="2" valign="top" class="ProductTitle{if $products[prod_num].is_deleted eq "Y"}Hidden{/if}">
    {if $current_membership_flag ne 'FS' and $products[prod_num].is_deleted ne "Y"}<a href="product_modify.php?productid={$products[prod_num].productid}" target="viewproduct{$products[prod_num].productid}">{/if}#{$products[prod_num].productid}. {$products[prod_num].product}{if $current_membership_flag ne 'FS' and $products[prod_num].is_deleted ne "Y"}</a>{/if}
    {if $products[prod_num].is_deleted eq "Y"}
      &nbsp;&nbsp;&nbsp;<font class="ErrorMessage">[{$lng.lbl_aom_removed}]</font>
    {/if}
  </td>
</tr>

{if $active_modules.Gift_Registry}
{include file="modules/Gift_Registry/product_event.tpl" product=$products[prod_num]}
{/if}

{if $active_modules.Product_Configurator ne "" and $products[prod_num].extra_data.pconf.cartid ne ""}
<tr> 
  <td colspan="2">/ {$lng.lbl_pconf_composite_product} /</td>
</tr>
{/if}

<tr> 
  <td valign="top">&nbsp;</td>
  <td valign="top">&nbsp;</td>
</tr>

<tr> 
  <td valign="top">{$lng.lbl_sku}</td>
  <td valign="top">{$products[prod_num].productcode|default:"-"}</td>
</tr>

{if $usertype ne "C"}
<tr>
  <td valign="top">{$lng.lbl_provider}</td>
  <td valign="top">{$products[prod_num].provider}</td>
</tr>
{/if}

<tr> 
  <td valign="top">{$lng.lbl_price}{if $products[prod_num].product_type eq "C" and $products[prod_num].display_price lt 0} {$lng.lbl_pconf_discounted}{/if}</td>
  <td valign="top">{include file="currency.tpl" value=$products[prod_num].display_price display_sign=$products[prod_num].price_show_sign}</td>
</tr>

{if $customer.tax_exempt ne "Y" and $order.extra.tax_info.display_cart_products_tax_rates eq "Y" and ($products[prod_num].product_type ne "C" or $products[prod_num].display_price gt 0)}
<tr>
  <td valign="top" style="padding-left: 15px;">{$lng.lbl_including}</td>
  <td style="white-space: nowrap;">
{foreach from=$products[prod_num].extra_data.taxes item=tax}
{if $tax.tax_value gt 0}
{if $cart.product_tax_name eq ""}{$tax.tax_display_name}: {/if}
{if $tax.rate_type eq "%"}{$tax.rate_value}%{else}{include file="currency.tpl" value=$tax.rate_value}{/if}<br />
{/if}
{/foreach}
  </td>
</tr> 
{/if}

<tr> 
  <td valign="top">{$lng.lbl_quantity}</td>
  <td valign="top">{$lng.lbl_n_items|substitute:"items":$products[prod_num].amount}</td>
</tr>

{if $products[prod_num].product_options ne "" && $active_modules.Product_Options ne ''}
<tr> 
  <td valign="top">{$lng.lbl_selected_options}</td>
  <td valign="top">{include file="modules/Product_Options/display_options.tpl" options=$products[prod_num].product_options options_txt=$products[prod_num].product_options_txt force_product_options_txt=$products[prod_num].force_product_options_txt}</td>
</tr>
{/if}

{if $active_modules.Egoods and $products[prod_num].download_key and ($order.status eq "P" or $order.status eq "C")}
<tr>
  <td colspan="2">{$lng.lbl_download_link}:<br /><a href="{$catalogs.customer}/download.php?id={$products[prod_num].download_key}" target="_blank">{$catalogs.customer}/download.php?id={$products[prod_num].download_key}</a></td>
</tr>

<tr>
  <td>{$lng.lbl_download_link_expires}:</td>
  <td>{$products[prod_num].expires|date_format:$config.Appearance.datetime_format}</td>
</tr>
{/if}

{if $active_modules.RMA && $current_membership_flag ne 'FS'}
{include file="modules/RMA/item_returns.tpl" product=$products[prod_num]}
{/if}

<tr> 
  <td valign="top" class="ProductDetails" height="14">&nbsp;</td>
  <td valign="top" class="ProductDetails" height="14">&nbsp;</td>
</tr>
{/if}

{if $active_modules.Product_Configurator ne "" and $products[prod_num].extra_data.pconf.cartid ne ""}
{include file="modules/Product_Configurator/pconf_order_info.tpl" cartid=$products[prod_num].extra_data.pconf.cartid}
{/if}
{/section}

{section name=giftcert loop=$giftcerts}
{if $giftcerts[giftcert].deleted eq ""}
<tr> 
  <td colspan="2" valign="top" class="ProductTitle">{$lng.lbl_gift_certificate}</td>
</tr>

<tr> 
  <td valign="top" colspan="2">&nbsp;</td>
</tr>

<tr> 
  <td valign="top">{$lng.lbl_gc_id}</td>
  <td valign="top">{$giftcerts[giftcert].gcid}</td>
</tr>

<tr>
  <td valign="top">{$lng.lbl_amount}</td>
  <td valign="top">{include file="currency.tpl" value=$giftcerts[giftcert].amount}</td>
</tr>

<tr> 
  <td valign="top">{$lng.lbl_recipient}</td>
  <td valign="top">{$giftcerts[giftcert].recipient}</td>
</tr>

{if $giftcerts[giftcert].send_via eq "P"}
<tr>
  <td colspan="2">{$lng.lbl_gc_send_via_postal_mail}</td>
</tr>

<tr>
  <td valign="top" class="LabelStyle">{$lng.lbl_mail_address}</td>
  <td valign="top">
{$giftcerts[giftcert].recipient_firstname} {$giftcerts[giftcert].recipient_lastname}<br />
{$giftcerts[giftcert].recipient_address} {$giftcerts[giftcert].recipient_address_2}, {$giftcerts[giftcert].recipient_city},<br />
{if $giftcerts[giftcert].recipient_countyname ne ''}{$giftcerts[giftcert].recipient_countyname} {/if} {$giftcerts[giftcert].recipient_state} {$giftcerts[giftcert].recipient_country}, {$giftcerts[giftcert].recipient_zipcode}
  </td>
</tr>

<tr>
  <td valign="top" class="LabelStyle">{$lng.lbl_phone}</td>
  <td valign="top">{$giftcerts[giftcert].recipient_phone}</td>
</tr>

{else}

<tr> 
  <td valign="top">{$lng.lbl_recipient_email}</td>
  <td valign="top">{$giftcerts[giftcert].recipient_email}</td>
</tr>
{/if}

<tr> 
  <td valign="top" colspan="2" class="ProductDetails" height="14">&nbsp;</td>
</tr>
{/if}
{/section}

<tr>
  <td colspan="2">{include file="main/subheader.tpl" title=$lng.lbl_order_info}</td>
</tr>

<tr> 
  <td valign="top">{$lng.lbl_payment_method}</td>
  <td valign="top">{$order.payment_method}</td>
</tr>

<tr> 
  <td valign="top">{$lng.lbl_delivery}</td>
  <td valign="top">
{$order.shipping|trademark}
{if $order.extra.shipping_warning ne ''}<br /><font class="ErrorMessage">{$order.extra.shipping_warning}</font>{/if}
{if $order.extra.dhl_ext_country}<br />{$lng.lbl_dhl_ext_country}: {$order.extra.dhl_ext_country}{/if}
  </td>
</tr>

<tr>
  <td valign="top">{$lng.lbl_subtotal}</td>
  <td valign="top">{include file="currency.tpl" value=$order.display_subtotal}</td>
</tr>

<tr>
  <td valign="top">{$lng.lbl_discount}</td>
  <td valign="top">{include file="currency.tpl" value=$order.discount}</td>
</tr>

{if $order.coupon_type ne "free_ship"}
<tr>
  <td valign="top">{$lng.lbl_coupon_saving}</td>
  <td valign="top">{include file="currency.tpl" value=$order.coupon_discount} ({$order.coupon})</td>
</tr>
{/if}

{if $order.discounted_subtotal ne $order.subtotal}
<tr>
  <td valign="top">{$lng.lbl_discounted_subtotal}</td>
  <td valign="top">{include file="currency.tpl" value=$order.display_discounted_subtotal}</td>
</tr>
{/if}

<tr>
  <td valign="top">{$lng.lbl_shipping_cost}</td>
  <td valign="top">
{if $order.coupon and $order.coupon_type eq "free_ship"}
{include file="currency.tpl" value=0}&nbsp;({$lng.lbl_free_ship_coupon_record|substitute:"code":$order.coupon})
{else}
{include file="currency.tpl" value=$order.display_shipping_cost}
{/if}
  </td>
</tr>

{if $active_modules.Gift_Registry and $order.need_giftwrap eq "Y"}
  {include file="modules/Gift_Registry/gift_wrapping_order.tpl"}
{/if}

{if $order.applied_taxes and $order.extra.tax_info.display_taxed_order_totals ne "Y"}
{foreach item=tax from=$order.applied_taxes}
<tr>
  <td valign="top">{$tax.tax_display_name}</td>
  <td valign="top">{include file="currency.tpl" value=$tax.tax_cost}</td>
</tr>
{/foreach}
{/if}

{if $order.payment_surcharge ne 0}
<tr>
  <td valign="top" class="LabelStyle" nowrap="nowrap">{if $order.payment_surcharge gt 0}{$lng.lbl_payment_method_surcharge}{else}{$lng.lbl_payment_method_discount}{/if}</td>
  <td valign="top">{include file="currency.tpl" value=$order.payment_surcharge}</td>
</tr>
{/if}

{if $order.giftcert_discount gt 0}
<tr>
  <td valign="top" class="LabelStyle" nowrap="nowrap">{$lng.lbl_giftcert_discount}</td>
  <td valign="top">{include file="currency.tpl" value=$order.giftcert_discount}</td>
</tr>
{/if}

<tr>
  <td valign="top"><b style="text-transform: uppercase;">{$lng.lbl_total}</b></td>
  <td valign="top"><b>{include file="currency.tpl" value=$order.total}</b></td>
</tr>

{if $customer.tax_exempt ne "Y"}

{if $order.applied_taxes and $order.extra.tax_info.display_taxed_order_totals eq "Y"}
{foreach item=tax from=$order.applied_taxes}
<tr>
  <td valign="top" style="padding-left: 10px;">{$lng.lbl_including_tax|substitute:"tax":$tax.tax_display_name}</td>
  <td valign="top">{include file="currency.tpl" value=$tax.tax_cost}</td>
</tr>
{/foreach}
{/if}

{section name=rn loop=$order.reg_numbers}
{if %rn.first%}
<tr>
  <td valign="top" colspan="2" class="LabelStyle" nowrap="nowrap">{$lng.lbl_registration_number}:</td>
</tr>
{/if}

<tr>
  <td valign="top" colspan="2" nowrap="nowrap">&nbsp;&nbsp;{$order.reg_numbers[rn]}</td>
</tr>
{/section}

{else}  {* if $customer.tax_exempt eq "Y" *}

<tr>
  <td valign="top" colspan="2" class="LabelStyle" nowrap="nowrap"><br />{$lng.txt_tax_exemption_applied}</td>
</tr>

{/if}

<tr> 
  <td valign="top" colspan="2" class="ProductDetails" height="14">&nbsp;</td>
</tr>

{if $order.applied_giftcerts}
<tr>
  <td colspan="2" class="LabelStyle">{$lng.lbl_applied_giftcerts}:</td>
</tr>

{foreach from=$order.applied_giftcerts item=gc}
<tr>
  <td valign="top" style="padding-left: 10px;">
{strip}
{if ($usertype eq 'A' && $current_membership_flag ne 'FS') || ($usertype eq 'P' && $active_modules.Simple_Mode)}<a href="giftcerts.php?mode=modify_gc&amp;gcid={$gc.giftcert_id}">{/if}
{$gc.giftcert_id}
{if $usertype eq 'A' || ($usertype eq 'P' && $active_modules.Simple_Mode)}</a>{/if}:
{/strip}
  </td>
  <td valign="top">{include file="currency.tpl" value=$gc.giftcert_cost}</td>
</tr>
{/foreach}

<tr>
  <td colspan="2" height="10">&nbsp;</td>
</tr>
{/if}

{if $order.extra.special_bonuses ne ""}
{include file="modules/Special_Offers/order_bonuses.tpl" bonuses=$order.extra.special_bonuses}
{/if}

{if $active_modules.Gift_Registry and $order.need_giftwrap eq "Y"}
{include file="modules/Gift_Registry/gift_wrapping_order_note.tpl"}
{/if}

<tr>
  <td colspan="2">{include file="main/subheader.tpl" title=$lng.lbl_customer_info}</td>
</tr>

<tr valign="top">
  <td colspan="2"><i>{$lng.lbl_personal_information}:</i></td>
</tr>

{if $usertype eq 'A' || ($usertype eq 'P' && $active_modules.Simple_Mode)}
<tr valign="top"> 
  <td>&nbsp;&nbsp;{$lng.lbl_username}</td>
  <td>
    {if (($usertype eq 'A' && $current_membership_flag ne 'FS') || ($usertype eq 'P' && $active_modules.Simple_Mode)) && 
        ($customer.existing_login)}
      <a href="user_modify.php?user={$customer.login|escape:"url"}&amp;usertype=C" title="{$lng.lbl_modify_profile|escape}" target="_blank">{$customer.login}</a>
    {else}
      {$customer.login}{if not $customer.existing_login} <font class="Star">({$lng.lbl_deleted})</font>{/if}
    {/if}
  </td>
</tr>
{/if}

{if $customer.default_fields.title}
<tr valign="top"> 
  <td>&nbsp;&nbsp;{$lng.lbl_title}</td>
  <td>{$customer.title}</td>
</tr>

{/if}
{if $customer.default_fields.firstname}
<tr valign="top"> 
  <td>&nbsp;&nbsp;{$lng.lbl_first_name}</td>
  <td>{$customer.firstname}</td>
</tr>

{/if}
{if $customer.default_fields.lastname}
<tr valign="top"> 
  <td>&nbsp;&nbsp;{$lng.lbl_last_name}</td>
  <td>{$customer.lastname}</td>
</tr>

{/if} 
{if $customer.default_fields.company}
<tr valign="top"> 
  <td>&nbsp;&nbsp;{$lng.lbl_company}</td>
  <td>{$customer.company}</td>
</tr>
{/if}
{if $customer.default_fields.ssn}
<tr valign="top">
    <td>&nbsp;&nbsp;{$lng.lbl_ssn}</td>
    <td>{$customer.ssn}</td>
</tr>
{/if}
{if $customer.default_fields.tax_number}
<tr valign="top"> 
  <td>&nbsp;&nbsp;{$lng.lbl_tax_number}</td>
  <td>{$customer.tax_number}</td>
</tr>
{/if}
{foreach from=$customer.additional_fields item=v}
{if $v.section eq 'P'}
<tr valign="top">
  <td>&nbsp;&nbsp;{$v.title}</td>
     <td>{$v.value}</td>
</tr>
  {/if}
{/foreach}

<tr valign="top">
  <td colspan="2"><i>{$lng.lbl_billing_address}:</i></td>
</tr>

{if $customer.default_fields.b_title}
<tr valign="top">
  <td>&nbsp;&nbsp;{$lng.lbl_title}</td>
  <td>{$customer.b_title}</td>
</tr>

{/if}
{if $customer.default_fields.b_firstname}
<tr valign="top"> 
  <td>&nbsp;&nbsp;{$lng.lbl_first_name}</td>
  <td>{$customer.b_firstname}</td>
</tr>

{/if} 
{if $customer.default_fields.b_lastname}
<tr valign="top"> 
  <td>&nbsp;&nbsp;{$lng.lbl_last_name}</td>
  <td>{$customer.b_lastname}</td>
</tr>

{/if} 
{if $customer.default_fields.b_address}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_address}</td>
  <td valign="top">{$customer.b_address}</td>
</tr>

{/if} 
{if $customer.default_fields.b_address_2}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_address_2}</td>
  <td valign="top">{$customer.b_address_2}</td>
</tr>

{/if} 
{if $customer.default_fields.b_city}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_city}</td>
  <td valign="top">{$customer.b_city}</td>
</tr>

{/if} 
{if $customer.default_fields.b_county && $config.General.use_counties eq 'Y'}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_county}</td>
  <td valign="top">{$customer.b_countyname}</td>
</tr>

{/if} 
{if $customer.default_fields.b_state}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_state}</td>
  <td valign="top">{$customer.b_statename}</td>
</tr>

{/if} 
{if $customer.default_fields.b_zipcode}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_zip_code}</td>
  <td valign="top">{$customer.b_zipcode}</td>
</tr>

{/if} 
{if $customer.default_fields.b_country}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_country}</td>
  <td valign="top">{$customer.b_countryname}</td>
</tr>
{/if}
{foreach from=$customer.additional_fields item=v}
{if $v.section eq 'B'}
<tr valign="top">
  <td>&nbsp;&nbsp;{$v.title}</td>
     <td>{$v.value}</td>
</tr>
  {/if}
{/foreach}

<tr valign="top">
  <td colspan="2"><i>{$lng.lbl_shipping_address}:</i></td>
</tr>

{if $customer.default_fields.s_title}
<tr valign="top">
  <td>&nbsp;&nbsp;{$lng.lbl_title}</td>
  <td>{$customer.s_title}</td>
</tr>

{/if}
{if $customer.default_fields.s_firstname}
<tr valign="top"> 
  <td>&nbsp;&nbsp;{$lng.lbl_first_name}</td>
  <td>{$customer.s_firstname}</td>
</tr>

{/if} 
{if $customer.default_fields.s_lastname}
<tr valign="top"> 
  <td>&nbsp;&nbsp;{$lng.lbl_last_name}</td>
  <td>{$customer.s_lastname}</td>
</tr>

{/if} 
{if $customer.default_fields.s_address}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_address}</td>
  <td valign="top">{$customer.s_address}</td>
</tr>

{/if} 
{if $customer.default_fields.s_address_2}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_address_2}</td>
  <td valign="top">{$customer.s_address_2}</td>
</tr>

{/if} 
{if $customer.default_fields.s_city}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_city}</td>
  <td valign="top">{$customer.s_city}</td>
</tr>

{/if} 
{if $customer.default_fields.s_county && $config.General.use_counties eq 'Y'}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_county}</td>
  <td valign="top">{$customer.s_countyname}</td>
</tr>

{/if} 
{if $customer.default_fields.s_state}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_state}</td>
  <td valign="top">{$customer.s_statename}</td>
</tr>

{/if} 
{if $customer.default_fields.s_zipcode}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_zip_code}</td>
  <td valign="top">{$customer.s_zipcode}</td>
</tr>

{/if} 
{if $customer.default_fields.s_country}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_country}</td>
  <td valign="top">{$customer.s_countryname}</td>
</tr>
{/if}
{foreach from=$customer.additional_fields item=v}
{if $v.section eq 'S'}
<tr valign="top">
  <td>&nbsp;&nbsp;{$v.title}</td>
  <td>{$v.value}</td>
</tr>
  {/if}
{/foreach}

<tr valign="top">
  <td colspan="2"><i>{$lng.lbl_contact_information}:</i></td>
</tr>

{if $customer.default_fields.phone}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_phone}</td>
  <td valign="top">{$customer.phone}</td>
</tr>

{/if} 
{if $customer.default_fields.fax}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_fax}</td>
  <td valign="top">{$customer.fax}</td>
</tr>

{/if} 
{if $customer.default_fields.url}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_web_site}</td>
  <td valign="top">{if $customer.url neq ""}<a href="{$customer.url}">{$customer.url}</a>{/if}</td>
</tr>

{/if} 
{if $customer.default_fields.email}
<tr> 
  <td valign="top">&nbsp;&nbsp;{$lng.lbl_email}</td>
  <td valign="top"><a href="mailto:{$customer.email}">{$customer.email}</a></td>
</tr>
{/if}
{foreach from=$customer.additional_fields item=v}
{if $v.section eq 'C'}
<tr valign="top">
  <td>&nbsp;&nbsp;{$v.title}</td>
  <td>{$v.value}</td>
</tr>
  {/if}
{/foreach}

{assign var="is_header" value=""}
{foreach from=$customer.additional_fields item=v}
{if $v.section eq 'A'}
{if $is_header ne 'Y'}
<tr valign="top">
  <td colspan="2"><i>{$lng.lbl_additional_information}:</i></a></td>
</tr>
{assign var="is_header" value="Y"}
{/if}
<tr valign="top">
  <td>&nbsp;&nbsp;{$v.title}</td>
  <td>{$v.value}</td>
</tr>
{/if}
{/foreach}

<tr> 
  <td colspan="2" valign="top" height="10">&nbsp;</td>
</tr>

</table>

{if $shop_language ne $customer.language}
<p>
<b>{$lng.lbl_note}:</b> {$lng.txt_different_order_language_note|substitute:"language":$all_language_names[$customer.language]}
</p>
{/if}
