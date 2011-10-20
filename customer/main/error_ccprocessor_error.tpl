{*
$Id: error_ccprocessor_error.tpl,v 1.3 2009/04/17 13:03:09 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

<h1>{$lng.lbl_order_processing_error}</h1>

<div class="error-message">{$lng.err_payment_declined_order}</div>

{if $smarty.get.bill_message ne ""}
<div class="text-block">
  <span class="form-text">{$lng.err_payment_reason}:</span>
  {$smarty.get.bill_message|escape|nl2br}
</div>
{/if}

{include file="customer/buttons/go_back.tpl" href="`$catalogs.customer`/cart.php?mode=checkout"}
