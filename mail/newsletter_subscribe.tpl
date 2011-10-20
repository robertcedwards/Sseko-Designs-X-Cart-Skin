{*
$Id: newsletter_subscribe.tpl,v 1.11 2009/03/23 13:15:11 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/mail_header.tpl"}


{$lng.eml_subscribed}

{$lng.eml_unsubscribe_information}
{$http_location}/mail/unsubscribe.php?email={$email|escape}

{include file="mail/signature.tpl"}
