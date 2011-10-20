{*
$Id: check_all_row.tpl,v 1.3 2008/11/25 09:01:05 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<script type="text/javascript" src="{$SkinDir}/change_all_checkboxes.js"></script>
<div>
  <a href="javascript:void(0);" onclick="javascript: checkAll(true, document.{$form}, '{$prefix}');">{$lng.lbl_check_all}</a>
  /
  <a href="javascript:void(0);" onclick="javascript: checkAll(false, document.{$form}, '{$prefix}');">{$lng.lbl_uncheck_all}</a>
</div>
