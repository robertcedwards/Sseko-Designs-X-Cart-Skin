{*
$Id: business.tpl,v 1.12 2009/05/29 08:07:16 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<br /><br />
{capture name=dialog}
{$lng.txt_privacy_statement}
{/capture}
{include file="dialog.tpl" title=$lng.lbl_privacy_statement content=$smarty.capture.dialog extra='width="100%"'}
