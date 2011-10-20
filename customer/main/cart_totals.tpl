{*
$Id: cart_totals.tpl,v 1.107.2.2 2010/01/20 10:45:32 ferz Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

<div class="cart-total-row">

  {if $config.Shipping.enable_shipping eq "Y"}

    {if $link_shipping eq "Y" && $cart.shippingid}
      <div class="shipping-method">
        {$lng.lbl_delivery}:

        {foreach from=$shipping item=s}

          {if $s.shippingid eq $cart.shippingid}

            {if $change_shipping_link eq "Y"}
              <a href="cart.php?mode=checkout">{$s.shipping|trademark:$insert_trademark:"alt"}</a>
            {else}
              {$s.shipping|trademark:$insert_trademark:"alt"}
            {/if}

            {if $s.warning ne ''}
              <div class="error-message">{$s.warning}</div>
            {/if}

          {/if}

        {/foreach}

      </div>

    {else}

      {if ($login ne "" || $config.General.apply_default_country eq "Y" || $cart.shipping_cost gt 0) && $active_modules.UPS_OnLine_Tools && $config.Shipping.realtime_shipping eq "Y" && $config.Shipping.use_intershipper ne "Y" && $show_carriers_selector eq "Y" && $is_ups_carrier_empty ne "Y" && $is_other_carriers_empty ne "Y"}

        <div class="shipping-method">
          {$lng.lbl_shipping_carrier}:
          {include file="main/select_carrier.tpl" name="selected_carrier" onchange="javascript: document.cartform.submit();"}
        </div>

      {/if}

      {if $shipping_calc_error ne ""}
        {$shipping_calc_service} {$lng.lbl_err_shipping_calc}
        <br />
        <div class="error-message">{$shipping_calc_error}</div>
      {/if}

      {if $shipping eq "" && $need_shipping}
        <div class="error-message">{$lng.lbl_no_shipping_for_location}:</div>

        {if $login ne "" || $config.General.apply_default_country eq "Y" || $cart.shipping_cost gt 0}
          {$userinfo.s_address}<br />
          {if $userinfo.s_address_2}
            {$userinfo.s_address_2}<br />
          {/if}
          {$userinfo.s_city}<br />
          {$userinfo.s_statename}<br />
          {$userinfo.s_countryname}<br />
          {$userinfo.s_zipcode}
        {else}
          {$lng.lbl_anonymous}
        {/if}

        {if $login ne ""}
          <div>
            {include file="customer/buttons/modify.tpl" href="register.php?mode=update&action=cart"}
          </div>
        {/if}

        <div class="clearing"></div>
        <hr class="cart-total-line" />
      {/if}

      {if $shipping ne "" && $need_shipping}

        {if $arb_account_used}
          <p>{$lng.txt_arb_account_checkout_note}</p>
        {/if}

        {if $active_modules.UPS_OnLine_Tools ne "" && $config.Shipping.realtime_shipping eq "Y" && $config.Shipping.use_intershipper ne "Y" && $current_carrier eq "UPS" && $force_delivery_dropdown_box ne "Y"}

          {if $login ne "" || $config.General.apply_default_country eq "Y" || $cart.shipping_cost gt 0}
            <div class="shipping-method">

              <table cellspacing="1" summary="{$lng.lbl_delivery|escape}">

                <tr>
                  <th colspan="2" class="shipping-method">{$lng.lbl_delivery}:</th>
                </tr>

                {foreach from=$shipping item=s}
                  <tr{if $s.shippingid eq $cart.shippingid} class="selected"{/if}>
                    <td>
                      <input type="radio" name="shippingid" id="shipping_{$s.shippingid}" value="{$s.shippingid}"{if $s.shippingid eq $cart.shippingid} checked="checked"{else} onclick="javascript: this.form.submit();"{/if} />
                    </td>
                    <td>
                      <label for="shipping_{$s.shippingid}">
                        {$s.shipping|trademark:$insert_trademark}
                        {if $s.shipping_time ne ""} - {$s.shipping_time}{/if}
                        {if $config.Appearance.display_shipping_cost eq "Y" && ($login ne "" || $config.General.apply_default_country eq "Y" || $cart.shipping_cost gt 0)} ({include file="currency.tpl" value=$s.rate}){/if}
                      </label>
                    </td>
                  </tr>
                  {if $s.shippingid eq $cart.shippingid && $s.warning ne ""}
                    {assign var="warning" value=$s.warning}
                  {/if}

                  {if $s.warning ne ''}
                    <tr>
                      <td>&nbsp;</td>
                      <td class="shipping-warning">{$s.warning}</td>
                    </tr>
                  {/if}

                {/foreach}
              </table>

            </div>

            {if $warning ne ""}
              <p class="right-box error-message">{$warning}</p>
            {/if}

          {/if}

        {else}

          <div class="shipping-method">
            {$lng.lbl_delivery}:

<script type="text/javascript">
<!--
{literal}
function updateShipping(s) {
  var list = $("input[name^='productindex']", s.form);

  list.each(function() { this.disabled = true; });

  var url = 'cart.php?' + $(s.form).serialize();

  list.each(function() { this.disabled = false; });

  self.location = url;
}
{/literal}
-->
</script>
            <select name="shippingid" onchange="javascript: updateShipping(this);">
              {foreach from=$shipping item=s}
                <option value="{$s.shippingid}"{if $s.shippingid eq $cart.shippingid} selected="selected"{/if}>
                  {$s.shipping|trademark:$insert_trademark:"alt"}
                  {if $config.Appearance.display_shipping_cost eq "Y" && ($login ne "" || $config.General.apply_default_country eq "Y" || $cart.shipping_cost gt 0)} ({include file="currency.tpl" value=$s.rate plain_text_message=1}){/if}
                  {if $s.shipping_time ne ""} - {$s.shipping_time}{/if}
                </option>

                {if $s.shippingid eq $cart.shippingid && $s.warning ne ""}
                  {assign var="warning" value=$s.warning}
                {/if}
              {/foreach}
            </select>

            {if $warning ne ''}
              <p class="right-box error-message">{$lng.lbl_note}: {$warning}</p>
            {/if}

          </div>

        {/if}

      {elseif !$no_form_fields}
        <input type="hidden" name="shippingid" value="0" />
      {/if}

      {include file="customer/main/dhl_ext_countries.tpl" onchange=true}

    {/if}

  {elseif !$no_form_fields}

    <input type="hidden" name="shippingid" value="0" />

  {/if}

  {assign var="subtotal" value=$cart.subtotal}
  {assign var="discounted_subtotal" value=$cart.discounted_subtotal}
  {assign var="shipping_cost" value=$cart.display_shipping_cost}

  <div class="right-box">
    <table cellspacing="0" class="totals" summary="{$lng.lbl_total|escape}">
      <tr>
        <td class="total-name">{$lng.lbl_subtotal}:</td>
        <td class="total-value">{include file="currency.tpl" value=$cart.display_subtotal}</td>
        <td class="total-alt-value">{include file="customer/main/alter_currency_value.tpl" alter_currency_value=$cart.display_subtotal}</td>
      </tr>

      {if $cart.discount gt 0}
        <tr>
          <td class="total-name">{$lng.lbl_discount}:</td>
          <td class="total-value">{include file="currency.tpl" value=$cart.discount}</td>
          <td class="total-alt-value">{include file="customer/main/alter_currency_value.tpl" alter_currency_value=$cart.discount}</td>
        </tr>
      {/if}

      {if $cart.coupon_discount ne 0 && $cart.coupon_type ne "free_ship"}
        <tr>
          <td class="total-name dcoupons-clear">
            {$lng.lbl_discount_coupon}
            <a href="cart.php?mode=unset_coupons" alt="{$lng.lbl_unset_coupon|escape}"><img src="{$ImagesDir}/spacer.gif" alt="{$lng.lbl_unset_coupon|escape}" /></a>:
          </td>
          <td class="total-value">{include file="currency.tpl" value=$cart.coupon_discount}</td>
          <td class="total-alt-value">{include file="customer/main/alter_currency_value.tpl" alter_currency_value=$cart.coupon_discount}</td>
        </tr>
      {/if}

      {if $cart.display_discounted_subtotal ne $cart.display_subtotal}
        <tr>
          <td class="total-name">{$lng.lbl_discounted_subtotal}:</td>
          <td class="total-value">{include file="currency.tpl" value=$cart.display_discounted_subtotal}</td>
          <td class="total-alt-value">{include file="customer/main/alter_currency_value.tpl" alter_currency_value=$cart.display_discounted_subtotal}</td>
        </tr>
      {/if}

      {if $config.Shipping.enable_shipping eq "Y"}
        <tr>
          <td class="total-name dcoupons-clear">
            {$lng.lbl_shipping_cost}{if $cart.coupon_discount ne 0 && $cart.coupon_type eq "free_ship"} ({$lng.lbl_discounted} <a href="cart.php?mode=unset_coupons" alt="{$lng.lbl_unset_coupon|escape}"><img src="{$ImagesDir}/spacer.gif" alt="{$lng.lbl_unset_coupon|escape}" /></a>){/if}:
          </td>

          {if ($shipping ne '' || !$need_shipping) && $login ne "" || $config.General.apply_default_country eq "Y" || $cart.shipping_cost gt 0}
            <td class="total-value">{include file="currency.tpl" value=$shipping_cost}</td>
            <td class="total-alt-value">{include file="customer/main/alter_currency_value.tpl" alter_currency_value=$shipping_cost}</td>
          {else}
            <td class="total-value">{$lng.txt_not_available_value}</td>
            <td>&nbsp;</td>

            {if ($shipping ne '' || !$need_shipping)}
              {assign var="not_logged_message" value="1"}
            {/if}

          {/if}
        </tr>
      {/if}
      
      {if $active_modules.Gift_Registry and $config.Gift_Registry.enable_gift_wrapping eq "Y" and $cart.need_giftwrap eq "Y"}
        {include file="modules/Gift_Registry/gift_wrapping_cart_contents.tpl"}
      {/if}

      {if $cart.taxes && $config.Taxes.display_taxed_order_totals ne "Y"}
        {foreach key=tax_name item=tax from=$cart.taxes}

          <tr>
            <td class="total-name">{$tax.tax_display_name}{if $tax.rate_type eq "%"} {$tax.rate_value}%{/if}:</td>
            {if $login ne "" || $config.General.apply_default_country eq "Y"}
              <td class="total-value">{include file="currency.tpl" value=$tax.tax_cost}</td>
              <td class="total-alt-value">{include file="customer/main/alter_currency_value.tpl" alter_currency_value=$tax.tax_cost}</td>
            {else}
              <td class="total-value" colspan="2">{$lng.txt_not_available_value}</td>
              {assign var="not_logged_message" value="1"}
            {/if}
          </tr>

        {/foreach}
      {/if}

      {if $cart.payment_surcharge}
        <tr>
          <td class="total-name">
            {if $cart.payment_surcharge gt 0}
              {$lng.lbl_payment_method_surcharge}
            {else}
              {$lng.lbl_payment_method_discount}
            {/if}:
          </td>
          <td class="total-value">{include file="currency.tpl" value=$cart.payment_surcharge}</td>
          <td class="total-alt-value">{include file="customer/main/alter_currency_value.tpl" alter_currency_value=$cart.payment_surcharge}</td>
        </tr>
      {/if}

      {if $cart.applied_giftcerts}
        <tr>
          <td class="total-name">{$lng.lbl_giftcert_discount}:</td>
          <td class="total-value">{include file="currency.tpl" value=$cart.giftcert_discount}</td>
          <td class="total-alt-value">{include file="customer/main/alter_currency_value.tpl" alter_currency_value=$cart.giftcert_discount}</td>
        </tr>
      {/if}

      <tr>
        <td colspan="3" class="total-hr"><img src="{$ImagesDir}/spacer.gif" alt="" /></td>
      </tr>

      <tr>
        <td class="total">{$lng.lbl_cart_total}:</td>
        <td class="total-value">{include file="currency.tpl" value=$cart.total_cost}</td>
        <td class="total-alt-value">{include file="customer/main/alter_currency_value.tpl" alter_currency_value=$cart.total_cost}</td>
      </tr>

      {if $cart.taxes and $config.Taxes.display_taxed_order_totals eq "Y"}

        <tr>
          <td colspan="3" class="total-taxes">{$lng.lbl_including}:</td>
        </tr>

        {foreach key=tax_name item=tax from=$cart.taxes}
          <tr class="total-tax-line">
            <td class="total-tax-name">{$tax.tax_display_name}:</td>
            <td>{include file="currency.tpl" value=$tax.tax_cost}</td>
            <td>{include file="customer/main/alter_currency_value.tpl" alter_currency_value=$tax.tax_cost}</td>
          </tr>
        {/foreach}

      {/if}

    </table>
  </div>

  {if $cart.applied_giftcerts}
    <br />
    <br />
    <div class="form-text">{$lng.lbl_applied_giftcerts}:</div>

    {foreach from=$cart.applied_giftcerts item=gc}
      <div class="dcoupons-clear">
        {$gc.giftcert_id}
        <a href="cart.php?mode=unset_gc&amp;gcid={$gc.giftcert_id}{if $smarty.get.paymentid}&amp;paymentid={$smarty.get.paymentid}{/if}"><img src="{$ImagesDir}/spacer.gif" alt="{$lng.lbl_unset_gc|escape}" /></a>:
        <span class="total-name">{include file="currency.tpl" value=$gc.giftcert_cost}
      </div>
    {/foreach}

  {/if}

  {if $not_logged_message eq "1"}
    {$lng.txt_order_total_msg}
  {/if}

  {if !$no_form_fields}
    <input type="hidden" name="paymentid" value="{$smarty.get.paymentid|escape:"html"}" />
    <input type="hidden" name="mode" value="{$smarty.get.mode|escape:"html"}" />
    <input type="hidden" name="action" value="update" />
  {/if}

  {if $display_ups_trademarks && $current_carrier eq "UPS"}
    <br />
    {include file="modules/UPS_OnLine_Tools/ups_notice.tpl"}
  {/if}

</div>

{if $active_modules.Special_Offers and $cart.bonuses ne ""}
  <hr />
  {include file="modules/Special_Offers/customer/cart_bonuses.tpl"}
{/if}
