{*
$Id: products.tpl,v 1.86 2009/06/22 05:59:17 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $products}

<script type="text/javascript">
<!--
var products_data = [];
-->
</script>
  <script type="text/javascript" src="{$SkinDir}/customer/check_quantity.js"></script>

  {if $config.General.ajax_add2cart eq 'Y' && $config.General.redirect_to_cart ne 'Y'}
    {include file="customer/ajax.add2cart.tpl" _include_once=1}
  {/if}

  {if $active_modules.Customer_Reviews && $config.Customer_Reviews.ajax_rating eq 'Y'}
    {include file="modules/Customer_Reviews/ajax.rating.tpl" _include_once=1}
  {/if}

  {if $active_modules.Feature_Comparison && !$printable && $products_has_fclasses}
    {include file="modules/Feature_Comparison/compare_selected_button.tpl"}
    <script type="text/javascript" src="{$SkinDir}/modules/Feature_Comparison/products_check.js"></script>
  {/if}

  {if $config.Appearance.products_per_row && ($featured eq "Y" || $config.Appearance.featured_only_multicolumn eq "N")}

    {include file="customer/main/products_t.tpl"}

  {else}

    {include file="customer/main/products_list.tpl"}

  {/if}

  {if $active_modules.Feature_Comparison && !$printable && $products_has_fclasses}
    {include file="modules/Feature_Comparison/compare_selected_button.tpl"}
  {/if}

{/if}
