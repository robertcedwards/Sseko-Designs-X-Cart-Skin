{*
$Id: order_customer_complete.tpl,v 1.15 2009/05/18 08:26:24 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/html/mail_header.tpl"}

<br />{$lng.eml_dear|substitute:"customer":"`$customer.title` `$customer.firstname` `$customer.lastname`"},

<br />{$lng.eml_order_complete}


<hr size="1" noshade="noshade" />
<br />
<table cellpadding="2" cellspacing="1" width="100%">
<tr>
<td width="20%"><b>{$lng.lbl_order_id}:</b></td>
<td width="10">&nbsp;</td>
<td width="80%"><tt><b>#{$order.orderid}</b></tt></td>
</tr>
<tr>
<td><b>{$lng.lbl_order_date}:</b></td>
<td width="10">&nbsp;</td>
<td><tt><b>{$order.date|date_format:$config.Appearance.datetime_format}</b></tt></td>
</tr>
{if $order.tracking}
<tr>
<td><b>{$lng.lbl_tracking_number}:</b></td>
<td width="10">&nbsp;</td>
<td><tt>{$order.tracking}</tt></td>
</tr>
{/if}
<tr>
  <td colspan="3">{include file="mail/html/order_data.tpl"}</td>
</tr>
</table>

{include file="mail/html/signature.tpl"}

