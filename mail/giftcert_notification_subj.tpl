{*
$Id: giftcert_notification_subj.tpl,v 1.7 2008/08/21 09:52:48 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}{ $config.Company.company_name }: {if $giftcert.recipient}{assign var="rcpt" value=$giftcert.recipient}{else}{assign var="rcpt" value=$giftcert.recipient_email}{/if}{$lng.eml_giftcert_notification_subj|substitute:"recipient":$rcpt}
