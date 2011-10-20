{*
$Id: checkout.tpl,v 1.90 2009/07/22 06:06:54 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<h1>{$lng.lbl_checkout_step_x_of_y|substitute:"X":$checkout_step:"Y":$total_checkout_steps}</h1>
{capture name=checkout_dialog}
  <form action="cart.php" method="post" name="cartform">
    <input type="hidden" name="cart_operation" value="cart_operation" />
    {if $config.Appearance.show_cart_details eq "Y" || ($config.Appearance.show_cart_details eq "L" && $smarty.get.paymentid ne "" && $smarty.get.mode eq "checkout")} 
      {include file="customer/main/cart_details.tpl"}
    {else}
      {include file="customer/main/cart_contents.tpl"}
    {/if}
    <hr />
    <div class="button-row checkout-update-button">
      {include file="customer/buttons/update.tpl" type="input"}
    </div>
    {include file="customer/main/cart_totals.tpl"}
  </form>
{/capture}
{include file="customer/dialog.tpl" content=$smarty.capture.checkout_dialog noborder=true}
{if $smarty.get.mode eq "auth"}
  {include file="customer/main/error_login.tpl"}
{/if}
{if $payment_data.payment_method ne ""}
  <h4>{$lng.lbl_payment_method}: {$payment_data.payment_method}</h4>
  {capture name=dialog}
    <form action="{$payment_data.payment_script_url}" method="post" name="checkout_form" onsubmit="javascript: return checkCheckoutForm();">
      <input type="hidden" name="paymentid" value="{$payment_data.paymentid}" />
      <input type="hidden" name="action" value="place_order" />
      <input type="hidden" name="{$XCARTSESSNAME}" value="{$XCARTSESSID}" />
      <input type="hidden" name="payment_method" value="{$payment_data.payment_method_orig|escape}" />
      {include file="customer/main/customer_details.tpl"}
      {if $paypal_express_active}
        &nbsp;&nbsp;&nbsp;&nbsp;
        {include file="payments/ps_paypal_pro_express_checkout.tpl" paypal_express_link="return"}
        {if $ignore_payment_method_selection eq ""}
          <div class="button-row">
            {include file="customer/buttons/button.tpl" button_title=$lng.lbl_change_payment_method href="cart.php?mode=checkout" style="link"}
          </div>
        {/if}
      {else}
        <div class="buttons-row">
          {include file="customer/buttons/modify.tpl" href="register.php?mode=update&action=cart&paymentid=`$smarty.get.paymentid`" style="link"}
          {if $ignore_payment_method_selection eq ""}
            <div class="button-separator"></div>
            {include file="customer/buttons/button.tpl" button_title=$lng.lbl_change_payment_method href="cart.php?mode=checkout" style="link"}
          {/if}
        </div>
      {/if}
      <div class="clearing"></div>
<script type="text/javascript">
<!--
requiredFields = [];
-->
</script>
      {include file="check_required_fields_js.tpl" use_email_validation="N"}
      {if $payment_data.payment_template ne ""}
        {include file=$payment_data.payment_template}
      {/if}
      {if $payment_cc_data.cmpi eq 'Y' && $config.CMPI.cmpi_enabled eq 'Y'}
        {include file="main/cmpi.tpl"}
      {/if}
      {include file="customer/main/checkout_notes.tpl"}
      <div class="center text-block">{$lng.txt_terms_and_conditions_note}</div>
      {if $payment_data.processor_file eq 'ps_gcheckout.php'}
        {include file="customer/buttons/gcheckout.tpl" onclick=$button_href}
      {else}
        {include file="customer/main/checkout_js.tpl"}
        <div class="button-row center" id="btn_box">
          <div class="halign-center">
            {include file="customer/buttons/button.tpl" button_title=$lng.lbl_submit_order href=$button_href type="input" additional_button_class="main-button"}
          </div>
        </div>
        <div id='msg' style="display: none;" class="order-placed-msg">{$lng.msg_order_is_being_placed}</div>
      {/if}
  
    </form>
  {/capture}
  {include file="customer/dialog.tpl" title=$lng.lbl_payment_details content=$smarty.capture.dialog}
{elseif $payment_methods ne ""}
  {capture name=dialog}
    <form method="get" action="cart.php" name="checkout_form">
      <input type="hidden" name="mode" value="checkout" />
      <table cellspacing="0" class="checkout-payments" summary="{$lng.lbl_payment_method|escape}">
        {foreach from=$payment_methods item=payment name=payment_methods}
          {if $display_cod ne "" || $payment.is_cod ne "Y"}
            <tr{interline name=payment_methods}>
              <td><input type="radio" name="paymentid" id="pm{$payment.paymentid}" value="{$payment.paymentid}"{if $payment.is_default eq "1"} checked="checked"{/if} /></td>
              {if $payment.processor eq "ps_paypal_pro.php"}
                <td colspan="2" class="checkout-payment-paypal">
                  <table cellspacing="0" cellpadding="0">
                    <tr>
                      <td>{include file="payments/ps_paypal_pro_express_checkout.tpl" paypal_express_link="logo"}</td>
                      <td>
                        {*<label for="pm{$payment.paymentid}">{include file="payments/ps_paypal_pro_express_checkout.tpl" paypal_express_link="text"}</label>*}
                      </td>
                    </tr>
                  </table>
                </td>
              {else}
                <td class="checkout-payment-name"><label for="pm{$payment.paymentid}">{$payment.payment_method}</label></td>
                <td class="checkout-payment-descr">{$payment.payment_details|default:"&nbsp;"}
                  {if $payment.processor eq "cc_mbookers_wlt.php"}
                    {include file="payments/mbookers_checkout_logo.tpl"}
                  {/if}
                </td>
              {/if}
            </tr>
          {/if}
        {/foreach}
      </table>
      <div class="text-pre-block center">
        <div class="halign-center">
          {include file="customer/buttons/continue.tpl" type="input"}
        </div>
      </div>
    </form>
  {/capture}
  {include file="customer/dialog.tpl" title=$lng.lbl_payment_method content=$smarty.capture.dialog}
{/if}
