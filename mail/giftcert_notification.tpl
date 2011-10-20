{*
$Id: giftcert_notification.tpl,v 1.7 2008/08/21 09:52:48 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/mail_header.tpl"}

{$lng.eml_gc_notification|substitute:"recipient":$giftcert.recipient}

{$lng.eml_gc_copy_sent|substitute:"email":$giftcert.recipient_email}:

=== /start/ ==============================================================

{include file="mail/giftcert.tpl"}


=== /end/ ================================================================

{include file="mail/signature.tpl"}
