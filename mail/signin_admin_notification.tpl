{*
$Id: signin_admin_notification.tpl,v 1.13 2009/03/23 13:15:12 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="mail/mail_header.tpl"}


{$lng.eml_signin_admin_notification}

{$lng.lbl_profile_details}:
---------------------
{if $config.Email.show_passwords_in_notifications eq 'Y'}
{include file="mail/profile_data.tpl" show_pwd="Y"}
{else}
{include file="mail/profile_data.tpl"}
{/if}


{include file="mail/signature.tpl"}
