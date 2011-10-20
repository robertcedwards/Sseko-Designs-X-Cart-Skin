{*
$Id: checkout_notes.tpl,v 1.12 2009/04/18 06:33:02 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="customer/subheader.tpl" title=$lng.txt_notes class="grey"}

<table cellspacing="0" class="data-table" summary="{$lng.lbl_customer_notes|escape}">
  <tr>
    <td class="data-name">{$lng.lbl_customer_notes}:</td>
    <td><textarea cols="70" rows="10" name="Customer_Notes"></textarea></td>
  </tr>

  {if $active_modules.XAffiliate eq "Y" && $partner eq '' && $config.XAffiliate.ask_partnerid_on_checkout eq 'Y'}
    {include file="partner/main/checkout_partner.tpl"}
  {/if}

</table>
