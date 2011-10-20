{*
$Id: recurring_notification_admin.tpl,v 1.8 2009/03/23 13:15:12 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/mail_header.tpl"}


{$lng.txt_billing_notification|strip_tags}

{$str}

{include file="mail/signature.tpl"}
