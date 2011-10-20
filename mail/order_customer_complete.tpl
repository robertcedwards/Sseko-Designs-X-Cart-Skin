{*
$Id: order_customer_complete.tpl,v 1.12 2009/03/23 13:15:11 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/mail_header.tpl"}


{$lng.eml_dear|substitute:"customer":"`$customer.title` `$customer.firstname` `$customer.lastname`"},

{$lng.eml_order_complete}

{$lng.lbl_order_id|mail_truncate}#{$order.orderid}
{$lng.lbl_order_date|mail_truncate}{$order.date|date_format:$config.Appearance.datetime_format}
{if $order.tracking} 
{$lng.lbl_tracking_number|mail_truncate}{$order.tracking} 
{/if}

{include file="mail/order_data.tpl"}

{include file="mail/signature.tpl"}
