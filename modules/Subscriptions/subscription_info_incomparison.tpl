{*
$Id: subscription_info_incomparison.tpl,v 1.1 2009/01/12 09:46:29 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $subscription}
<br />
{$lng.lbl_price}:
{include file="currency.tpl" value=$product.taxed_price tag_id="product_price"} {$lng.lbl_setup_fee}
      {if $product.taxes}
        {include file="customer/main/taxed_price.tpl" taxes=$product.taxes}
      {else}
        <br />
      {/if}
      + {include file="currency.tpl" value=$subscription.taxed_price_period}
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
{/if}
