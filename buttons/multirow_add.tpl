{*
$Id: multirow_add.tpl,v 1.6 2009/03/27 13:18:52 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<img src="{$ImagesDir}/plus.gif" alt="{$lng.lbl_add|escape}" onclick="javascript: add_inputset('{$mark}', this, {if $is_lined}true{else}false{/if}, {if $handler}{$handler}{else}false{/if});" style="cursor: pointer;" />
