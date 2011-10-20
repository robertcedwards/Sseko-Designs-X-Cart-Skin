{*
$Id: service_head.tpl,v 1.11 2009/11/02 09:09:42 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{get_title page_type=$meta_page_type page_id=$meta_page_id}
{include file="customer/meta.tpl"}
{include file="customer/service_css.tpl"}
{if $canonical_url}
  <link rel="canonical" href="{$current_location}/{$canonical_url}" />
{/if}
{if $config.SEO.clean_urls_enabled eq "Y"}
  <base href="{$catalogs.customer}/" />
  <script src="{$SkinDir}/anchor_fix.js" type="text/javascript"></script>
{/if}
{if $smarty.get.is_install_preview}
  <script src="{$SkinDir}/install_preview_fix.js" type="text/javascript"></script>
{/if}
