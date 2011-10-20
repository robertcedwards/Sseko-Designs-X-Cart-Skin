{*
$Id: title_selector.tpl,v 1.6 2009/04/18 06:33:04 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $titles}
{foreach from=$titles item=v}
  <option value="{if $use_title_id eq "Y"}{$v.titleid}{else}{$v.title_orig|escape}{/if}"{if $field eq $v.titleid} selected="selected"{/if}>{$v.title}</option>
{/foreach}
{else}
  <option value="{if $use_title_id eq "Y"}{$field}{/if}" selected="selected">{$lng.txt_no_titles_defined}</option>
{/if}
