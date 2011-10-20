{*
$Id: checkout_js.tpl,v 1.4 2009/03/18 10:45:28 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<script type="text/javascript">
<!--
{literal}
function checkCheckoutForm() {
  var result = true;
{/literal}
  var unique_key = "{unique_key}";
  var skip_cc_check = {if $config.General.disable_cc ne "Y" && $smarty.get.err ne 'fields'}true{else}false{/if};

{if $config.General.check_cc_number eq "Y" and ($payment_cc_data.type eq "C" or $payment_data.paymentid eq 1 or  ($payment_data.processor_file eq "ps_paypal_pro.php" and $payment_cc_data.paymentid ne $payment_data.paymentid)) and $payment_cc_data.disable_ccinfo ne "Y"}

  result = result && (checkCCNumber(document.checkout_form.elements.namedItem('card_number[' + unique_key + ']'), document.checkout_form.elements.namedItem('card_type[' + unique_key + ']'), skip_cc_check) && checkExpirationDate(document.checkout_form.elements.namedItem('card_expire_Month[' + unique_key + ']'),document.checkout_form.elements.namedItem('card_expire_Year[' + unique_key + ']')));

{if $payment_cc_data.disable_ccinfo ne "C"}
  result = result && checkCVV2(document.checkout_form.elements.namedItem('card_cvv2[' + unique_key + ']'),document.checkout_form.elements.namedItem('card_type[' + unique_key + ']'), skip_cc_check);
{/if}

{/if}

{literal}
  result = result && checkRequired(requiredFields) && checkDBClick();

  if (result) {
    if (document.getElementById('msg'))
       document.getElementById('msg').style.display = '';

    if (document.getElementById('btn_box'))
       document.getElementById('btn_box').style.display = 'none';
  }

  return result;
}

var checkDBClick = function() {
  var clicked = false;
  return function() {
    if (clicked)
      return false;

    clicked = true;
    return true;
  }
}();
{/literal}
-->
</script>
