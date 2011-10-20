{*
$Id: send2friend.tpl,v 1.7 2009/03/23 13:15:12 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/mail_header.tpl"}

{$lng.eml_hello}

{$lng.eml_send2friend|substitute:"sender":$name}

{$product.product}
===========================================
{$product.descr}

{$lng.lbl_price}: {include file="currency.tpl" value=$product.taxed_price}


{$lng.eml_click_to_view_product}:

{resource_url type="product" id=$product.productid}

{include file="mail/signature.tpl"}
