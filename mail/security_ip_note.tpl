{*
$Id: security_ip_note.tpl,v 1.3 2008/08/21 09:52:50 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/mail_header.tpl"}

{if $mode eq 'L'}
{$lng.txt_security_ip_login_note|substitute:"date":$date:"local_login":$local_login:"ip":$ip:"url":$url}
{else}
{$lng.txt_security_ip_note|substitute:"date":$date:"local_login":$local_login:"ip":$ip:"url":$url}
{/if}

{include file="mail/signature.tpl"}
