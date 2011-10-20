{*
$Id: profile_deleted.tpl,v 1.18 2009/03/23 13:15:11 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/mail_header.tpl"}


{$lng.eml_dear|substitute:"customer":"`$userinfo.title` `$userinfo.firstname` `$userinfo.lastname`"},

{$lng.eml_profile_deleted|substitute:"company":$config.Company.company_name}

{include file="mail/signature.tpl"}
