{*
$Id: subscriptions_admin.tpl,v 1.30 2009/09/01 12:07:05 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="page_title.tpl" title=$lng.lbl_subscriptions_management}

{$lng.txt_subscriptions_management_top_text}

<br /><br />

{capture name=searchdialog}

<form name="searchform" action="orders.php" method="get">
<input type="hidden" name="mode" value="subscriptions" />
<input type="hidden" name="action" value="search" />

<table>

<tr>
  <td height="10" class="FormButton" nowrap="nowrap">{$lng.lbl_productid}:</td>
  <td width="10" height="10"></td>
  <td height="10"><input type="text" name="search_productid" size="10" value="{$subscription_search.search_productid|escape}" /></td>
</tr>

<tr>
  <td height="10" class="FormButton" nowrap="nowrap">{$lng.lbl_product_title}:</td>
  <td width="10" height="10"></td>
  <td height="10"><input type="text" name="search_producttitle" size="40" value="{$subscription_search.search_producttitle|escape}" /></td>
</tr>

<tr>
  <td height="10" class="FormButton" nowrap="nowrap">{$lng.lbl_customer_login}:</td>
  <td width="10" height="10"></td>
  <td height="10"><input type="text" name="search_customerlogin" size="20" value="{$subscription_search.search_customerlogin|escape}" /></td>
</tr>

<tr>
  <td colspan="2">&nbsp;</td>
  <td class="SubmitBox">
<input type="submit" value="{$lng.lbl_search|strip_tags:false|escape}" />
<input type="button" value="{$lng.lbl_list_all|strip_tags:false|escape}" onclick="javascript: document.searchform.action.value='listall'; document.searchform.submit();"/>
  </td>
</tr>

</table>
</form>

{/capture}


{if $subscriptions_info}

<br /><br />

{capture name=dialog}

{$lng.txt_subscr_table_format}

<br />
<b>{$lng.txt_note}:</b> {$lng.lbl_order_status_codes}:
<b>Q</b> - {$lng.lbl_queued},
<b>P</b> - {$lng.lbl_processed},
<b>B</b> - {$lng.lbl_backordered},
<b>D</b> - {$lng.lbl_declined},
<b>F</b> - {$lng.lbl_failed},
<b>C</b> - {$lng.lbl_complete}.

<br /><br />

<table cellpadding="0" cellspacing="1" width="100%">

<tr class="TableHead">
  <td width="20%" colspan="2">{$lng.lbl_customer}</td>
  <td width="25%" align="left">{$lng.lbl_subscription_date}</td>
  <td width="25%" align="left">{$lng.lbl_last_payed_date}</td>
  <td width="30%" align="left" colspan="2">{$lng.lbl_status}</td>
</tr>

{section name=sub loop=$subscriptions_info}

<tr>
  <td height="20" colspan="6" bgcolor="#eeeeee">
  <a href="product.php?productid={$subscriptions_info[sub].productid}"><b>{$subscriptions_info[sub].product}</b></a> 
  (<a href="javascript:void(0);" onclick="javascript: window.open('calendar.php?productid={$subscriptions_info[sub].productid}','calendar','width=800,height=750,toolbar=no,status=no,scrollbars=yes,resizable=yes,menubar=no,location=no,direction=no');">{$subscriptions_info[sub].next_pay_date}</a>): 
  {$subscriptions_info[sub].subscribers_num} {$lng.lbl_subscribers}
  </td>
</tr>

{section name=sub1 loop=$subscriptions_info[sub].customers}

<tr>
<td width="5">&nbsp;</td>
  <td>

<form name="subscription_form{$subscriptions_info[sub].customers[sub1].subscriptionid}" method="post" action="orders.php?mode=subscriptions&amp;action={$smarty.get.action|escape:"html"}&amp;search_productid={$smarty.get.search_productid|escape:"html"}&amp;search_producttitle={$smarty.get.search_producttitle|escape:"html"}&amp;search_customerlogin={$smarty.get.search_customerlogin|escape:"html"}">
<input type="hidden" name="subscriptionid" value="{$subscriptions_info[sub].customers[sub1].subscriptionid}" />
<input type="hidden" name="charge" value="" />
<input type="hidden" name="subscription_status" value="" />
</form>
<a href="{$catalogs.admin}/user_modify.php?user={$subscriptions_info[sub].customers[sub1].login}&amp;usertype=C">{$subscriptions_info[sub].customers[sub1].login}</a>
  </td>
  <td><a href="{$catalogs.admin}/order.php?orderid={$subscriptions_info[sub].customers[sub1].orderid}">{$subscriptions_info[sub].customers[sub1].date} ({$subscriptions_info[sub].customers[sub1].status})</a></td>
  <td><a href="{$catalogs.admin}/order.php?orderid={$subscriptions_info[sub].customers[sub1].last_payed_orderid}">{$subscriptions_info[sub].customers[sub1].last_payed_date} ({$subscriptions_info[sub].customers[sub1].last_payed_order_status})</a></td>
  <td>
  <select onchange="javascript: document.subscription_form{$subscriptions_info[sub].customers[sub1].subscriptionid}.subscription_status.value = this.value; document.subscription_form{$subscriptions_info[sub].customers[sub1].subscriptionid}.submit();"{if $subscriptions_info[sub].customers[sub1].subscription_status eq "Unsubscribed"} disabled="disabled"{/if}>
{section name=status loop=$sub_status}
    <option value="{$sub_status[status]}"{if $sub_status[status] eq $subscriptions_info[sub].customers[sub1].subscription_status} selected="selected"{/if}>{$sub_status[status]}</option>
{/section}
  </select>
  </td>
  <th align="right">{if $subscriptions_info[sub].customers[sub1].subscription_status ne "Unsubscribed"}<a href="javascript:document.subscription_form{$subscriptions_info[sub].customers[sub1].subscriptionid}.charge.value='Y'; document.subscription_form{$subscriptions_info[sub].customers[sub1].subscriptionid}.submit();" style="color: #DD3300;">{$lng.lbl_charge}</a>{else}&nbsp;{/if}</th>
</tr>

{if %sub1.last%}
{else}
<tr>
  <td><img src="{$ImagesDir}/spacer.gif" class="Spc" alt="" /><br /></td>
  <td colspan="5" class="TableHead"><img src="{$ImagesDir}/spacer.gif" class="Spc" alt="" /><br /></td>
</tr>

{/if}

{/section}

{/section}

<tr>
  <td><img src="{$ImagesDir}/spacer.gif" class="Spc" alt="" /><br /></td>
  <td colspan="5" class="TableHead"><img src="{$ImagesDir}/spacer.gif" class="Spc" alt="" /><br /></td>
</tr>

</table>

<br />

{/capture}

{/if}

{include file="dialog.tpl" title=$lng.lbl_subsrc_search_form content=$smarty.capture.searchdialog extra='width="100%"'}

<br /><br />
{if $smarty.server.QUERY_STRING ne "mode=subscriptions"}{$lng.txt_N_results_found|substitute:"items":$products_num}{/if}

{if $subscriptions_info}
{include file="dialog.tpl" title=$lng.lbl_subscriptions content=$smarty.capture.dialog extra='width="100%"'}
{/if}
