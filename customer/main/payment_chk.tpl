{*
$Id: payment_chk.tpl,v 1.12 2008/10/30 17:57:31 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $payment_cc_data.disable_ccinfo ne "Y"}

  <table cellspacing="0" class="data-table" summary="{$lng.lbl_check_information|escape}">

    {if $payment_cc_data.c_template ne ""}
      {include file=$payment_cc_data.c_template}
    {else}
      {include file="customer/main/register_chinfo.tpl"}
    {/if}

  </table>

{else}

  {$lng.disable_chinfo_msg}
  <br />

{/if}
