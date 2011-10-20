{*
$Id: recurring_notification_admin.tpl,v 1.8 2009/05/18 08:26:25 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/html/mail_header.tpl"}

{$lng.txt_billing_notification}

<br />
<pre>{$str}</pre>

{include file="mail/html/signature.tpl"}

