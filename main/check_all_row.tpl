{*
$Id: check_all_row.tpl,v 1.5 2009/09/01 12:07:04 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<script type="text/javascript" src="{$SkinDir}/change_all_checkboxes.js"></script>
<div{if $style ne ''} style="{$style}"{/if}><a href="javascript:checkAll(true,document.{$form},'{$prefix}');">{$lng.lbl_check_all}</a> / <a href="javascript:checkAll(false,document.{$form},'{$prefix}');">{$lng.lbl_uncheck_all}</a></div>
