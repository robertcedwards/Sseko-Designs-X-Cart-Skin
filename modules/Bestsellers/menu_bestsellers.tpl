{*
$Id: menu_bestsellers.tpl,v 1.20 2009/04/23 11:35:03 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $config.Bestsellers.bestsellers_menu eq "Y" && $bestsellers}

  {capture name=menu}
    <ul>

      {foreach from=$bestsellers item=b name=bestsellers}
        <li{interline name=bestsellers}>
          <a href="product.php?productid={$b.productid}&amp;cat={$cat}&amp;bestseller=Y">{$b.product|escape}</a>
        </li>
      {/foreach}

    </ul>
  {/capture}
  {include file="customer/menu_dialog.tpl" title=$lng.lbl_bestsellers content=$smarty.capture.menu additional_class="menu-bestsellers"}

{/if}
