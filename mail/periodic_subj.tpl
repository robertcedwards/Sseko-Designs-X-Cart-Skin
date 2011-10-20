{*
$Id: periodic_subj.tpl,v 1.2 2008/08/21 09:52:49 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}{ $config.Company.company_name }: {$lng.eml_periodic_subject|substitute:"period":$periodic_subject_period}
