{*
$Id: minicart_total.tpl,v 1.118.2.22 2010/01/28 08:38:23 aim Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<span class="minicart">
  {if $minicart_total_items gt 0}

    {include file="currency.tpl" value=$minicart_total_cost assign="total"}
    <strong>{$lng.lbl_cart_X_items_total|substitute:x:$minicart_total_items:total:$total}</strong>

  {else}

      <strong>{$lng.lbl_cart_is_empty}</strong>

  {/if}

</span>
