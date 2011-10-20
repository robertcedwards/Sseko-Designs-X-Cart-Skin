{*
$Id: menu_cart.tpl,v 1.52 2009/07/08 12:18:07 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $config.General.ajax_add2cart eq 'Y' && $config.General.redirect_to_cart ne 'Y' && $main ne 'cart' && $main ne 'anonymous_checkout' && $main ne 'checkout'}
  {include file="customer/ajax.minicart.tpl" _include_once=1}
{/if}
<script type="text/javascript" src="{$SkinDir}/jquery.tooltip.min.js"></script>

{capture name=menu}

<div class="minicart-block">

  <img src="{$ImagesDir}/spacer.gif" class="ajax-minicart-icon {if $minicart_total_items gt 0}full{else}empty{/if}" alt="" />

{include file="customer/minicart_total.tpl"}

</div>

<ul>
  <li><a href="cart.php">{$lng.lbl_view_cart}</a></li>

  {if $active_modules.Google_Checkout eq ""}
    <li><a href="cart.php?mode=checkout">{$lng.lbl_checkout}</a></li>
  {/if}

  {if $active_modules.Wishlist && $wlid ne ""}
    <li><a href="cart.php?mode=friend_wl&amp;wlid={$wlid}">{$lng.lbl_friends_wish_list}</a></li>
  {/if}

  {if $active_modules.Wishlist}
    <li><a href="cart.php?mode=wishlist">{$lng.lbl_wish_list}</a></li>

    {if $active_modules.Gift_Registry}
      <li><a href="giftreg_manage.php">{$lng.lbl_gift_registry}</a></li>
    {/if}

  {/if}

  <li><a href="orders.php">{$lng.lbl_orders_history}</a></li>

  {if $user_subscription ne ""}
    <li><a href="orders.php?mode=subscriptions">{$lng.lbl_subscriptions_info}</a></li>
  {/if}

  {if $active_modules.RMA}
    {include file="modules/RMA/customer/menu.tpl"}
  {/if}

  {if $active_modules.Special_Offers ne ""}
    {include file="modules/Special_Offers/menu_cart.tpl"}
  {/if}

</ul>
{/capture}
{if $config.General.ajax_add2cart eq 'Y' && $config.General.redirect_to_cart ne 'Y' && $main ne 'cart' && $main ne 'anonymous_checkout' && $main ne 'checkout' && $minicart_total_items gt 0}
  {assign var=additional_class value="menu-minicart ajax-minicart"}
{else}
  {assign var=additional_class value="menu-minicart"}
{/if}
{if $minicart_total_items gt 0}
  {assign var=additional_class value="`$additional_class` full-mini-cart"}
{/if}
{include file="customer/menu_dialog.tpl" title=$lng.lbl_your_cart content=$smarty.capture.menu}
