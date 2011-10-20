{*
$Id: patch_apply_tbl.tpl,v 1.7 2009/09/01 12:07:03 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<table cellpadding="1" cellspacing="2" width="100%">
<tr>
  <td height="14" class="TableHead" nowrap="nowrap">{$lng.lbl_file}</td>
  <td height="14" class="TableHead" nowrap="nowrap" width="100">{$lng.lbl_status}</td>
</tr>
{section name=index loop=$files}
<tr {if %index.index% mod 2 eq 0} class="TableLine"{/if}>
  <td>{$files[index].orig_file}</td>
  <td>
{if $files[index].status eq "OK"}
<font color="green">{$lng.lbl_ok}</font>
{else}
<font color="red">{$files[index].status}</font>
{/if}
  </td>
</tr>
{/section}
</table>

<br /><br />

{$lng.txt_patch_status_legend}

<br /><br />

