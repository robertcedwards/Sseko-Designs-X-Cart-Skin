{*
$Id: newsltr_unsubscr_admin.tpl,v 1.7 2009/05/18 08:26:24 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="mail/html/mail_header.tpl"}

<br />{$lng.eml_unsubscribe_admin_msg|substitute:"email":"<b>`$email`</b>"}

{include file="mail/html/signature.tpl"}
