{*
$Id: subscription_info_inlist.tpl,v 1.15 2009/04/18 06:33:07 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $product.catalogprice gt 0 || $product.sub_priceplan gt 0}

<div>
  <span class="subscriptions-product-price">{$lng.lbl_price}:</span>
  <span class="subscriptions-product-price-value">
    {include file="currency.tpl" value=$product.catalogprice}
  </span>
  {include file="customer/main/alter_currency_value.tpl" alter_currency_value=$product.catalogprice} {$lng.lbl_setup_fee}

{if $product.taxes}
  <div class="taxes">
    {include file="customer/main/taxed_price.tpl" taxes=$product.taxes}
  </div>
{/if}
 + 
<span class="subscriptions-product-price-value">
{include file="currency.tpl" value=$product.sub_priceplan}
</span>

{include file="customer/main/alter_currency_value.tpl" alter_currency_value=$product.sub_priceplan}
 / 
{if $product.sub_plan eq "Monthly"}
{$lng.lbl_month}
{elseif $product.sub_plan eq "Annually"}
{$lng.lbl_year}
{elseif $product.sub_plan eq "Weekly"}
{$lng.lbl_week}
{elseif $product.sub_plan eq "Quarterly"}
{$lng.lbl_quarter}
{elseif $product.sub_plan eq "By Period"}
{$product.sub_pay_period} {$lng.lbl_days}
{/if}

{if $product.subscription.taxes}
  <div class="taxes">
    {include file="customer/main/taxed_price.tpl" taxes=$product.subscription.taxes is_subtax=true}
  </div>
{/if}
</div>

{/if}
