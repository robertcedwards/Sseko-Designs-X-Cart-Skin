{*
$Id: featured.tpl,v 1.23.2.1 2009/12/10 14:32:41 aim Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $f_products ne ""}
  {capture name=dialog}
    {include file="customer/main/products.tpl" products=$f_products featured="Y"}
  {/capture}
  {include file="customer/dialog.tpl" title=$lng.lbl_featured_products content=$smarty.capture.dialog sort=true additional_class="products-dialog dialog-featured-list" sort=false}
{/if}
