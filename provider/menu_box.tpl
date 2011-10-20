{*
$Id: menu_box.tpl,v 1.6 2009/04/17 13:52:42 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

{capture name=menu1}
<div class="menu-box first-box">
<a href="{$catalogs.provider}/orders.php?mode=new" class="VertMenuItems">{$lng.lbl_this_month_orders}</a><br />
<a href="{$catalogs.provider}/orders.php" class="VertMenuItems">{$lng.lbl_search_orders_menu}</a><br />
</div>
<div class="menu-box">
{if $active_modules.Special_Offers ne ""}
{include file="modules/Special_Offers/menu_provider.tpl"}<br />
{/if}
<a href="{$catalogs.provider}/discounts.php" class="VertMenuItems">{$lng.lbl_discounts}</a><br />
{if $active_modules.Discount_Coupons ne ""}
<a href="{$catalogs.provider}/coupons.php" class="VertMenuItems">{$lng.lbl_coupons}</a><br />
{/if}
</div>
<a href="{$catalogs.provider}/file_manage.php" class="VertMenuItems">{$lng.lbl_files}</a><br />
<a href="{$catalogs.provider}/import.php" class="VertMenuItems">{$lng.lbl_import_export}</a><br />
{/capture}
{include file="menu.tpl" dingbats="dingbats_categorie.gif" menu_title=$lng.lbl_management menu_content=$smarty.capture.menu1}

<br />

{capture name="menu2"}
<div class="menu-box first-box">
{if $active_modules.Manufacturers}
<a href="{$catalogs.provider}/manufacturers.php" class="VertMenuItems">{$lng.lbl_manufacturers}</a><br />
</div>
<div class="menu-box">
{/if}
<a href="{$catalogs.provider}/product_modify.php" class="VertMenuItems">{$lng.lbl_add_new_product}</a><br />
<a href="{$catalogs.provider}/search.php" class="VertMenuItems">{$lng.lbl_products}</a><br />
{if $active_modules.Product_Configurator ne ""}
{include file="modules/Product_Configurator/pconf_menu_provider.tpl"}<br />
{/if}
{if $active_modules.Feature_Comparison ne ""}
{include file="modules/Feature_Comparison/admin_menu.tpl"}
{/if}
{if $active_modules.Extra_Fields ne ""}
<a href="{$catalogs.provider}/extra_fields.php" class="VertMenuItems">{$lng.lbl_extra_fields}</a><br />
{/if}
</div>
<a href="{$catalogs.provider}/inv_update.php" class="VertMenuItems">{$lng.lbl_update_inventory}</a><br />
{/capture}
{include file="menu.tpl" dingbats="dingbats_categorie.gif" menu_title=$lng.lbl_catalog menu_content=$smarty.capture.menu2 }

<br />

{capture name="menu3"}
<div class="menu-box first-box">
<a href="{$catalogs.provider}/general.php" class="VertMenuItems">{$lng.lbl_summary}</a><br />
</div>
<div class="menu-box">
<a href="{$catalogs.provider}/zones.php" class="VertMenuItems">{$lng.lbl_destination_zones}</a><br />
</div>
<div class="menu-box">
<a href="{$catalogs.provider}/taxes.php" class="VertMenuItems">{$lng.lbl_tax_rates}</a><br />
</div>
{if $config.Shipping.enable_shipping eq "Y"}
<a href="{$catalogs.provider}/shipping_rates.php" class="VertMenuItems">{$lng.lbl_shipping_charges}</a><br />
{if $config.Shipping.realtime_shipping eq "Y"}
<a href="{$catalogs.provider}/shipping_rates.php?type=R" class="VertMenuItems">{$lng.lbl_shipping_markups}</a><br />
{/if}
{/if}
{/capture}
{include file="menu.tpl" dingbats="dingbats_categorie.gif" menu_title=$lng.lbl_settings menu_content=$smarty.capture.menu3}

<br />

