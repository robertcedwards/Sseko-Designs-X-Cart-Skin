{*
$Id: prnotice.tpl,v 1.11 2008/10/29 16:50:20 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{*** NOTE: If you are reselling X-Cart stores, please contact us (http://www.x-cart.com) before changing the Powered-by note here. ***}
{if $main eq "catalog" and $current_category.category eq ""}
  Powered by X-Cart <a href="http://www.x-cart.com">{$sm_prnotice_txt}</a>
{else}
  Powered by X-Cart {$sm_prnotice_txt}
{/if}
