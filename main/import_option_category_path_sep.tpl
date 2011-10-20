{*
$Id: import_option_category_path_sep.tpl,v 1.9 2009/10/05 08:15:40 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<table cellpadding="1" cellspacing="1" width="100%">
<tr>
  <td><b>{$lng.txt_category_path_sep}:</b></td>
</tr>
<tr>
  <td><input type="text" name="options[category_sep]" value="{$import_data.options.category_sep|default:"/"|escape}" /></td>
</tr>
<tr>
  <td>{$lng.txt_category_path_sep_explain}</td>
</tr>
</table>
