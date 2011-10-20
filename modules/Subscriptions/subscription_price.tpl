{*
$Id: subscription_price.tpl,v 1.8 2009/04/18 06:33:07 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $subscription}
<tr>
  <td>{$lng.lbl_subscription_plan}:</td>
  <td>
{multi x=$subscription.oneday_price y=$subscription.days_remain assign="subprice"}
<font class="ProductPrice">{include file="currency.tpl" value=$subprice}</font><font class="MarketPrice"> {include file="customer/main/alter_currency_value.tpl" alter_currency_value=$subprice}</font>
  </td>
</tr>

<tr>
  <td><b><font style="TEXT-TRANSFORM: uppercase;">{$lng.lbl_total}:</font></b></td>
  <td>
{inc value=$product.price inc=$subprice assign="totalprice"}
<font class="ProductPrice">{include file="currency.tpl" value=$totalprice}</font><font class="MarketPrice"> {include file="customer/main/alter_currency_value.tpl" alter_currency_value=$totalprice}</font>
  </td>
</tr>
{/if}
