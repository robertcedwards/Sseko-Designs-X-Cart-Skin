{*
$Id: newsletter_admin.tpl,v 1.9 2009/03/23 13:15:11 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="mail/mail_header.tpl"}


{$lng.txt_new_subscriber|strip_tags}

{$email}

{include file="mail/signature.tpl"}
