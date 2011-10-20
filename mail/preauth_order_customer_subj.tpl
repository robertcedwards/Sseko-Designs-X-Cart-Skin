{*
$Id: preauth_order_customer_subj.tpl,v 1.1 2009/10/22 13:50:47 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}{ $config.Company.company_name }: {$lng.eml_order_customer_subj|substitute:"orderid":$order.orderid}
