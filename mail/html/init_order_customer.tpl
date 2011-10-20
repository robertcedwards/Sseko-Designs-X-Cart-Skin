{*
$Id: init_order_customer.tpl,v 1.12 2009/05/18 08:26:24 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/html/mail_header.tpl"}
<br />{$lng.eml_dear|substitute:"customer":"`$order.title` `$order.firstname` `$order.lastname`"},

<br />{$lng.eml_init_order_customer}

<br />{$lng.lbl_order_details_label}:

<br />
<table cellpadding="2" cellspacing="1">
<tr>
<td width="20%"><b>{$lng.lbl_order_id}:</b></td>
<td width="10">&nbsp;</td>
<td>#{$order.orderid}</td>
</tr>
<tr>
<td><b>{$lng.lbl_order_date}:</b></td>
<td>&nbsp;</td>
<td>{$order.date|date_format:$config.Appearance.datetime_format}</td>
</tr>
<tr>
<td><b>{$lng.lbl_order_status}:</b></td>
<td>&nbsp;</td>
<td>{include file="main/order_status.tpl" mode="static" status=$order.status}</td>
</tr>
</table>

{include file="mail/html/signature.tpl"}
