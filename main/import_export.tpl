{*
$Id: import_export.tpl,v 1.4 2008/08/21 09:52:51 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $mode eq "export"}
{include file="page_title.tpl" title=$lng.lbl_export_data}

{else}
{include file="page_title.tpl" title=$lng.lbl_import_data}
{/if}

{$lng.txt_import_data_top_text}

<br /><br />

<!-- IN THIS SECTION -->

{include file="dialog_tools.tpl"}

<!-- IN THIS SECTION -->

<br />

{if $mode eq "export"}
{include file="main/export.tpl"}

{else}
{include file="main/import.tpl"}
{/if}

