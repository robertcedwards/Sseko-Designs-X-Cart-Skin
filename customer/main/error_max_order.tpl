{*
$Id: error_max_order.tpl,v 1.2 2009/04/17 13:03:09 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

<h1>{$lng.lbl_warning}</h1>

{include assign="tmp_value" file="currency.tpl" value=$config.General.maximum_order_amount}
<div class="error-message text-block">{$lng.err_checkout_max_order_msg|substitute:"value":$tmp_value}</div>
{include file="customer/buttons/go_back.tpl"}
