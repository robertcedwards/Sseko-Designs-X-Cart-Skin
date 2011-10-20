{*
$Id: publicity.tpl,v 1.9 2009/05/13 09:37:21 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<br />
{capture name=dialog}
{$lng.txt_publicity_msg}
{/capture}
{include file="dialog.tpl" title=$lng.lbl_publicity content=$smarty.capture.dialog extra='width="100%"'}
