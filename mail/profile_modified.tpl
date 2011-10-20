{*
$Id: profile_modified.tpl,v 1.15 2009/03/23 13:15:12 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="mail/mail_header.tpl"}


{$lng.eml_dear|substitute:"customer":"`$userinfo.title` `$userinfo.firstname` `$userinfo.lastname`"},

{$lng.txt_profile_modified}

{$lng.lbl_profile_details}:
---------------------
{include file="mail/profile_data.tpl"}


{include file="mail/signature.tpl"}
