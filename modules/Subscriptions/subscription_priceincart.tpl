{*
$Id: subscription_priceincart.tpl,v 1.13 2009/05/27 14:33:46 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<table cellpadding="1" cellspacing="2">

  <tr>
    <td>{$lng.lbl_subscription_plan}:</td>
    <td>&nbsp;</td>
    <td>
      {$product.sub_plan}
      {if $product.sub_plan eq "By Period"}
        ({$product.sub_days_remain} {$lng.lbl_days})
      {/if}
    </td>
  </tr>

  {if $product.sub_onedayprice gt 0}
    <tr>
      <td>{$lng.lbl_day_cost_by_subscr_plan}:</td>
      <td>&nbsp;</td>
      <td>{include file="currency.tpl" value=$product.sub_onedayprice}</td>
    </tr>
  {/if}

  {if $product.sub_days_remain gt 0}
    <tr>
      <td>{$lng.lbl_days_remain}:</td>
      <td>&nbsp;</td>
      <td>{$product.sub_days_remain}</td>
    </tr>
  {/if}

</table>
<br />

{if $product.sub_onedayprice gt 0 && $product.sub_days_remain gt 0}
  <font class="ProductPriceConverting">
    ({include file="currency.tpl" value=$product.catalogprice} + {include file="currency.tpl" value=$product.sub_onedayprice} x {$product.sub_days_remain}) x {$product.amount} =
  </font>
  <font class="ProductPrice">
    {assign var=unformatted value=$product.sub_days_remain|multi:$product.sub_days_remain|inc:$product.catalogprice|multi:$product.amount}{include file="currency.tpl" value=$unformatted}
  </font>
  <font class="MarketPrice">
    {include file="customer/main/alter_currency_value.tpl" alter_currency_value=$unformatted}
  </font> 
{else}
  {assign var="price" value=$product.taxed_price}
  <font class="ProductPriceConverting">
    {include file="currency.tpl" value=$product.catalogprice} x {$product.amount} = 
  </font>
  <font class="ProductPrice">
    {multi x=$price y=$product.amount format="%.2f" assign=unformatted}{include file="currency.tpl" value=$unformatted}
  </font>
  <font class="MarketPrice">
    {include file="customer/main/alter_currency_value.tpl" alter_currency_value=$unformatted}
  </font> 
{/if}
