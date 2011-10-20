{*
$Id: subscription_info.tpl,v 1.14 2009/07/21 13:23:30 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $subscription}
  <tr>
    <td class="property-name product-price">{$lng.lbl_price}:</td>
    <td class="property-value" colspan="2">

      <span class="product-price-value">{include file="currency.tpl" value=$product.taxed_price tag_id="product_price"}</span>
      <span class="product-market-price">{include file="customer/main/alter_currency_value.tpl" alter_currency_value=$product.taxed_price tag_id="product_alt_price"} {$lng.lbl_setup_fee}</span>

      {if $product.taxes}
        {include file="customer/main/taxed_price.tpl" taxes=$product.taxes}
      {else}
        <br />
      {/if}
      + <span class="product-price-value">{include file="currency.tpl" value=$subscription.taxed_price_period}</span>
      <span class="product-market-price">{include file="customer/main/alter_currency_value.tpl" alter_currency_value=$subscription.taxed_price_period}</span>
       / 
      {if $subscription.pay_period_type eq "Monthly"}
        {$lng.lbl_month}
      {elseif $subscription.pay_period_type eq "Annually"}
        {$lng.lbl_year}
      {elseif $subscription.pay_period_type eq "Weekly"}
        {$lng.lbl_week}
      {elseif $subscription.pay_period_type eq "Quarterly"}
        {$lng.lbl_quarter}
      {elseif $subscription.pay_period_type eq "By Period"}
        {$pay_period} {$lng.lbl_days}
      {/if}

      {if $subscription.taxes}
        {include file="customer/main/taxed_price.tpl" taxes=$subscription.taxes is_subtax=true}
      {/if}

    </td>
  </tr>
{/if}
