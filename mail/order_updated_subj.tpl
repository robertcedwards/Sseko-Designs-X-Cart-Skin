{*
$Id: order_updated_subj.tpl,v 1.1 2009/03/23 16:08:33 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}{ $config.Company.company_name }: {$lng.eml_order_updated_subj|substitute:"orderid":$order.orderid}
