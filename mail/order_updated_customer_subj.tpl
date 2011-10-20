{*
$Id: order_updated_customer_subj.tpl,v 1.3 2008/08/21 09:52:49 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}{ $config.Company.company_name }: {$lng.eml_order_updated_customer_subj|substitute:"orderid":$order.orderid}
