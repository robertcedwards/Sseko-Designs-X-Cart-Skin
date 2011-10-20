{*
$Id: visiblebox_link.tpl,v 1.12 2009/06/09 08:04:21 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $js_enabled ne 'Y'}{assign var="visible" value=true}{/if}
<table cellspacing="1" cellpadding="3">
<tr>
  <td class="ExpandSectionMark" id="close{$mark}" style="{if $visible}display: none; {/if}" onclick="javascript: visibleBox('{$mark}');"><img src="{$ImagesDir}/plus.gif" alt="{$lng.lbl_click_to_open|escape}" /></td>
  <td class="ExpandSectionMark" id="open{$mark}" style="{if !$visible}display: none; {/if}" onclick="javascript: visibleBox('{$mark}');"><img src="{$ImagesDir}/minus.gif" alt="{$lng.lbl_click_to_close|escape}" /></td>
  <td nowrap="nowrap"><a href="javascript:void(0);" onclick="javascript: visibleBox('{$mark}');"><b>{$title}</b></a></td>
</tr>
</table>

