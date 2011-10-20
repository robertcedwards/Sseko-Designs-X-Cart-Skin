{*
$Id: login_error_subj.tpl,v 1.8 2008/11/06 13:39:46 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}{$lng.eml_login_error_subj|substitute:"company":$config.Company.company_name}
