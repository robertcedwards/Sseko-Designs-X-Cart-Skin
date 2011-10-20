{*
$Id: dhl_ext_countries.tpl,v 1.5 2008/10/30 17:57:31 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $config.Shipping.realtime_shipping eq "Y" && $config.Shipping.use_intershipper ne "Y" && (!$active_modules.UPS_OnLine_Tools || $show_carriers_selector ne 'Y' || $current_carrier ne 'UPS') && $dhl_ext_countries && $has_active_arb_smethods}

  <label>
    {$lng.txt_dhl_ext_countries_note}:
    <select name="dhl_ext_country" {if $onchange} onchange="javascript: self.location = 'cart.php?mode=checkout&amp;action=update&amp;dhl_ext_country=' + this.options[this.selectedIndex].value;"{/if}>
      {if !$dhl_ext_country}
        <option value="">{$lng.lbl_please_select_one}</option>
      {/if}
      {foreach from=$dhl_ext_countries item=c}
        <option value="{$c}"{if $c eq $dhl_ext_country} selected="selected"{/if}>{$c}</option>
      {/foreach}
    </select>
  </label>

{/if}
