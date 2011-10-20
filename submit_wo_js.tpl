{*
$Id: submit_wo_js.tpl,v 1.9 2008/08/21 09:52:40 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<input type="submit" value="{$value|strip_tags:false|escape}" /><br />
{if $note ne "off"}
<br />{$lng.txt_js_disabled_msg}
{/if}
