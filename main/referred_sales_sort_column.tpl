{*
$Id: referred_sales_sort_column.tpl,v 1.3 2008/08/21 09:52:51 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $search.sort eq $field_name}
{include file="buttons/sort_pointer.tpl" dir=$search.sort_direction}&nbsp;
{/if}
<a href="referred_sales.php?mode=search&amp;sort={$field_name}&amp;sort_direction={if $search.sort eq $field_name}{if $search.sort_direction eq 1}0{else}1{/if}{else}{$search.sort_direction}{/if}">{$title}</a>
