{*
$Id: edit_product_options.tpl,v 1.7 2008/11/25 08:53:32 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if !$target}
  {assign var="target" value="cart"}
{/if}
<script type="text/javascript" src="{$SkinDir}/customer/popup_open.js"></script>
{include file="customer/buttons/button.tpl" button_title=$lng.lbl_edit_options href="javascript: popupOpen('popup_poptions.php?target=`$target`&amp;id=`$id`');" style="link" link_href="popup_poptions.php?target=`$target`&amp;id=`$id`" target="_blank"}
