{*
$Id: help.tpl,v 1.11 2009/06/29 07:05:01 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{capture name=menu}
<a href="http://www.x-cart.com/faq.html" class="VertMenuItems" target="_blank">{$lng.lbl_xcart_faqs}</a><br />
<a href="http://www.x-cart.com/manuals.html" class="VertMenuItems" target="_blank">{$lng.lbl_xcart_manuals}</a><br />
<a href="http://forum.x-cart.com/" class="VertMenuItems" target="_blank">{$lng.lbl_community_forums}</a><br />
<a href="http://secure.qtmsoft.com/" class="VertMenuItems" target="_blank">{$lng.lbl_support_helpdesk}</a><br />
<a href="http://www.x-cart.com/software_license_agreement.html" class="VertMenuItems" target="_blank">{$lng.lbl_license_agreement}</a><br />
<a href="http://www.x-cart.com/purchasing_shopping_cart_software.html" class="VertMenuItems" target="_blank">{$lng.lbl_purchase_paid_license}</a><br />
{/capture}
{include file="menu.tpl" dingbats="dingbats_help.gif" menu_title=$lng.lbl_help menu_content=$smarty.capture.menu}
