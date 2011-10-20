{*
$Id: wrong_bf_key.tpl,v 1.2 2009/09/01 12:07:04 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="mail/html/mail_header.tpl"}

<br /><br />{$lng.lbl_cannot_decrypt_password|substitute:"user":$username}

<br /><br />{$lng.txt_bf_key_internal_error}

{include file="mail/html/signature.tpl"}
