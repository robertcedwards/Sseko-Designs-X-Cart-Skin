{*
$Id: error_max_items.tpl,v 1.2 2009/04/17 13:03:09 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

<h1>{$lng.lbl_warning}</h1>

<div class="error-message text-block">{$lng.err_checkout_max_items_msg|substitute:"quantity":$config.General.maximum_order_items}</div>
{include file="customer/buttons/go_back.tpl"}
