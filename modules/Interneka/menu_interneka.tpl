{*
$Id: menu_interneka.tpl,v 1.10 2009/04/18 06:33:06 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{capture name=menu}
  <ul>
    <!-- begin cut here -->
    <li><a href="http://interneka.com/affiliate/AffiliateSignup.php?WID={$interneka_id6}">{$lng.lbl_interneka_click_to_register}</a></li>
    <!-- end cut here -->
  </ul>
{/capture}
{include file="customer/menu_dialog.tpl" title=$lng.lbl_interneka_affiliates content=$smarty.capture.menu additional_class="menu-interneka"}
