{*
$Id: shipping_methods.tpl,v 1.15 2009/04/17 13:35:59 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

<div class="flc-checkout-container">
  <div class="flc-address">

    {include file="customer/subheader.tpl" title=$lng.lbl_shipping_address}

{if $userinfo}
{if $userinfo.default_fields.s_address}{$userinfo.s_address}<br />{/if}
{if $userinfo.default_fields.s_address_2 and $userinfo.s_address_2}
{$userinfo.s_address_2}<br />
{/if}
{if $userinfo.default_fields.s_city}{$userinfo.s_city}<br />{/if}
{if $userinfo.default_fields.s_county and $config.General.use_counties eq "Y" and $userinfo.s_county}{$userinfo.s_countyname}<br />{/if}
{if $userinfo.default_fields.s_state}{$userinfo.s_statename}<br />{/if}
{if $userinfo.default_fields.s_country}{$userinfo.s_countryname}<br />{/if}
{if $userinfo.default_fields.s_zipcode}{$userinfo.s_zipcode}{/if}
{else}
No data
{/if}

{if $login ne ""}
<div class="text-pre-block">
  {include file="customer/buttons/modify.tpl" href="register.php?mode=update&action=cart" style="link"}
</div>
{/if}

  </div>
  <div class="flc-checkout-options">

    {include file="customer/subheader.tpl" title=$lng.lbl_delivery}

{*  ERROR: no shipping methods available [begin]  *}

{if $shipping_calc_error ne ""}
    <div>{$shipping_calc_service} {$lng.lbl_err_shipping_calc}</div>
    <div class="error-message">{$shipping_calc_error}</div>
{/if}

{if $shipping eq "" and $need_shipping}
    <div class="text-block error-message">{$lng.lbl_no_shipping_for_location}</div>

{elseif $shipping eq "" and $config.Shipping.do_not_require_shipping eq "Y" and $cart.shipping_cost eq 0}
    {$lng.lbl_free_shipping}

{elseif $shipping eq "" and $cart.shipping_cost gt 0}
    {$lng.lbl_fixed_shipping_cost} ({include file="currency.tpl" value=$cart.shipping_cost})

{/if}

{*  ERROR: no shipping methods available [end]  *}

{*  Select the shipping carrier [begin]  *}
{if $login ne "" or $config.General.apply_default_country eq "Y" or $cart.shipping_cost gt 0}

{if $active_modules.UPS_OnLine_Tools and $config.Shipping.realtime_shipping eq "Y" and $config.Shipping.use_intershipper ne "Y" and $show_carriers_selector eq "Y" and $is_ups_carrier_empty ne "Y" and $is_other_carriers_empty ne "Y"}
    <label class="form-text">
      {$lng.lbl_shipping_carrier}:
      {include file="main/select_carrier.tpl" name="selected_carrier" id="selected_carrier" onchange="javascript: self.location='cart.php?mode=checkout&amp;action=update&amp;selected_carrier='+this.options[this.selectedIndex].value;"}
    </label>
    <br />
    <br />
{/if}

{/if}
{*  Select the shipping carrier: [end]  *}

{*  Select the shipping method: [begin]  *}
{if $shipping ne "" and $need_shipping}

{if $arb_account_used}
    <div>{$lng.txt_arb_account_checkout_note}</div>
{/if}{* $arb_account_used *}

{if $login ne "" || $config.General.apply_default_country eq "Y" || $cart.shipping_cost gt 0}
    <div class="flc-shippings">
{foreach from=$shipping item=s name=sm}
      <label{interline name=sm}>
        <input type="radio" name="shippingid" value="{$s.shippingid}"{if $s.shippingid eq $cart.shippingid} checked="checked"{/if}{if $allow_cod} onclick="javascript: display_cod({if $s.is_cod eq 'Y'}true{else}false{/if});"{/if} />
        <span>
          {$s.shipping|trademark:$insert_trademark}{if $s.shipping_time ne ""} - {$s.shipping_time}{/if}{if $config.Appearance.display_shipping_cost eq "Y" and ($login ne "" or $config.General.apply_default_country eq "Y" or $cart.shipping_cost gt 0)} ({include file="currency.tpl" value=$s.rate}){/if}
        </span>
      </label>
{if $s.warning ne ""}
      <div class="{if $s.shippingid eq $cart.shippingid}error-message{else}small-note{/if}">{$s.warning}</div>
{/if}

{/foreach}
    </div>

{/if}

{else}

    <input type="hidden" name="shippingid" value="0" />

{/if}
{*  Select the shipping method: [end]  *}

    {include file="customer/main/dhl_ext_countries.tpl" onchange=true}

  </div>

  <div class="clearing"></div>

</div>

{if $display_ups_trademarks && $current_carrier eq "UPS"}
{include file="modules/UPS_OnLine_Tools/ups_notice.tpl"}
{/if}

