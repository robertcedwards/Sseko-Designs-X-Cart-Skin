{*
$Id: news_messages.tpl,v 1.3 2008/08/21 09:53:02 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $action eq "add" or $action eq "modify"}
{include file="modules/News_Management/news_messages_modify.tpl}
{else}
{include file="modules/News_Management/news_messages_list.tpl}
{/if}
