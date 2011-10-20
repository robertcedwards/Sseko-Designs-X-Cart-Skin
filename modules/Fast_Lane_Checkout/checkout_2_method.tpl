{*
$Id: checkout_2_method.tpl,v 1.24 2009/07/22 06:06:54 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<h1>{$lng.lbl_shipping_and_payment}</h1>

<script type="text/javascript">
<!--
{literal}
function display_cod(flag) {
  for (var i = 0; i < paymentsCOD.length; i++) {
    if (paymentsCOD[i] && document.getElementById('cod_tr' + paymentsCOD[i]))
      document.getElementById('cod_tr' + paymentsCOD[i]).style.display = flag ? "" : "none";
  }

  return true;
}
{/literal}
-->
</script>

{capture name=dialog}

{if $smarty.get.err eq 'gc_not_enough_money'}
<div class="center error-message">{$lng.txt_gc_not_enough_money}</div>
{/if}

<form action="cart.php" method="post" name="cartform">

  <input type="hidden" name="mode" value="checkout" />
  <input type="hidden" name="cart_operation" value="cart_operation" />
  <input type="hidden" name="action" value="update" />

{if $config.Shipping.enable_shipping eq "Y"}
  {include file="modules/Fast_Lane_Checkout/shipping_methods.tpl"}
{/if}

  <div class="flc-checkout-container">
    <div class="flc-address">

      {include file="customer/subheader.tpl" title=$lng.lbl_billing_address}

{if $userinfo} 

{if $userinfo.default_fields.b_address}{$userinfo.b_address}<br />{/if}
{if $userinfo.default_fields.b_address_2 and $userinfo.b_address_2}
{$userinfo.b_address_2}<br />
{/if}
{if $userinfo.default_fields.b_city}{$userinfo.b_city}<br />{/if}
{if $userinfo.default_fields.b_county and $config.General.use_counties eq "Y" and $userinfo.b_county}{$userinfo.b_countyname}<br />{/if}
{if $userinfo.default_fields.b_state}{$userinfo.b_statename}<br />{/if}
{if $userinfo.default_fields.b_country}{$userinfo.b_countryname}<br />{/if}
{if $userinfo.default_fields.b_zipcode}{$userinfo.b_zipcode}{/if}

{else} 

No data 

{/if} 
 
{if $login ne ""}
<br />
<br />
{include file="customer/buttons/modify.tpl" href="register.php?mode=update&amp;action=cart" style="link"}
{/if}

    </div>
    <div class="flc-checkout-options">

      {include file="customer/subheader.tpl" title=$lng.lbl_payment_method}

      <table cellspacing="0" class="flc-payments" summary="{$lng.lbl_payment_methods|escape}">

{foreach from=$payment_methods item=payment name=pm}

        <tr{interline name=pm}{if $payment.is_cod eq "Y"} id="cod_tr{$payment.paymentid}"{/if}>
          <td>
            <input type="radio" name="paymentid" id="pm{$payment.paymentid}" value="{$payment.paymentid}"{if $payment.is_default eq "1"} checked="checked"{/if} />
          </td>

{if $payment.processor eq "ps_paypal_pro.php"}
          <td colspan="2" class="flc-payment-paypal">

            <table cellspacing="0" cellpadding="0">
              <tr>
                <td>{include file="payments/ps_paypal_pro_express_checkout.tpl" paypal_express_link="logo"}</td>
                <td><label for="pm{$payment.paymentid}">{include file="payments/ps_paypal_pro_express_checkout.tpl" paypal_express_link="text"}</label></td>
              </tr>
            </table>

          </td>
{else}

          <td class="flc-payment-name">
            <label for="pm{$payment.paymentid}">{$payment.payment_method}</label>
          </td>
          <td class="flc-payment-descr">
            {$payment.payment_details}
            {if $payment.processor eq "cc_mbookers_wlt.php"}
              {include file="payments/mbookers_checkout_logo.tpl"}
            {/if}
          </td>
{/if}
        </tr>

{/foreach}

      </table>

    </div>

    <div class="clearing"></div>

  </div>

  <br />
  <div class="center">
    <div class="halign-center">
      {include file="customer/buttons/continue.tpl" type="input" additional_button_class="main-button"}
    </div>
  </div>

</form>

<script type="text/javascript">
<!--
var paymentsCOD = [{strip}
{foreach from=$payment_methods item=payment name=payment_methods}
{if $payment.is_cod eq "Y"}
  {$payment.paymentid}{if !$smarty.foreach.payment_methods.last},{/if}

{/if}
{/foreach}
{/strip}];
display_cod({if $display_cod eq 'Y'}true{else}false{/if});
-->
</script>

{/capture}
{include file="customer/dialog.tpl" title=$lng.lbl_shipping_and_payment content=$smarty.capture.dialog noborder=true}
