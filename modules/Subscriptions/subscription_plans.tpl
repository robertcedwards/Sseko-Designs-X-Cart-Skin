{*
$Id: subscription_plans.tpl,v 1.20 2009/04/18 06:33:07 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $active_modules.Subscriptions ne ""}

<br />

{$lng.txt_subscription_for_product}

<br /><br />

{capture name=dialog}

<form action="product_modify.php" method="post" name="subscription_form">
<input type="hidden" name="mode" value="subscription_modify" />
<input type="hidden" name="productid" value="{$product.productid}" />
<input type="hidden" name="geid" value="{$geid}" />

<table cellspacing="0" cellpadding="3" width="100%">

<tr class="TableHead">
{if $geid ne ''}<td width="15" class="TableSubHead">&nbsp;</td>{/if}
<td width="30%" nowrap="nowrap" class="DataTable">{$lng.lbl_pay_period}</td>
<td width="25%" nowrap="nowrap" class="DataTable">{$lng.lbl_period_fee} ({$config.General.currency_symbol})</td>
<td width="25%" nowrap="nowrap" class="DataTable">{$lng.lbl_cost_of_one_day} ({$config.General.currency_symbol})</td>
<td width="25%" nowrap="nowrap">{$lng.lbl_days_same_period}</td>
</tr>

<tr>
  {if $geid ne ''}<td width="15" class="TableSubHead"><input id="fields_subscription" type="checkbox" value="Y" name="fields[subscription]" /></td>{/if}
  <td valign="top" class="DataTable">
<select name="subscription[pay_period_type]" onchange="{literal}if (this.selectedIndex == 4) { this.form.pay_period.disabled = false; this.form.pay_period.focus(); }else{ this.form.pay_period.disabled = true; }{/literal}" style="width: 100%;">
{foreach key=key item=item from=$subscription_periods}
<option value="{$key}"{if $key eq $subscription.pay_period_type} selected="selected"{/if}>{$key}</option>
{/foreach}
</select></td>
  <td valign="top" class="DataTable"><input type="text" name="subscription[price_period]" value="{$subscription.price_period|escape}" size="15" style="width:100%" /></td>
  <td valign="top" class="DataTable"><input type="text" name="subscription[oneday_price]" value="{$subscription.oneday_price|escape}" size="15" style="width:100%" /></td>
  <td valign="top"><input type="text" name="subscription[days_as_period]" value="{$subscription.days_as_period|escape}" size="15" style="width:100%" /></td>
</tr>
<tr>
  {if $geid ne ''}<td width="15" class="TableSubHead">&nbsp;</td>{/if}
  <td nowrap="nowrap"><input type="text" name="pay_period" size="12" value="{$pay_period|escape}"{if $subscription.pay_period_type ne "By Period"} disabled="disabled"{/if} style="width:80%" />&nbsp;{$lng.lbl_days}</td>
  <td colspan="3">&nbsp;</td>
</tr>

<tr>
  {if $geid ne ''}<td width="15" class="TableSubHead">&nbsp;</td>{/if}
  <td colspan="4"><br />
<input type="submit" value="{$lng.lbl_apply|strip_tags:false|escape}" />
{if $subscription.pay_period_type}
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="{$lng.lbl_delete|strip_tags:false|escape}" onclick="javascript: this.form.mode.value='subscription_delete'; this.form.submit();" />
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="{$lng.lbl_pay_dates|strip_tags:false|escape}" onclick="javascript:window.open('calendar.php?productid={$product.productid}{$redirect_geid}','calendar','width=600,height=500,toolbar=no,status=no,scrollbars=yes,resizable=no,menubar=no,location=no,direction=no');" />
{/if}
</td>
</tr>

</table>
</form>

{/capture}
{include file="dialog.tpl" title=$lng.lbl_subscription content=$smarty.capture.dialog extra='width="100%"'}
{/if}
