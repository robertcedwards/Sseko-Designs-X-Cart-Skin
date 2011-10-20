{*
$Id: editor_mode.tpl,v 1.17 2008/08/21 09:52:42 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="page_title.tpl" title=$lng.lbl_webmaster_mode}

{capture name=dialog}

{if $editor_mode_enabled}

{$lng.txt_webmaster_mode_top_text}

<br /><br />

<a href="{$catalogs.customer}/home.php?shopkey={$config.General.shop_closed_key}" onclick="javascript: if (_smarty_console) _smarty_console.close();" target="customer"><b>{$lng.lbl_open_customer_area}</b></a>

<br /><br />

{$lng.txt_to_close_webmaster_mode}

<br /><br />

<form action="editor_mode.php" method="post">
<input type="hidden" name="mode" value="quit_mode" />
<input type="submit" value="{$lng.lbl_close_webmaster_mode|strip_tags:false|escape}" />
</form>

<hr size="1" noshade="noshade" align="center" width="80%" />

{/if}

<b>{$lng.lbl_warning}</b> {$lng.txt_no_popup_block_note}<br /><br />

{$lng.txt_webmaster_mode_text}

{if $editor_mode_enabled eq ""}

{$lng.txt_start_webmaster_mode_text}

<br /><br />

<form action="editor_mode.php" method="post">
<input type="hidden" name="mode" value="start_mode" />
<input type="submit" value="{$lng.lbl_start_webmaster_mode|strip_tags:false|escape}" />
</form>

{/if}

{/capture}
{include file="dialog.tpl" title=$lng.lbl_webmaster_mode content=$smarty.capture.dialog extra='width="100%"'}
