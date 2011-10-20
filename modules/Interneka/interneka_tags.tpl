{*
$Id: interneka_tags.tpl,v 1.5 2008/08/21 09:53:01 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $active_modules.Interneka ne ""}
{if $config.Interneka.interneka_per_lead eq "Y"}
<!-- begin of the link -->
<img src="https://interneka.com/affiliate/WIDLink.php?WID={$config.Interneka.interneka_id}&amp;Payment=yes&amp;OrderID={$orders[oi].order.orderid}" width="1" height="1" alt="" />
<!--- end of the link --> 
{/if}
{if $config.Interneka.interneka_per_sale eq "Y"}
<!-- begin of the link -->
<img src="https://interneka.com/affiliate/WIDLink.php?WID={$config.Interneka.interneka_id}&amp;TotalCost={$orders[oi].order.subtotal}&amp;OrderID={$orders[oi].order.orderid}" width="1" height="1" alt="" />
<!--- end of the link -->
{/if}
{/if}
