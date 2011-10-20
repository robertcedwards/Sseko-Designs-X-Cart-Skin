{*
$Id: payment_cc.tpl,v 1.16 2008/11/25 05:49:03 cray Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $payment_cc_data.disable_ccinfo ne "Y"}
<script type="text/javascript">
<!--
{literal}
  $(document).ready(function(){
    $("input,select").attr({ 
          autocomplete: "off"
        });
  });
{/literal}
-->
</script>

  <table cellspacing="0" class="data-table" summary="{$lng.lbl_credit_card_information|escape}">

    {if $payment_cc_data.c_template ne ""}
      {include file=$payment_cc_data.c_template}
    {else}
      {include file="customer/main/register_ccinfo.tpl"}
    {/if}

  </table>

{else}

  {$lng.disable_ccinfo_msg}
  <br />

{/if}
