{*
$Id: ajax.add2cart.tpl,v 1.2 2009/05/29 13:19:08 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<script type="text/javascript">
<!--
var lbl_added = '{$lng.lbl_added|escape:javascript}';
var lbl_error = '{$lng.lbl_error|escape:javascript}';
var redirect_to_cart = {if $config.General.redirect_to_cart eq "Y"}true{else}false{/if};
--></script>
<script type="text/javascript" src="{$SkinDir}/customer/ajax.add2cart.js"></script>
<script type="text/javascript" src="{$SkinDir}/customer/ajax.product.js"></script>
<script type="text/javascript" src="{$SkinDir}/customer/ajax.products.js"></script>
