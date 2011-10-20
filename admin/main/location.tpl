{*
$Id: location.tpl,v 1.5 2008/08/21 09:52:42 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $category_location and $cat ne ""}
<font class="NavigationPath">
{strip}
{section name=position loop=$category_location}
{if $category_location[position].1 ne "" }<a href="{$category_location[position].1|amp}" class="NavigationPath">{/if}
{$category_location[position].0}
{if $category_location[position].1 ne "" }</a>{/if}
{if %position.last% ne "true"}&nbsp;&gt;&nbsp;
{/if}
{/section}
</font>
{/strip}
<br /><br />
{/if}
