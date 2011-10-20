{*
$Id: order_updated_customer.tpl,v 1.9 2009/03/23 13:15:11 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/mail_header.tpl"}


{$lng.eml_dear|substitute:"customer":"`$order.title` `$order.firstname` `$order.lastname`"},

{$lng.eml_order_has_been_updated}

{include file="mail/order_invoice.tpl"}

{include file="mail/signature.tpl"}
