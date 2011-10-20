{*
$Id: signin_notification.tpl,v 1.14 2009/03/23 13:15:12 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="mail/mail_header.tpl"}


{$lng.eml_dear|substitute:"customer":"`$userinfo.title` `$userinfo.firstname` `$userinfo.lastname`"},

{$lng.eml_signin_notification}

{$lng.lbl_your_profile}:
---------------------
{if $config.Email.show_passwords_in_user_notificat eq 'Y'}
{include file="mail/profile_data.tpl" show_pwd="Y"}
{else}
{include file="mail/profile_data.tpl"}
{/if}


{include file="mail/signature.tpl"}
