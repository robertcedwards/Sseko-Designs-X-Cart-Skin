{*
$Id: decline_notification.tpl,v 1.21 2009/03/23 13:15:07 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/mail_header.tpl"}

{$lng.eml_dear|substitute:"customer":"`$customer.title` `$customer.firstname` `$customer.lastname`"},

{$lng.eml_order_declined}

{$lng.lbl_order_id|mail_truncate}#{$order.orderid}
{$lng.lbl_order_date|mail_truncate}{$order.date|date_format:$config.Appearance.datetime_format}

{include file="mail/order_data.tpl"}

{include file="mail/signature.tpl"}
