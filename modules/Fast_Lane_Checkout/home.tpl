{*
$Id: home.tpl,v 1.19 2009/05/26 13:23:24 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<?xml version="1.0" encoding="{$default_charset|default:"iso-8859-1"}"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
{config_load file="$skin_config"}
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  {include file="customer/service_head.tpl"}
  <link rel="stylesheet" type="text/css" href="{$SkinDir}/modules/Fast_Lane_Checkout/{#CSSFilePrefix#}.css" />
  <!--[if lt IE 7]>
  <script src="{$SkinDir}/customer/iefix.js" type="text/javascript"></script>
  <![endif]-->
</head>
<body{$reading_direction_tag}{if $body_onload ne ''} onload="javascript: {$body_onload}"{/if}>
<div id="page-container" class="flc-container">
  <div id="page-container2">
    <div id="content-container">
      <div id="content-container2">
        <div id="center">
          <div id="center-main">
            {include file="customer/evaluation.tpl"}
            {include file="customer/dialog_message.tpl"}

            {if $checkout_step ge 0}

              {include file="modules/Fast_Lane_Checkout/tabs_menu.tpl"}

            {else}

              <div class="flc-buttons">
                {if !$std_checkout_disabled}
                  {include file="customer/buttons/button.tpl" button_title=$lng.lbl_checkout style="div_button" href="cart.php?mode=checkout" additional_button_class="flc-3-button"}
                {/if}
                {include file="customer/buttons/button.tpl" button_title=$lng.lbl_continue_shopping style="div_button" href="home.php" additional_button_class="flc-1-button"}
              </div>
              <div class="clearing"></div>

            {/if}

            {include file="modules/Fast_Lane_Checkout/home_main.tpl"}

          </div>
        </div>
      </div>
    </div>

    <div class="clearing">&nbsp;</div>

    <div id="header">
      {include file="customer/head.tpl"}
    </div>

    <div id="footer">
      {include file="customer/bottom.tpl"}
    </div>

    {if $active_modules.SnS_connector}
      {include file="modules/SnS_connector/header.tpl"}
    {/if}

    {if $active_modules.Google_Analytics ne "" && $config.Google_Analytics.ganalytics_code ne ""}
      {include file="modules/Google_Analytics/ga_code.tpl"}
    {/if}

  </div>
</div>
</body>
</html>
