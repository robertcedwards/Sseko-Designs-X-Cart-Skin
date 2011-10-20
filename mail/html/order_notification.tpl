{*
$Id: order_notification.tpl,v 1.7 2009/05/18 08:26:25 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/html/mail_header.tpl"}

<br />{$lng.eml_order_notification|substitute:"orderid":$order.orderid}

{include file="mail/html/order_invoice.tpl"}

{include file="mail/html/signature.tpl"}
