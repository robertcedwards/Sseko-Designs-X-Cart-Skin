{*
$Id: egoods_download_keys.tpl,v 1.18 2009/03/23 13:15:07 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/mail_header.tpl"}


{$lng.eml_dear_customer},

{$lng.eml_egoods}

{$lng.eml_egoods_download}:
--------------------
{section name=prod_num loop=$products}
{if $products[prod_num].download_key}
{$lng.lbl_sku|mail_truncate}{$products[prod_num].productcode}
{$lng.lbl_product|mail_truncate}{$products[prod_num].product}
{$lng.lbl_item_price|mail_truncate}{include file="currency.tpl" value=$products[prod_num].display_price}

{$lng.lbl_filename|mail_truncate}{$products[prod_num].distribution_filename}
{$lng.lbl_download_url|mail_truncate}{$catalogs.customer}/download.php?id={$products[prod_num].download_key}

{/if}
{/section}

{$lng.eml_egoods_download_note|substitute:"ttl":$config.Egoods.download_key_ttl}

{include file="mail/signature.tpl"}
