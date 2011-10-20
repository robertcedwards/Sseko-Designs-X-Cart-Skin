{*
$Id: dialog_tools.tpl,v 1.16 2009/03/23 13:15:07 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $dialog_tools_data}

{assign var="left" value=$dialog_tools_data.left}
{assign var="right" value=$dialog_tools_data.right}
{if $dialog_tools_data.columns}
{assign var="columns" value=$dialog_tools_data.columns}
{else}
{assign var="columns" value=1}
{/if}

<table cellpadding="0" cellspacing="0" width="100%">

<tr> 
<td height="21" valign="bottom">
<table width="100%" cellspacing="0" cellpadding="0">

<tr>
{if $left or $dialog_tools_data.mc_left}
<td class="NavDialogTitle1"><font class="NavDialogTitle">{$lng.lbl_in_this_section}:</font></td>
{/if}
{if $right}
<td class="NavDialogTitle2"><font class="NavDialogTitle">{$lng.lbl_see_also}:</font></td>
{/if}
</tr>

</table></td>
</tr>

<tr> 
<td class="NavDialogBorder">
<table cellpadding="10" cellspacing="1" width="100%">

<tr> 
<td valign="top" class="NavDialogBox">
<table cellpadding="0" cellspacing="1" width="100%">

<tr>
{if $left or $dialog_tools_data.mc_left}{* If left or multi-column left is defined *}
<td width="50%" valign="top">
{if $columns gt 1}

{if $dialog_tools_data.mc_left}
{assign_ext var="table_rows" value=$dialog_tools_data.mc_left}
{else}
{assign_ext var="table_rows[0]" value=$left}
{/if}

{foreach from=$table_rows item=table_row}

{if $table_row.title ne ""}
<br />
{include file="main/subheader.tpl" title=$table_row.title class="red"}
{/if}

{assign var="left" value=$table_row.data}

<table cellpadding="1" cellspacing="1" width="100%">

<tr>
{section name=col loop=$columns}
<td width="{$table_row.cell_width}%" valign="top">

{multi x=$table_row.rows y=%col.index% assign="start_row"}

{section name=dt1 loop=$left start=$start_row max=$table_row.rows}
{include file="dialog_tools_cell.tpl" cell=$left[dt1]}
{/section}

</td>
{/section}
</tr>

</table>

{/foreach}

{else}

{foreach from=$left item=cell}
{include file="dialog_tools_cell.tpl" cell=$cell}
{/foreach}

{/if}
</td>
{/if}

{if $right}

<td valign="top">
{foreach from=$right item=cell}
{include file="dialog_tools_cell.tpl" cell=$cell}
{/foreach}
</td>

{/if}

</tr>

</table></td>
</tr>

</table></td>
</tr>

</table>

{/if}

