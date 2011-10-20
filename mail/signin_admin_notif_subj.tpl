{*
$Id: signin_admin_notif_subj.tpl,v 1.10 2009/07/13 06:21:09 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}{ $config.Company.company_name }: {$lng.eml_signin_admin_notif_subj|substitute:"user":$full_usertype}
