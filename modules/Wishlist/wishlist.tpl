{*
$Id: wishlist.tpl,v 1.32 2009/04/20 11:00:12 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

<h1>{$lng.lbl_wish_list}</h1>

{capture name=dialog}

  {include file="modules/Wishlist/wl_products.tpl"}

{/capture}
{include file="customer/dialog.tpl" title=$lng.lbl_wish_list content=$smarty.capture.dialog noborder=true}

{if $active_modules.Gift_Registry}
  {include file="modules/Gift_Registry/events_list.tpl" is_internal=true}
{/if}
