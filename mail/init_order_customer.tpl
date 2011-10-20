{*
$Id: init_order_customer.tpl,v 1.14 2009/03/23 13:15:07 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/mail_header.tpl"}


{$lng.eml_dear|substitute:"customer":"`$order.title` `$order.firstname` `$order.lastname`"},

{$lng.eml_init_order_customer}

{$lng.lbl_order_details_label}:

{$lng.lbl_order_id|mail_truncate}#{$order.orderid}
{$lng.lbl_order_date|mail_truncate}{$order.date|date_format:$config.Appearance.datetime_format}
{$lng.lbl_order_status|mail_truncate}{include file="main/order_status.tpl" mode="static" status=$order.status}

{include file="mail/signature.tpl"}
