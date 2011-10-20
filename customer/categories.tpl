{*
$Id: categories.tpl,v 1.35 2009/05/12 07:37:15 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{capture name=menu}
{if $active_modules.Flyout_Menus}
  <img src="{$ImagesDir}/spacer.gif" alt="" class="fancy-height-extender" />
  {include file="modules/Flyout_Menus/categories.tpl"}
  {assign var="additional_class" value="menu-fancy-categories-list"}
{else}
  <img src="{$ImagesDir}/spacer.gif" alt="" class="height-extender" />
  <ul>
    {foreach from=$categories_menu_list item=c name=categories}
      <li{interline name=categories}><a href="home.php?cat={$c.categoryid}" title="{$c.category|escape}">{$c.category}</a></li>
    {/foreach}
  </ul>
  {assign var="additional_class" value="menu-categories-list"}
{/if}
<div class="categories-clearing"></div>
{/capture}
{include file="customer/menu_dialog.tpl" title=$lng.lbl_categories content=$smarty.capture.menu}
