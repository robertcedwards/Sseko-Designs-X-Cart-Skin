{*
$Id: import_option_default_category.tpl,v 1.9 2009/04/18 06:33:03 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<table cellpadding="1" cellspacing="1" width="100%">
<tr>
  <td><b>{$lng.txt_default_category}:</b></td>
</tr>
<tr>
  <td>{include file="main/category_selector.tpl" field="options[categoryid]" categoryid=$import_data.options.categoryid|default:0}</td>
</tr>
<tr>
  <td>{$lng.txt_default_category_explain}</td>
</tr>
</table>
