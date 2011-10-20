{*
$Id: home_main.tpl,v 1.7 2008/09/22 07:31:18 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $checkout_step eq 0}
{include file="modules/Fast_Lane_Checkout/checkout_0_enter.tpl"}

{elseif $checkout_step eq 1}
{include file="modules/Fast_Lane_Checkout/checkout_1_profile.tpl"}

{elseif $checkout_step eq 2}
{include file="modules/Fast_Lane_Checkout/checkout_2_method.tpl"}

{elseif $checkout_step eq 3}
{include file="modules/Fast_Lane_Checkout/checkout_3_place.tpl"}

{else}

{include file="customer/main/cart.tpl"}

{/if}
