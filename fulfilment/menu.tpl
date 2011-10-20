{*
$Id: menu.tpl,v 1.15 2008/08/21 09:52:48 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{capture name=menu}
<a href="{$catalogs.admin}/orders.php" class="VertMenuItems">{$lng.lbl_orders}</a><br />
<a href="{$catalogs.admin}/import.php?mode=export" class="VertMenuItems">{$lng.lbl_export_data}</a><br />
<a href="{$catalogs.admin}/statistics.php" class="VertMenuItems">{$lng.lbl_statistics}</a><br />
{/capture}
{ include file="menu.tpl" dingbats="dingbats_categorie.gif" menu_title=$lng.lbl_management menu_content=$smarty.capture.menu }
