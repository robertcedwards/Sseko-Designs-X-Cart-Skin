{*
$Id: memberships.tpl,v 1.11 2008/10/07 07:02:17 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="page_title.tpl" title=$lng.lbl_edit_membership_levels}

{include file="dialog_tools.tpl"}
<br />

{$lng.txt_edit_membership_levels_top_text}

<br /><br />

{if $active_modules.Simple_Mode}

{$lng.txt_edit_membership_levels_simple_mode_text}

{else}

{$lng.txt_edit_membership_levels_non_simple_mode_text}

{/if}

<br /><br />
{include file="main/language_selector.tpl" script="memberships.php?"}
<br />
{foreach from=$memberships key=type item=v}
{include file="admin/main/edit_memberships.tpl" type=$type levels=$v title=$memberships_lbls.$type}
<br />
{/foreach}
