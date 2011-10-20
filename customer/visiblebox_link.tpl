{*
$Id: visiblebox_link.tpl,v 1.5 2009/04/21 11:16:42 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $js_enabled ne 'Y'}
  {assign var="visible" value=true}
{/if}
<div class="expand-section">
  {strip}
    <img src="{$ImagesDir}/spacer.gif" class="plus" id="{$id}_plus" alt="{$lng.lbl_click_to_open|escape}"{if $visible} style="display: none;"{/if} onclick="javascript: switchVisibleBox('{$id}');" />
    <img src="{$ImagesDir}/spacer.gif" class="minus" id="{$id}_minus" alt="{$lng.lbl_click_to_close|escape}"{if !$visible} style="display: none;"{/if} onclick="javascript: switchVisibleBox('{$id}');" />
    <a href="javascript:void(0);" onclick="javascript: switchVisibleBox('{$id}');">{$title}</a>
  {/strip}
</div>
