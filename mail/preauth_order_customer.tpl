{*
$Id: preauth_order_customer.tpl,v 1.1 2009/10/22 13:50:47 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/mail_header.tpl"}


{$lng.eml_dear|substitute:"customer":"`$order.title` `$order.firstname` `$order.lastname`"},

{$lng.eml_thankyou_for_order}

{$lng.lbl_invoice}:

{include file="mail/order_invoice.tpl"}

{include file="mail/signature.tpl"}
