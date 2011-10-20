{*
$Id: menu_box.tpl,v 1.3 2009/03/13 10:08:00 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

{capture name=menu1}
<div class="menu-box first-box">
<a href="{$catalogs.admin}/orders.php?date=M" class="VertMenuItems">{$lng.lbl_this_month_orders}</a><br />
<a href="{$catalogs.admin}/orders.php" class="VertMenuItems">{$lng.lbl_search_orders_menu}</a><br />
{if $active_modules.Subscriptions ne ""}
{include file="modules/Subscriptions/subscriptions_menu.tpl"}<br />
{/if}
{if $active_modules.RMA ne ""}
{include file="modules/RMA/admin_menu.tpl"}<br />
{/if}
</div>
<div class="menu-box">
<a href="{$catalogs.admin}/statistics.php" class="VertMenuItems">{$lng.lbl_statistics}</a><br />
{if $active_modules.Customer_Reviews ne ""}
<a href="{$catalogs.admin}/ratings_edit.php" class="VertMenuItems">{$lng.lbl_edit_ratings}</a><br />
{/if}
{if $active_modules.Survey ne ""}
{include file="modules/Survey/admin_menu.tpl"}
{/if}
</div>
<div class="menu-box">
<a href="{$catalogs.admin}/users.php" class="VertMenuItems">{$lng.lbl_users}</a><br />
<a href="{$catalogs.admin}/memberships.php" class="VertMenuItems">{$lng.lbl_membership_levels}</a><br />
<a href="{$catalogs.admin}/titles.php" class="VertMenuItems">{$lng.lbl_titles}</a><br />
{if $active_modules.Stop_List ne ""}
{include file="modules/Stop_List/stop_list_menu.tpl"}<br />
{/if}
</div>
<div class="menu-box">
{if $active_modules.Gift_Certificates ne ""}
{include file="modules/Gift_Certificates/gc_admin_menu.tpl"}<br />
{/if}
{if $active_modules.Wishlist}
<a href="{$catalogs.admin}/wishlists.php" class="VertMenuItems">{$lng.lbl_wish_lists}</a><br />
{/if}
</div>
<div class="menu-box">
<a href="{$catalogs.admin}/file_manage.php" class="VertMenuItems">{$lng.lbl_files}</a><br />
{if $active_modules.News_Management}
<a href="{$catalogs.admin}/news.php" class="VertMenuItems">{$lng.lbl_news_management}</a><br />
{/if}
</div>
<a href="{$catalogs.admin}/import.php" class="VertMenuItems">{$lng.lbl_import_export}</a><br />
{/capture}
{include file="menu.tpl" dingbats="dingbats_categorie.gif" menu_title=$lng.lbl_management menu_content=$smarty.capture.menu1}

<br />

{capture name="menu2"}
<div class="menu-box first-box">
<a href="{$catalogs.admin}/categories.php" class="VertMenuItems">{$lng.lbl_categories}</a><br />
{if $active_modules.Manufacturers}
<a href="{$catalogs.admin}/manufacturers.php" class="VertMenuItems">{$lng.lbl_manufacturers}</a><br />
{/if}
</div>
<a href="{$catalogs.admin}/product_modify.php" class="VertMenuItems">{$lng.lbl_add_new_product}</a><br />
<a href="{$catalogs.admin}/search.php" class="VertMenuItems">{$lng.lbl_products}</a><br />
{if $active_modules.Feature_Comparison ne ""}
{include file="modules/Feature_Comparison/admin_menu.tpl"}
{/if}
{/capture}
{include file="menu.tpl" dingbats="dingbats_categorie.gif" menu_title=$lng.lbl_catalog menu_content=$smarty.capture.menu2 }

<br />

{capture name="menu3"}
<div class="menu-box first-box">
<a href="{$catalogs.admin}/configuration.php" class="VertMenuItems">{$lng.lbl_general_settings}</a><br />
</div>
<div class="menu-box">
<a href="{$catalogs.admin}/payment_methods.php" class="VertMenuItems">{$lng.lbl_payment_methods}</a><br />
<a href="{$catalogs.admin}/card_types.php" class="VertMenuItems">{$lng.lbl_credit_card_types}</a><br />
</div>
<div class="menu-box">
<a href="{$catalogs.admin}/countries.php" class="VertMenuItems">{$lng.lbl_countries}</a><br />
<a href="{$catalogs.admin}/states.php" class="VertMenuItems">{$lng.lbl_states}</a><br />
</div>
<div class="menu-box">
<a href="{$catalogs.admin}/taxes.php" class="VertMenuItems">{$lng.lbl_taxes}</a><br />
</div>
<a href="{$catalogs.admin}/configuration.php?option=Shipping" class="VertMenuItems">{$lng.lbl_menu_shipping_options}</a><br />
<a href="{$catalogs.admin}/shipping.php" class="VertMenuItems">{$lng.lbl_shipping_methods}</a><br />
{if $active_modules.UPS_OnLine_Tools ne ""}
<a href="{$catalogs.admin}/ups.php" class="VertMenuItems">{$lng.lbl_ups_online_tools}</a><br />
{/if}
{/capture}
{include file="menu.tpl" dingbats="dingbats_categorie.gif" menu_title=$lng.lbl_settings menu_content=$smarty.capture.menu3}

<br />

{capture name="menu4"}
<div class="menu-box first-box">
<a href="{$catalogs.admin}/general.php" class="VertMenuItems">{$lng.lbl_summary}</a><br />
</div>
<div class="menu-box">
<a href="{$catalogs.admin}/db_backup.php" class="VertMenuItems">{$lng.lbl_db_backup_restore}</a><br />
</div>
<div class="menu-box">
<a href="{$catalogs.admin}/modules.php" class="VertMenuItems">{$lng.lbl_modules}</a><br />
<a href="{$catalogs.admin}/languages.php" class="VertMenuItems">{$lng.lbl_languages}</a><br />
</div>
<div class="menu-box">
<a href="{$catalogs.admin}/pages.php" class="VertMenuItems">{$lng.lbl_static_pages}</a><br />
<a href="{$catalogs.admin}/speed_bar.php" class="VertMenuItems">{$lng.lbl_speed_bar}</a><br />
<a href="{$catalogs.admin}/editor_mode.php" class="VertMenuItems">{$lng.lbl_webmaster_mode}</a><br />
<a href="{$catalogs.admin}/file_edit.php" class="VertMenuItems">{$lng.lbl_edit_templates}</a><br />
<a href="{$catalogs.admin}/html_catalog.php" class="VertMenuItems">{$lng.lbl_html_catalog}</a><br />
<a href="{$catalogs.admin}/images_location.php" class="VertMenuItems">{$lng.lbl_images_location}</a><br />
</div>
<a href="{$catalogs.admin}/patch.php" class="VertMenuItems">{$lng.lbl_patch_upgrade}</a><br />
{/capture}
{ include file="menu.tpl" dingbats="dingbats_categorie.gif" menu_title=$lng.lbl_administration menu_content=$smarty.capture.menu4 }

<br />
