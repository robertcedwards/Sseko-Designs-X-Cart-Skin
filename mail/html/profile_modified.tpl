{*
$Id: profile_modified.tpl,v 1.10 2009/05/18 08:26:25 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="mail/html/mail_header.tpl"}

<br />{$lng.eml_dear|substitute:"customer":"`$userinfo.title` `$userinfo.firstname` `$userinfo.lastname`"},

<br />{$lng.txt_profile_modified}

<br />{$lng.lbl_your_profile}:

{include file="mail/html/profile_data.tpl"}

{include file="mail/html/signature.tpl"}
