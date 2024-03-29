{*
$Id: cc_netbillingpf.tpl,v 1.5 2009/05/21 06:20:37 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<h1>{$module_params.module_name}</h1>
{$lng.txt_cc_configure_top_text}
<br /><br />
{$lng.lbl_cc_netbillingpf_top_note|substitute:"current_location":$current_location:"processor":$module_data.processor}
<br /><br />
{capture name=dialog}
<form action="cc_processing.php?cc_processor={$smarty.get.cc_processor}" method="post">

<table cellspacing="10">
<tr>
<td>{$lng.lbl_cc_netbillingpf_account}:</td>
<td><input type="text" name="param01" size="32" value="{$module_data.param01|escape}" /></td>
</tr>
<tr>
<td>{$lng.lbl_cc_netbillingpf_sitetag}:</td>
<td><input type="text" name="param02" size="32" value="{$module_data.param02|escape}" /></td>
</tr>
<tr>
<td>{$lng.lbl_cc_netbillingpf_cryptkey}:</td>
<td><input type="text" name="param03" size="32" value="{$module_data.param03|escape}" /></td>
</tr>
<td>{$lng.lbl_cc_netbillingpf_order_prefix}:</td>
<td><input type="text" name="param04" size="32" value="{$module_data.param04|escape}" /></td>
</tr>
<td>{$lng.lbl_cc_netbillingpf_formid}:</td>
<td><input type="text" name="param05" size="32" value="{$module_data.param05|escape}" /></td>
</tr>
<tr>
<td>{$lng.lbl_use_preauth_method}:</td>
<td>
  <select name="use_preauth">
    <option value="">{$lng.lbl_auth_and_capture_method}</option>
    <option value="Y"{if $module_data.use_preauth eq 'Y'} selected="selected"{/if}>{$lng.lbl_auth_method}</option>
  </select>
</td>
</tr>
</table>
<br /><br />
<input type="submit" value="{$lng.lbl_update|strip_tags:false|escape}" />
</form>

{/capture}
{include file="dialog.tpl" title=$lng.lbl_cc_settings content=$smarty.capture.dialog extra='width="100%"'}
