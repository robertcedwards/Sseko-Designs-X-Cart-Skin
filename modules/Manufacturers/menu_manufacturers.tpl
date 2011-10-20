{*
$Id: menu_manufacturers.tpl,v 1.9 2009/04/18 06:33:06 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $manufacturers_menu ne ''}

  {capture name=menu}
    <ul>

      {foreach from=$manufacturers_menu item=m}
         <li><a href="manufacturers.php?manufacturerid={$m.manufacturerid}">{$m.manufacturer}</a></li>
      {/foreach}

      {if $show_other_manufacturers}
        <li><a href="manufacturers.php">{$lng.lbl_other_manufacturers}</a></li>
      {/if}

    </ul>
  {/capture}
  {include file="customer/menu_dialog.tpl" title=$lng.lbl_manufacturers content=$smarty.capture.menu additional_class="menu-manufacturers"}

{/if}
