{*
$Id: subscriptions_menu.tpl,v 1.8 2008/08/21 09:53:10 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<a href="{if $usertype eq "A" or $usertype eq "P"}{$catalogs.admin}{else}{$catalogs.customer}{/if}/orders.php?mode=subscriptions" class="VertMenuItems">{$lng.lbl_subscriptions_info}</a>
