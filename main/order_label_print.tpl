{*
$Id: order_label_print.tpl,v 1.6 2008/08/21 09:52:51 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{$order.tracking}
  {$customer.s_firstname|default:$customer.firstname}
  {$customer.s_lastname|default:$customer.lastname}

  {$customer.s_address}
  {$customer.s_address_2}
  {$customer.s_city} {$customer.s_state_text}
  {$customer.s_zipcode} {$customer.s_country_text}

