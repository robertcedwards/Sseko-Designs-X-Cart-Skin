{*
$Id: meta.tpl,v 1.32 2009/10/13 05:44:28 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
  <meta http-equiv="Content-Type" content="text/html; charset={$default_charset|default:"iso-8859-1"}" />
  <link href="/favicon.ico" rel="SHORTCUT ICON" />
  <meta http-equiv="Content-Script-Type" content="text/javascript" />
  <meta http-equiv="Content-Style-Type" content="text/css" />
  <meta http-equiv="Content-Language" content="{$shop_language}" />
  <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
{if $printable}
  <meta name="ROBOTS" content="NOINDEX,NOFOLLOW" />
{else}
  {meta type='description' page_type=$meta_page_type page_id=$meta_page_id}
  {meta type='keywords' page_type=$meta_page_type page_id=$meta_page_id}
{/if}
  <script type="text/javascript">
<!--
{if $__frame_not_allowed && !$smarty.get.open_in_layer}
if (top != self)
    top.location = self.location;
{/if}
var number_format_dec = '{$number_format_dec}';
var number_format_th = '{$number_format_th}';
var number_format_point = '{$number_format_point}';
var store_language = '{$store_language}';
var xcart_web_dir = "{$xcart_web_dir|wm_remove|escape:javascript}";
var images_dir = "{$ImagesDir|wm_remove|escape:javascript}";
var lbl_no_items_have_been_selected = '{$lng.lbl_no_items_have_been_selected|wm_remove|escape:javascript}';
var current_area = '{$usertype}';
var currency_format = "{$config.General.currency_format|replace:'$':$config.General.currency_symbol}";
var lbl_product_minquantity_error = "{$lng.lbl_product_minquantity_error|escape:javascript}";
var lbl_product_maxquantity_error = "{$lng.lbl_product_maxquantity_error|escape:javascript}";
var lbl_product_quantity_type_error = "{$lng.lbl_product_quantity_type_error|escape:javascript}";
var is_limit = {if $config.General.unlimited_products eq 'Y'}false{else}true{/if};
-->
  </script>
  <script type="text/javascript" src="{$SkinDir}/common.js"></script>
{if $config.Adaptives.is_first_start eq 'Y'}
  <script type="text/javascript" src="{$SkinDir}/browser_identificator.js"></script>
{/if}
{if $webmaster_mode eq "editor"}
  <script type="text/javascript">
<!--
var catalogs = {ldelim}
  admin: "{$catalogs.admin|wm_remove|escape:javascript}",
  provider: "{$catalogs.provider|wm_remove|escape:javascript}",
  customer: "{$catalogs.customer|wm_remove|escape:javascript}",
  partner: "{$catalogs.partner|wm_remove|escape:javascript}",
  images: "{$ImagesDir|wm_remove|escape:javascript}",
  skin: "{$SkinDir|wm_remove|escape:javascript}"
{rdelim};
var lng_labels = [];
{foreach key=lbl_name item=lbl_val from=$webmaster_lng}
lng_labels['{$lbl_name}'] = "{$lbl_val|wm_remove|escape:javascript}";
{/foreach}
var page_charset = "{$default_charset|default:"iso-8859-1"}";
-->
  </script>
  <script type="text/javascript" src="{$SkinDir}/editor_common.js"></script>
{if $user_agent eq "ns"}
  <script type="text/javascript" src="{$SkinDir}/editorns.js"></script>
{else}
  <script type="text/javascript" src="{$SkinDir}/editor.js"></script>
{/if}
{/if}
{if $active_modules.Magnifier}
  <script type="text/javascript" src="{$SkinDir}/swfobject.js"></script>
{/if}
  {if $config.UA.browser eq 'Safari'}
    <script type="text/javascript" src="{$SkinDir}/jquery-safari.js"></script>
  {else}
    <script type="text/javascript" src="{$SkinDir}/jquery-min.js"></script>
  {/if}
  <script type="text/javascript" src="{$SkinDir}/jquery-fix.js"></script>
  <script type="text/javascript" src="{$SkinDir}/ajax.js"></script>
{if $is_admin_preview}
<script type="text/javascript">
<!--
var txt_this_form_is_for_demo_purposes = '{$lng.txt_this_form_is_for_demo_purposes|wm_remove|escape:javascript}';
var txt_this_link_is_for_demo_purposes = '{$lng.txt_this_link_is_for_demo_purposes|wm_remove|escape:javascript}';
{literal}
$.event.add(
  window,
  "load",
  function() {
    $('form').unbind('submit').bind(
      'submit',
      function() {
        alert(txt_this_form_is_for_demo_purposes);
        return false;
      }
    );
    $('a').unbind('click').bind(
      'click',
      function(e) {
        if (this.href && this.href.search(/javascript:/) != -1)
          return false;
        if (!e)
          e = event;
        if (e.stopPropagation)
          e.stopPropagation();
        else
          e.cancelBubble = true;
        alert(txt_this_link_is_for_demo_purposes);
        return false;
      }
    );
  }
);
{/literal}
-->
</script>
{/if}
  <script type="text/javascript" src="{$SkinDir}/customer/fixes.js"></script>
<!--[if lt IE 7 ]>
<script type="text/javascript" src="{$SkinDir}/iepngfix.js"></script>
<![endif]-->
<!--[if IE ]>
<script type="text/javascript" src="{$SkinDir}/iepositioning_fix.js"></script>
<![endif]-->
<script type="text/javascript" src="{$SkinDir}/customer/dropout_buttons_init.js"></script>
