{*
$Id: order_notification.tpl,v 1.24 2009/03/23 13:15:11 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/mail_header.tpl"}


{$lng.eml_order_notification|substitute:"orderid":$order.orderid}

{include file="mail/order_invoice.tpl"}

{include file="mail/signature.tpl"}
