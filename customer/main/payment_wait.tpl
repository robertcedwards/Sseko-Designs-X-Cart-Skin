{*
$Id: payment_wait.tpl,v 1.14 2009/09/01 12:07:03 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<?xml version="1.0" encoding="{$default_charset|default:"iso-8859-1"}"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
{config_load file="$skin_config"}
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>{$lng.msg_order_is_being_placed}</title>
  {include file="customer/meta.tpl"}
  <link rel="stylesheet" type="text/css" href="{$SkinDir}/{#CSSFilePrefix#}.css" />
  <!--[if lt IE 7]>
  <link rel="stylesheet" type="text/css" href="{$SkinDir}/{#CSSFilePrefix#}.IE6.css" />
  <![endif]-->
  <!--[if lt IE 8]>
  <link rel="stylesheet" type="text/css" href="{$SkinDir}/{#CSSFilePrefix#}.IE7.css" />
  <![endif]-->
</head>
<body{$reading_direction_tag} class="payment-wait">
<div class="payment-wait-title">
  <h1>{$lng.msg_order_is_being_placed}</h1>
  <img src="{$ImagesDir}/spacer.gif" class="payment-wait-image" alt="" />
</div>
