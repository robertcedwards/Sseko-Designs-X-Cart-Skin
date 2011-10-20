{*
$Id: anonymous_checkout.tpl,v 1.28 2009/10/30 08:58:06 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

{capture name=checkout_dialog}
<form action="cart.php" method="post" name="cartform">
  <input type="hidden" name="cart_operation" value="cart_operation" />

{if $config.Appearance.show_cart_details eq "Y" || ($config.Appearance.show_cart_details eq "L" && $smarty.get.paymentid ne "" && $smarty.get.mode eq "checkout")}
  {include file="customer/main/cart_details.tpl"}
{else}
  {include file="customer/main/cart_contents.tpl"}
{/if}

  <hr />

  {include file="customer/main/cart_totals.tpl"}

  <div class="button-row">
    {include file="customer/buttons/update.tpl" type="input"}
  </div>

</form>
{/capture}
{assign var="title" value=$lng.lbl_checkout_step_x_of_y|substitute:"X":$checkout_step:"Y":$total_checkout_steps}
{include file="customer/dialog.tpl" content=$smarty.capture.checkout_dialog}

{if $paypal_express_active}
  {include file="payments/ps_paypal_pro_express_checkout.tpl"}
{/if}

<div class="text-block">{$lng.txt_register_have_account}</div>

{include file="customer/main/register.tpl"}
