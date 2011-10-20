{*
$Id: giftcert.tpl,v 1.16 2009/03/23 13:15:07 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/mail_header.tpl"}


{$lng.eml_dear|substitute:"customer":$giftcert.recipient},

{if $giftcert.purchaser ne ""}{assign var="purchaser" value=$giftcert.purchaser}{else}{assign var="purchaser" value=$giftcert.purchaser_email}{/if}{include file="currency.tpl" value=$giftcert.amount assign="amount"}{$lng.eml_gc_header|substitute:"purchaser":$purchaser:"amount":$amount}


{$lng.lbl_message}:
{$giftcert.message}

+--------------------------------------------+
|                                            |
|   {$lng.lbl_gc_id}: {$giftcert.gcid}    
|                                            |
+--------------------------------------------+

{$lng.eml_gc_body}

{include file="mail/signature.tpl"}
