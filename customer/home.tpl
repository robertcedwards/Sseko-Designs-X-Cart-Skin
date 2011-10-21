{*
$Id: home.tpl,v 1.107 2009/05/26 13:23:24 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<?xml version="1.0" encoding="{$default_charset|default:"iso-8859-1"}"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
{config_load file="$skin_config"}
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

  {include file="customer/service_head.tpl"}
  <!--[if lt IE 7]>
  <script src="{$SkinDir}/customer/iefix.js" type="text/javascript"></script>
  <![endif]-->
  <meta name="google-site-verification" content="">
  <meta name="author" content="Sseko Designs">
  <meta name="Copyright" content="Copyright Sseko Designs 2011. All Rights Reserved.">
  <meta name="DC.title" content="Sseko Designs">
  <meta name="DC.subject" content="Every Sandal has a story">
  <meta name="DC.creator" content="WeCreativeAgency.com">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <link rel="shortcut icon" href="{$SkinDir}/_/img/favicon.ico">
  <link rel="apple-touch-icon" href="{$SkinDir}/_/img/apple-touch-icon.png">
  <link rel="stylesheet" href="{$SkinDir}/_/js/unoslider.css">
  <link rel="stylesheet" href="{$SkinDir}/_/js/fancybox/jquery.fancybox-1.3.4.css" type="text/css" media="screen" />
<link rel="stylesheet" href="{$SkinDir}/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="{$SkinDir}/_/js/themes/text/theme.css" type="text/css" media="screen" />
{literal}<script> 
// Edit to suit your needs.
var ADAPT_CONFIG = {
  path: '/new/skin1/_/js/css/',
  dynamic: true,
  range: [
    '0px    to 760px  = mobile.min.css',
    '760px  to 960px  = 720.min.css',
    '960px  to 5000px = 960.min.css',
  ]
};
</script> 

{/literal}
<script src="{$SkinDir}/_/js/adapt.min.js"></script>

</head>
<body{if $body_onload ne ''} onload="javascript: {$body_onload}"{/if} class="{if $main ne "catalog" || $current_category.category ne ""}normal-page{else}welcome-page{/if}{foreach from=$container_classes item=c} {$c}{/foreach}">
  <div class="container_12 wrapper ">
  {include file="customer/head.tpl"}
  <div id="center" class="grid_12">
          
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
          
        </div>
        {if $main ne "catalog" || $current_category.category ne ""}
        <div id="left-bar" class="grid_3">
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script src="{$SkinDir}/_/js/modernizr-1.7.min.js"></script>
<script src="{$SkinDir}/_/js/unoslider.js"></script>

<script type="text/javascript" src="{$SkinDir}/_/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
{literal}
<script type="text/javascript">
    $(document).ready(function(){
        var timer;
        $('#menu li').hover(
            function() {
                if(timer){
                    clearTimeout(timer);
                    timer = null;
                }
                $(this).children('.sub-menu').fadeIn();
            },
            function() {
                timer = setTimeout(function(){
                    $('.sub-menu').fadeOut();
                    }, 1000);
                }
           );
       $("a.inlineimg").fancybox({'hideOnContentClick': true}); 
       $('#main-slider').unoslider({width: 700,
          height: 254}); 
      });
</script>

{/literal}
  </div>
</div>
</body>
</html>
