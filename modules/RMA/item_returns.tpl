{*
$Id: item_returns.tpl,v 1.7 2009/04/18 06:33:06 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $product.returns_sum_R gt 0 || $product.returns_sum_A gt 0 || $product.returns_sum_C gt 0}
<tr>
  <td>&nbsp;</td>
</tr>
<tr>
  <td valign="top">
{if $usertype ne 'P' || $active_modules.Simple_Mode}
<a href="returns.php?mode=search&amp;search[itemid]={$product.itemid}">{$lng.lbl_returns}</a>:
{else}
{$lng.lbl_returns}:
{/if}
</td>
  <td>{if $product.returns_sum_C eq $product.amount}{$lng.lbl_product_returned}{else}
  {if $product.returns_sum_R gt 0}{$lng.lbl_products_requested|substitute:"N":$product.returns_sum_R}<br />{/if}
  {if $product.returns_sum_A gt 0}{$lng.lbl_products_authorized|substitute:"N":$product.returns_sum_A}<br />{/if}
  {if $product.returns_sum_C gt 0}{$lng.lbl_products_returned|substitute:"N":$product.returns_sum_C}<br />{/if}
{/if}</td>
</tr>
{/if}
