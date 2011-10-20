{*
$Id: dialog_tools_cell.tpl,v 1.5 2008/08/21 09:52:40 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $cell.separator}
<table cellpadding="0" cellspacing="0" width="80%"><tr>
<td class="NavDialogSeparator"><img src="{$ImagesDir}/spacer.gif" alt="" /></td>
</tr></table>
{else}
<table cellspacing="0" cellpadding="0"><tr>
<td class="NavDialogCell"><a class="{if $cell.style eq "hl"}NavMenuItemsHL{else}NavMenuItems{/if}" href="{$cell.link|amp}" title="{$cell.title|escape}"{if $cell.target ne ""} target="{$cell.target}"{/if}{if $cell.onclick ne ""} onclick="{$cell.onclick}"{/if}><img src="{$ImagesDir}/nav_bullet.gif" alt="" /></a></td>
<td><a class="{if $cell.style eq "hl"}NavMenuItemsHL{else}NavMenuItems{/if}" href="{$cell.link|amp}" title="{$cell.title|escape}"{if $cell.target ne ""} target="{$cell.target}"{/if}>{$cell.title}</a></td>
</tr></table>
{/if}

