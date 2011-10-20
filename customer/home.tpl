{*
$Id: home.tpl,v 1.107 2009/05/26 13:23:24 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<?xml version="1.0" encoding="{$default_charset|default:"iso-8859-1"}"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
{config_load file="$skin_config"}
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  {include file="customer/service_head.tpl"}
  <!--[if lt IE 7]>
  <script src="{$SkinDir}/customer/iefix.js" type="text/javascript"></script>
  <![endif]-->
</head>
<body{if $body_onload ne ''} onload="javascript: {$body_onload}"{/if} class="{if $main ne "catalog" || $current_category.category ne ""}normal-page{else}welcome-page{/if}{foreach from=$container_classes item=c} {$c}{/foreach}">
<div id="page-container">
  <div id="page-container2">
    <div id="content-container">
      <div id="content-container2">
        <br>
       <br>
       
        <br>
        <br>
        <div id="center">
          <div id="center-main">
            {include file="customer/evaluation.tpl"}
<!-- central space -->
            {if $gcheckout_enabled && $main ne "cart" && $main ne "checkout" && $main ne "anonymous_checkout" && $main ne "order_message"}
              {include file="modules/Google_Checkout/gcheckout_top_button.tpl"}
            {/if}
            {include file="customer/dialog_message.tpl"}
            {if $page_title}
              <h1>{$page_title|escape}</h1>
            {/if}
            {if $active_modules.Special_Offers && ($main ne "catalog" || $current_category.category ne "")}
              {include file="modules/Special_Offers/customer/new_offers_message.tpl"}
            {/if}
            {include file="customer/home_main.tpl"}
<!-- /central space -->
          </div>
        </div>
        {if $main ne "catalog" || $current_category.category ne ""}
        <div id="left-bar">
          {if $categories && ($active_modules.Flyout_Menus || $config.General.root_categories eq "Y" || $subcategories)}
            {include file="customer/categories.tpl" }
          {/if}
          {if $active_modules.SnS_connector && $config.SnS_connector.sns_display_button eq 'Y'}
            {include file="modules/SnS_connector/button.tpl"}
          {/if}
<a href="http://eepurl.com/bEuBj" target="_blank"><img style="margin-bottom:10px;"  src="/skin1/images/fashion_mosaic/newsletter.jpg" alt="Newsletter" /></a>
          {include file="customer/menu_cart.tpl" }
          {if $active_modules.Feature_Comparison && $comparison_products ne ''}
            {include file="modules/Feature_Comparison/product_list.tpl" }
          {/if}
          {if $active_modules.Manufacturers ne "" and $config.Manufacturers.manufacturers_menu eq "Y"}
            {include file="modules/Manufacturers/menu_manufacturers.tpl" }
          {/if}
          {include file="customer/special.tpl"}
          {if $active_modules.Survey && $menu_surveys}
            {foreach from=$menu_surveys item=menu_survey}
              {include file="modules/Survey/menu_survey.tpl"}
            {/foreach}
          {/if}
          {include file="customer/help/menu.tpl"}
          {include file="customer/news.tpl"}
          {if $active_modules.Interneka}
            {include file="modules/Interneka/menu_interneka.tpl" }
          {/if}
        </div>
        {/if}
      </div>
    </div>
    <div class="clearing">&nbsp;</div>
    <div id="header">
      {include file="customer/head.tpl"}
    </div>
    <div id="footer">
      {if $active_modules.Users_online}
        {include file="modules/Users_online/menu_users_online.tpl"}
      {/if}
      {include file="customer/bottom.tpl"}
    </div>
    {if $active_modules.SnS_connector}
      {include file="modules/SnS_connector/header.tpl"}
    {/if}
    {if $active_modules.Google_Analytics && $config.Google_Analytics.ganalytics_code}
      {include file="modules/Google_Analytics/ga_code.tpl"}
    {/if}
  </div>
</div>
</body>
</html>
