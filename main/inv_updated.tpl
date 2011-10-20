{*
$Id: inv_updated.tpl,v 1.6 2009/09/24 09:55:28 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{$lng.txt_inv_updated}
<br />
{if $err_rows}
  {$lng.txt_inv_invalid_format}
  <br />
  {foreach from=$err_rows item=err}
    <pre>{$err}</pre>
  {/foreach}
  <br />
{/if}
{include file="buttons/go_back.tpl"}
