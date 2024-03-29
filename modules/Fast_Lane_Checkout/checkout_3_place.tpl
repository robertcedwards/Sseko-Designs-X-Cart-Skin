{*
$Id: checkout_3_place.tpl,v 1.20 2009/04/23 11:35:03 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<h1>{$lng.lbl_place_order}</h1>
{capture name=dialog}
<div class="flc-checkout-products">
{if $config.Appearance.show_cart_details eq "Y" || ($config.Appearance.show_cart_details eq "L" && $smarty.get.paymentid && $smarty.get.mode eq "checkout")} 
{include file="customer/main/cart_details.tpl" link_qty="Y"}
{else}
{include file="customer/main/cart_contents.tpl" link_qty="Y"}
{/if}
{include file="customer/main/cart_totals.tpl" link_shipping="Y" no_form_fields=true}
</div>
<form action="{$payment_data.payment_script_url}" method="post" name="checkout_form" onsubmit="javascript: return checkCheckoutForm();">
  <input type="hidden" name="paymentid" value="{$payment_data.paymentid}" />
  <input type="hidden" name="action" value="place_order" />
  <input type="hidden" name="{$XCARTSESSNAME}" value="{$XCARTSESSID}" />
  <input type="hidden" name="payment_method" value="{$payment_data.payment_method_orig}" />
  {include file="customer/subheader.tpl" title=$lng.lbl_personal_information}
  <div class="right-box">
    {include file="customer/buttons/modify.tpl" href="register.php?mode=update&amp;action=cart&amp;paymentid=`$smarty.get.paymentid`" style="link"}
  </div>
  <div class="flc-checkout-box-info">
    {include file="modules/Fast_Lane_Checkout/customer_details_html.tpl"}
  </div>
  {include file="customer/subheader.tpl" title="`$lng.lbl_payment_method`: `$payment_data.payment_method`"}
{if $ignore_payment_method_selection eq ""}
  <div class="right-box">
    {include file="customer/buttons/button.tpl" button_title=$lng.lbl_change_payment_method href="cart.php?mode=checkout" style="link"}
  </div>
{/if}
<script type="text/javascript">
<!--
requiredFields = [];
-->
</script>
{include file="check_required_fields_js.tpl" use_email_validation="N"}
  <div class="flc-checkout-box-info">
{if $payment_data.payment_template ne ""}
{capture name=payment_template_output}{include file=$payment_data.payment_template hide_header="Y"}{/capture}
{if $smarty.capture.payment_template_output ne ""}
    {include file="customer/subheader.tpl" title=$lng.lbl_payment_details class="grey"}
    <div class="flc-payment-options">
      {$smarty.capture.payment_template_output}
    </div>
{/if}
{/if}
{if $payment_cc_data.cmpi eq 'Y' && $config.CMPI.cmpi_enabled eq 'Y'}
    {include file="main/cmpi.tpl"}
{/if}
    <div class="text-block2">
      {include file="customer/main/checkout_notes.tpl"}
    </div>
  </div>
  <div class="center text-block2">{$lng.txt_terms_and_conditions_note}</div>
{if $payment_data.processor_file eq 'ps_gcheckout.php'}
  {include file="buttons/gcheckout.tpl" onclick=$button_href}
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
{include file="customer/dialog.tpl" title=$lng.lbl_payment_details content=$smarty.capture.dialog additional_class="cart" noborder=tru}
