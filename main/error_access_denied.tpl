{*
$Id: error_access_denied.tpl,v 1.12 2009/09/22 09:42:05 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<h1>{$lng.err_access_denied}</h1>
{$message}
{if $id ne ''}
<br /><br />
<b>{$lng.lbl_error_id}:</b> {$id}
{/if}
