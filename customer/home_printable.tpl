{*
$Id: home_printable.tpl,v 1.20 2009/05/26 13:23:24 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<?xml version="1.0" encoding="{$default_charset|default:"iso-8859-1"}"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
{config_load file="$skin_config"}
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  {include file="customer/service_head.tpl"}
</head>
<body{$reading_direction_tag}{if $body_onload ne ''} onload="javascript: {$body_onload}"{/if} class="printable{foreach from=$container_classes item=c} {$c}{/foreach}">
<div id="page-container">
  <div id="page-container2">

    <div id="header">
      {include file="customer/head.tpl"}
    </div>

    <div id="content-container">
      <div id="content-container2">
        <div id="center">
          <div id="center-main">
            {include file="customer/evaluation.tpl"}
<!-- central space -->

            {include file="customer/bread_crumbs.tpl"}

            {if $gcheckout_enabled && $main ne "cart" && $main ne "checkout" && $main ne "anonymous_checkout" && $main ne "order_message"}
              {include file="modules/Google_Checkout/gcheckout_top_button.tpl"}
            {/if}

            {include file="customer/dialog_message.tpl"}

            {if $page_title}
              <h1>{$page_title}</h1>
            {/if}

            {if $active_modules.Special_Offers ne ""}
              {include file="modules/Special_Offers/customer/new_offers_message.tpl"}
            {/if}

            {include file="customer/home_main.tpl"}

<!-- /central space -->

          </div>
        </div>
      </div>

    </div>

    <div id="footer">
      {include file="customer/bottom.tpl"}
    </div>

  </div>
</div>
</body>
</html>
