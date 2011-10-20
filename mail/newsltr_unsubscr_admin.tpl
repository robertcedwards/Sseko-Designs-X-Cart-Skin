{*
$Id: newsltr_unsubscr_admin.tpl,v 1.11 2009/03/23 13:15:11 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="mail/mail_header.tpl"}


{$lng.eml_unsubscribe_admin_msg|substitute:"email":$email}

{include file="mail/signature.tpl"}
