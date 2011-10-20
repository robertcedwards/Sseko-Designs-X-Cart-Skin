{*
$Id: FAQ_HTML.tpl,v 1.9 2008/08/21 09:52:48 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{capture name=dialog}
{$lng.txt_faq}
{/capture}
{include file="dialog.tpl" title=$lng.lbl_faq content=$smarty.capture.dialog extra='width="100%"'}
