{*
$Id: meta.tpl,v 1.44 2009/10/01 12:44:45 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<meta http-equiv="Content-Type" content="text/html; charset={$default_charset|default:"iso-8859-1"}" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Language" content="{if ($usertype eq "P" || $usertype eq "A") && $current_language ne ""}{$current_language}{else}{$store_language}{/if}" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="ROBOTS" content="NOINDEX,NOFOLLOW" />
{if $__frame_not_allowed}
<script type="text/javascript">
<!--
if (top != self)
  top.location = self.location;
-->
</script>
{/if}
{include file="presets_js.tpl"}
<script type="text/javascript" src="{$SkinDir}/common.js"></script>
{if $config.Adaptives.is_first_start eq 'Y'}
<script type="text/javascript" src="{$SkinDir}/browser_identificator.js"></script>
{/if}
{if $webmaster_mode eq "editor"}
<script type="text/javascript">
<!--
var store_language = "{if ($usertype eq "P" || $usertype eq "A") && $current_language ne ""}{$current_language}{else}{$store_language}{/if}";
var catalogs = new Object();
catalogs.admin = "{$catalogs.admin}";
catalogs.provider = "{$catalogs.provider}";
catalogs.customer = "{$catalogs.customer}";
catalogs.partner = "{$catalogs.partner}";
catalogs.images = "{$ImagesDir}";
catalogs.skin = "{$SkinDir}";
var lng_labels = [];
{foreach key=lbl_name item=lbl_val from=$webmaster_lng}
lng_labels['{$lbl_name}'] = '{$lbl_val}';
{/foreach}
var page_charset = "{$default_charset|default:"iso-8859-1"}";
-->
</script>
<script type="text/javascript" language="JavaScript 1.2" src="{$SkinDir}/editor_common.js"></script>
{if $user_agent eq "ns"}
<script type="text/javascript" language="JavaScript 1.2" src="{$SkinDir}/editorns.js"></script>
{else}
<script type="text/javascript" language="JavaScript 1.2" src="{$SkinDir}/editor.js"></script>
{/if}
{/if}
{if $active_modules.Magnifier ne ""}
<script type="text/javascript" language="JavaScript 1.2" src="{$SkinDir}/swfobject.js"></script>
{/if}
{if $config.UA.browser eq 'Safari'}
  <script type="text/javascript" src="{$SkinDir}/jquery-safari.js"></script>
{else}
  <script type="text/javascript" src="{$SkinDir}/jquery-min.js"></script>
{/if}
<script type="text/javascript" src="{$SkinDir}/jquery-fix.js"></script>
<!--[if lt IE 7]>
<script type="text/javascript" src="{$SkinDir}/iepngfix.js"></script>
<![endif]-->

