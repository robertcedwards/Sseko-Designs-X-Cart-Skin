{*
$Id: promotions.tpl,v 1.43 2009/04/18 06:33:01 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="page_title.tpl" title=$lng.lbl_quick_start}

<!-- IN THIS SECTION -->

{include file="dialog_tools.tpl"}

<!-- IN THIS SECTION -->

<br />

<!-- QUICK MENU -->

{include file="main/quick_menu.tpl"}

<!-- QUICK MENU -->

<a name="qs"></a>
{capture name=dialog}

<div align="justify">{$lng.txt_how_setup_store}</div>

{literal}
<script type="text/javascript" language="JavaScript 1.2">
<!--
var url =  document.URL;
var re = /^https/;
if ( !url.match(re) ) {
  document.write("<img src=\"http://www.x-cart.com/img/background.gif\" width=\"1\" height=\"1\" alt=\"\" />");
}
-->
</script>
{/literal}

{/capture}
{include file="dialog.tpl" title=$lng.lbl_quick_start_text content=$smarty.capture.dialog extra='width="100%"'}
<br />

