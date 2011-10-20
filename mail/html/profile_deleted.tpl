{*
$Id: profile_deleted.tpl,v 1.10 2009/05/18 08:26:25 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/html/mail_header.tpl"}

<br />{$lng.eml_dear|substitute:"customer":"`$userinfo.title` `$userinfo.firstname` `$userinfo.lastname`"},

<br />{$lng.eml_profile_deleted|substitute:"company":$config.Company.company_name}

{include file="mail/html/signature.tpl"}

