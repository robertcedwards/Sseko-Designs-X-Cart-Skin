{*
$Id: signin_admin_notification.tpl,v 1.8 2009/05/18 08:26:25 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="mail/html/mail_header.tpl"}

<br />{$lng.eml_signin_admin_notification}

<br />{$lng.lbl_profile_details}:

{if $config.Email.show_passwords_in_notifications eq 'Y'}
{include file="mail/html/profile_data.tpl" show_pwd="Y"}
{else}
{include file="mail/html/profile_data.tpl"}
{/if}

{include file="mail/html/signature.tpl"}

