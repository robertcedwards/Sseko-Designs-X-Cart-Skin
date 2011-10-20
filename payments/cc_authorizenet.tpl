{*
$Id: cc_authorizenet.tpl,v 1.18 2009/05/21 06:20:36 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<h1>Authorize.Net: AIM</h1>
{$lng.txt_cc_configure_top_text}
<br /><br />
{capture name=dialog}
<img src="{$ImagesDir}/certified_cart.gif" width="213" height="68" alt="" />
<form action="cc_processing.php?cc_processor={$smarty.get.cc_processor|escape:"url"}" method="post">


<table cellspacing="10">

<tr>
<td>{$lng.lbl_cc_account_type}:</td>
<td><select name="param07">
  <option value="A"{if $module_data.param07 eq "A"} selected="selected"{/if}>Authorize.Net</option>
  <option value="W"{if $module_data.param07 eq "W"} selected="selected"{/if}>Wells Fargo</option>
</select></td>
</tr>

<tr>
<td>{$lng.lbl_cc_authorizenet_login}:</td>
<td><input type="text" name="param01" size="24" maxlength="20" value="{$module_data.param01|escape}" /></td>
</tr>

<tr>
<td>{$lng.lbl_cc_authorizenet_trans_key}:</td>
<td><input type="text" name="param02" size="24" maxlength="16" value="{$module_data.param02|escape}" /></td>
</tr>

<tr>
<td>{$lng.lbl_cc_md5_hash_value}:</td>
<td><input type="text" name="param06" size="24" value="{$module_data.param06|escape}" /></td>
</tr>

<tr>
<td>{$lng.lbl_cc_testlive_mode}:</td>
<td>
<select name="testmode">
<option value="Y"{if $module_data.testmode eq "Y"} selected="selected"{/if}>{$lng.lbl_cc_testlive_test}</option>
<option value="N"{if $module_data.testmode eq "N"} selected="selected"{/if}>{$lng.lbl_cc_testlive_live}</option>
</select>
<br /><font class="SmallText">{$lng.lbl_cc_authorizenet_test_note}</font>
</td>
</tr>

<tr>
<td>{$lng.lbl_cc_order_prefix}:</td>
<td><input type="text" name="param04" size="36" value="{$module_data.param04|escape}" /></td>
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

<br />
<center>{$lng.txt_vbv_admin_note|substitute:"ImagesDir":$ImagesDir}
{/capture}
{include file="dialog.tpl" title=$lng.lbl_cc_settings content=$smarty.capture.dialog extra='width="100%"'}
