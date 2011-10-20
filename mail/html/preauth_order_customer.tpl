{*
$Id: preauth_order_customer.tpl,v 1.1 2009/10/22 13:50:47 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/html/mail_header.tpl"}

<br />{$lng.eml_dear|substitute:"customer":"`$order.title` `$order.firstname` `$order.lastname`"},

<br />{$lng.eml_thankyou_for_order}

<br /><b>{$lng.lbl_invoice}:</b>

<br />{include file="mail/html/order_invoice.tpl"}

{include file="mail/html/signature.tpl"}
