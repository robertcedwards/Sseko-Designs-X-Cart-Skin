{*
$Id: preview.tpl,v 1.9 2009/09/01 12:07:03 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $template}
  {config_load file="$skin_config"}
  {if $use_default_css}
    <link rel="stylesheet" type="text/css" href="{$SkinDir}/skin1_admin.css" />
  {/if}
  {include file=$template}
{/if}
