{*
$Id: submit.tpl,v 1.2 2008/11/05 12:22:27 cray Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $button_title eq ''}
{include file="customer/buttons/button.tpl" button_title=$lng.lbl_submit}
{else}
{include file="customer/buttons/button.tpl" button_title=$button_title}
{/if}
