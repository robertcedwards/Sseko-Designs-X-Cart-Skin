{*
$Id: cc_bean.tpl,v 1.15 2009/05/18 11:15:57 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<h1>Bean Stream</h1>
{$lng.txt_cc_configure_top_text}
<br /><br />
{capture name=dialog}
<div align="center">{$lng.lbl_cc_bean_note}</div>
<form action="cc_processing.php?cc_processor={$smarty.get.cc_processor|escape:"url"}" method="post">
<table cellspacing="10" align="center">
<tr>
<td colspan="2">&nbsp;</td>
</tr>
<tr>
<td>{$lng.lbl_cc_bean_merchantid}:</td>
<td><input type="text" name="param01" size="32" value="{$module_data.param01|escape}" /></td>
</tr>
<tr>
<td>{$lng.lbl_cc_order_prefix}:</td>
<td><input type="text" name="param04" size="32" value="{$module_data.param04|escape}" /></td>
</tr>
<tr>
<td colspan="2">&nbsp;</td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" value="{$lng.lbl_update|strip_tags:false|escape}" /></td>
</tr>
</table>
</form>
{/capture}
{include file="dialog.tpl" title=$lng.lbl_cc_settings content=$smarty.capture.dialog extra='width="100%"'}
