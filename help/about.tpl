{*
$Id: about.tpl,v 1.10 2009/05/13 09:37:21 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<br />
{capture name=dialog}
{$lng.txt_about}
{/capture}
{include file="dialog.tpl" title=$lng.lbl_about_our_site content=$smarty.capture.dialog extra='width="100%"'}
