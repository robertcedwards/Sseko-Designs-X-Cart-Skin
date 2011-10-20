{*
$Id: gcheckout_button.tpl,v 1.12 2009/10/30 08:58:06 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $gcheckout_button}
  <div class="gcheckout-cart-buttons">
    <div>
      {if !$std_checkout_disabled or $paypal_express_active}
        <p>{$lng.lbl_gcheckout_or_use}</p>
      {/if}
      {$gcheckout_button}
    </div>
  </div>
{/if}
