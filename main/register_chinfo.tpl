{*
$Id: register_chinfo.tpl,v 1.16 2008/11/24 11:14:57 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $hide_header ne "Y"}
<tr valign="middle">
<td height="20" colspan="3"><font class="RegSectionTitle">{$lng.lbl_check_information}</font><hr size="1" noshade="noshade" /></td>
</tr>
{/if}

<tr valign="middle">
<td align="right">
<script type="text/javascript">
<!--
requiredFields[requiredFields.length] = new Array('check_name','{$lng.lbl_ch_name|escape}');
requiredFields[requiredFields.length] = new Array('check_ban','{$lng.lbl_ch_bank_account|escape}');
requiredFields[requiredFields.length] = new Array('check_brn','{$lng.lbl_ch_bank_routing|escape}');
{if $payment_cc_data.disable_ccinfo eq "N"}
requiredFields[requiredFields.length] = new Array('check_number','{$lng.lbl_ch_number|escape}');
{/if}
-->
</script>
{$lng.lbl_ch_name}</td>
<td><font class="Star">*</font></td>
<td nowrap="nowrap">
<input type="text" id="check_name" name="check_name" size="32" maxlength="20" value="{if $userinfo.lastname ne ""}{$userinfo.firstname} {$userinfo.lastname}{/if}" />
</td>
</tr>

<tr valign="middle">
<td align="right">{$lng.lbl_ch_bank_account}</td>
<td><font class="Star">*</font></td>
<td nowrap="nowrap">
<input type="text" id="check_ban" name="check_ban" size="32" maxlength="20" value="" />
</td>
</tr>

<tr valign="middle">
<td align="right">{$lng.lbl_ch_bank_routing}</td>
<td><font class="Star">*</font></td>
<td nowrap="nowrap">
<input type="text" id="check_brn" name="check_brn" size="32" maxlength="20" value="" />
</td>
</tr>

{if $payment_cc_data.disable_ccinfo eq "N"}
<tr valign="middle">
<td align="right">{$lng.lbl_ch_number}</td>
<td><font class="Star">*</font></td>
<td nowrap="nowrap">
<input type="text" id="check_number" name="check_number" size="32" maxlength="20" value="" />
</td>
</tr>
{/if}
