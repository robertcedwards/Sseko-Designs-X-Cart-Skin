{*
$Id: search.tpl,v 1.4 2009/04/24 06:58:06 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

<h1>{$lng.lbl_search}</h1>

{capture name=dialog}

<form action="returns.php" method="post" name="searchreturnsform">
  <input type="hidden" name="mode" value="search" />

  <table cellspacing="0" class="data-table">

    <tr>
      <td class="data-name">{$lng.lbl_period_from}</td>
      <td>
        {html_select_date prefix="start_date_" time=$search_prefilled.start_date start_year=$config.Company.start_year end_year=$config.Company.end_year}
      </td>
    </tr>

    <tr>
      <td class="data-name">{$lng.lbl_period_to}</td>
      <td>
        {html_select_date prefix="end_date_" time=$search_prefilled.end_date start_year=$config.Company.start_year end_year=$config.Company.end_year}
      </td> 
    </tr>

    <tr>
      <td class="data-name">{$lng.lbl_returnid}</td>
      <td>
        <input type="text" name="search[returnid]" value="{$search_prefilled.returnid}" size="5" />
      </td>
    </tr>

    <tr>
      <td class="data-name">{$lng.lbl_status}</td>
      <td>{include file="modules/RMA/return_status.tpl" name="search[status]" extended=1 mode="select" status=$search_prefilled.status}</td>
    </tr>

    <tr>
      <td>&nbsp;</td>
      <td class="button-row">
        {include file="customer/buttons/search.tpl" type="input"}
      </td>
    </tr>

  </table>

</form>

{/capture}
{include file="customer/dialog.tpl" content=$smarty.capture.dialog title=$lng.lbl_search noborder=true}
