{*
$Id: menu_profile.tpl,v 1.26 2008/08/21 09:52:40 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{capture name=menu}
<a href="register.php?mode=update" class="VertMenuItems">{$lng.lbl_modify}</a><br />
<a href="register.php?mode=delete" class="VertMenuItems">{$lng.lbl_delete}</a><br />
{if ($usertype eq 'A' || ($usertype eq 'P' && $active_modules.Simple_Mode)) && $is_merchant_password eq 'Y'}
<a class="VertMenuItems" href="{$catalogs.admin}/change_mpassword.php">{$lng.lbl_change_mpassword}</a><br />
{/if}
{if $usertype eq "C"}
<a href="orders.php" class="VertMenuItems">{$lng.lbl_orders_history}</a><br />
{if $user_subscription ne ""}
{include file="modules/Subscriptions/subscriptions_menu.tpl"}</a><br />
{/if}
{/if}
{/capture}
{ include file="menu.tpl" dingbats="dingbats_profil.gif" menu_title=$lng.lbl_your_profile menu_content=$smarty.capture.menu }
