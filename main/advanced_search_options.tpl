{*
$Id: advanced_search_options.tpl,v 1.4 2008/11/11 08:13:56 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $js_enabled ne 'Y'}
  {assign var="visible" value=true}
{/if}
<table cellpadding="1" cellspacing="5" width="100%">
  <tr>
    <td class="ExpandSectionPadding">&nbsp;</td>
    <td>
      <table cellpadding="2" cellspacing="2">
        <tr>
          <td {if $no_use_class eq "Y"}{else}class="ExpandSectionMark"{/if} id="close{$mark}" style="{if $visible}display: none; {/if}" onclick="javascript: visibleBox('{$mark}');"><img src="{$ImagesDir}/plus.gif" alt="{$lng.lbl_click_to_open|escape}" /></td>
          <td {if $no_use_class eq "Y"}{else}class="ExpandSectionMark"{/if} id="open{$mark}" style="{if !$visible}display: none; {/if}" onclick="javascript: visibleBox('{$mark}');"><img src="{$ImagesDir}/minus.gif" alt="{$lng.lbl_click_to_close|escape}" /></td>
          <td nowrap="nowrap" class="ExpandSectionText"><a href="javascript:void(0);" onclick="javascript: visibleBox('{$mark}');"><b>{$title}</b></a></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
