{*
$Id: subscriptions.tpl,v 1.14 2009/04/18 06:33:07 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="page_title.tpl" title=$lng.lbl_subscriptions}

{$lng.txt_subscriptions_top_text}

<br /><br />

{capture name=dialog}

<b>{$lng.txt_note}:</b> {$lng.lbl_order_status_codes}:
<b>Q</b> - {$lng.lbl_queued},
<b>P</b> - {$lng.lbl_processed},
<b>B</b> - {$lng.lbl_backordered},
<b>D</b> - {$lng.lbl_declined},
<b>F</b> - {$lng.lbl_failed},
<b>C</b> - {$lng.lbl_complete}.

<br />

<form method="post" action="orders.php?mode=subscriptions">

<table cellpadding="0" cellspacing="1" width="100%">

<tr class="TableHead">
  <td colspan="2" width="30%">{$lng.lbl_subscription}</td>
  <td width="20%">{$lng.lbl_subscription_date}</td>
  <td width="20%">{$lng.lbl_last_payed_date}</td>
  <td width="20%">{$lng.lbl_next_pay_date}</td>
</tr>

{section name=sub loop=$subscriptions_info}

{if $subscriptions_info[sub].subscription_status ne "Unsubscribed"}

<tr{cycle values=", class='TableSubHead'"}>
  <td><input type="checkbox" name="unsubscribe_info[]" value="{$subscriptions_info[sub].subscriptionid}" /></td>
  <td><a href="product.php?productid={$subscriptions_info[sub].productid}">{$subscriptions_info[sub].product}</a></td>
  <td><a href="order.php?orderid={$subscriptions_info[sub].orderid}">{$subscriptions_info[sub].date} ({$subscriptions_info[sub].status})</a></td>
  <td><a href="order.php?orderid={$subscriptions_info[sub].last_payed_orderid}">{$subscriptions_info[sub].last_payed_date} ({$subscriptions_info[sub].last_payed_orderstatus})</a></td>
  <td>{if $subscriptions_info[sub].subscription_status eq "Active"}{$subscriptions_info[sub].next_pay_date}{else}{$subscriptions_info[sub].subscription_status}{/if}</td>
</tr>

{/if}

{/section}

<tr>
  <td colspan="5" class="SubmitBox"><input type="submit" value="{$lng.lbl_unsubscribe|strip_tags:false|escape}" /></td>
</tr>

</table>

</form>

{/capture}
{include file="dialog.tpl" title=$lng.lbl_subscriptions content=$smarty.capture.dialog extra='width="100%"'}
