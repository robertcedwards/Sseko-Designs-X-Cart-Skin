{*
$Id: import_option_password_crypt.tpl,v 1.8 2009/04/18 06:33:03 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<table cellpadding="1" cellspacing="1" width="100%">
<tr>
  <td><b>{$lng.lbl_imported_customer_passwords_encrypted}:</b></td>
</tr>
<tr>
  <td><select name="options[crypt_password]">
  <option value="Y"{if $import_data.options.crypt_password eq 'Y' || $import_data eq ''} selected="selected"{/if}>{$lng.lbl_yes}</option>
  <option value=""{if $import_data.options.crypt_password eq '' && $import_data ne ''} selected="selected"{/if}>{$lng.lbl_no}</option>
  </select ></td>
</tr>
</table>
