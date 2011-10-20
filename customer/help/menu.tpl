{*
$Id: menu.tpl,v 1.5 2009/03/18 10:45:28 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{capture name=menu}
  <ul>
    <li><a href="help.php?section=contactus&amp;mode=update">{$lng.lbl_contact_us}</a></li>
    {foreach from=$pages_menu item=p}
      {if $p.show_in_menu eq 'Y'}
        <li><a href="pages.php?pageid={$p.pageid}">{$p.title|amp|escape}</a></li>
      {/if}
    {/foreach}
  </ul>
{/capture}
{include file="customer/menu_dialog.tpl" title=$lng.lbl_help content=$smarty.capture.menu link_href="help.php" additional_class="menu-help"}
