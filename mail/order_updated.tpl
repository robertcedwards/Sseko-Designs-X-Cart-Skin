{*
$Id: order_updated.tpl,v 1.1 2009/03/23 16:08:33 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/mail_header.tpl"}


{$lng.eml_order_has_been_updated}

{include file="mail/order_invoice.tpl"}

{include file="mail/signature.tpl"}
