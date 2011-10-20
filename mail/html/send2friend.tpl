{*
$Id: send2friend.tpl,v 1.7 2008/08/21 09:52:50 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/html/mail_header.tpl"}
{$lng.eml_hello}<br />
<br />
{$lng.eml_send2friend|substitute:"sender":$name}<br />
<br />
{$product.product}<br />
<hr />
{$product.descr}<br />
<br />
{$lng.lbl_price}: {include file="currency.tpl" value=$product.taxed_price}<br />
<br />
<br />
{$lng.eml_click_to_view_product}:<br />
<a href="{$catalogs.customer}/product.php?productid={$product.productid}">{resource_url type="product" id=$product.productid}</a><br />
<br />
{include file="mail/html/signature.tpl"}
