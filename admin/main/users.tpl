{*
$Id: users.tpl,v 1.94 2009/05/18 09:30:25 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="page_title.tpl" title=$lng.lbl_users_management}

{$lng.txt_users_management_top_text}

<br /><br />

<!-- IN THIS SECTION -->

{include file="dialog_tools.tpl"}

<!-- IN THIS SECTION -->

<br />

{if $mode eq "" or $users eq ""}

<script type="text/javascript" src="{$SkinDir}/reset.js"></script>
<script type="text/javascript">
<!--
var searchform_def = [
  ['posted_data[substring]', ''],
  ['posted_data[by_username]', true],
  ['posted_data[by_firstname]', true],
  ['posted_data[by_lastname]', true],
  ['posted_data[by_email]', true],
  ['posted_data[by_company]', true],
  ['StartDay', '{$smarty.now|date_format:"%d"}'],
  ['StartMonth', '{$smarty.now|date_format:"%m"}'],
  ['StartYear', '{$smarty.now|date_format:"%Y"}'],
  ['EndDay', '{$smarty.now|date_format:"%d"}'],
  ['EndMonth', '{$smarty.now|date_format:"%m"}'],
  ['EndYear', '{$smarty.now|date_format:"%Y"}'],
  ['posted_data[is_export]', false],
{assign var="selected_membershipid" value=""}
{if $config.General.membership_signup eq "Y" && $search_prefilled.usertype eq "" and $search_prefilled.membershipid eq "pending_membership"}

{assign var="selected_membershipid" value="-pending_membership"}

{else}

{foreach from=$memberships item=lvls key=k}

{if $search_prefilled.usertype eq $k && $search_prefilled.membershipid eq ''}

{assign var="selected_membershipid" value=$k|cat:"-"}

{elseif $config.General.membership_signup eq "Y" && $lvls ne '' && $search_prefilled.usertype eq $k && $search_prefilled.membershipid eq "pending_membership"}

{assign var="selected_membershipid" value=$k|cat:"-pending_membership"}

{else}

{foreach from=$lvls item=v}
{if $search_prefilled.usertype eq $k && $search_prefilled.membershipid eq $v.membershipid}
{assign var="selected_membershipid" value=$k|cat:"-"|cat:$v.membershipid}
{/if}
{/foreach}

{/if}

{/foreach}

{/if}
  ['posted_data[membershipid]', ''],
  ['posted_data[registration_type]', ''],
  ['posted_data[address_type]', ''],
  ['posted_data[city]', ''],
  ['posted_data[state]', ''],
  ['posted_data[country]', ''],
  ['posted_data[zipcode]', ''],
  ['posted_data[phone]', ''],
  ['posted_data[url]', ''],
  ['posted_data[registration_date]', ''],
  ['posted_data[last_login_date]', ''],
  ['posted_data[suspended_by_admin]', ''],
  ['posted_data[auto_suspended]', ''],
  ['posted_data[orders_min]', ''],
  ['posted_data[orders_max]', ''],
  ['posted_data[date_period]', 'M']
];
-->
</script>

{$lng.txt_search_users_text}

<br /><br />

<!-- SEARCH FORM START -->

<script type="text/javascript" language="JavaScript 1.2">
<!--
var date_selected = '{if $search_prefilled.date_period eq "" or $search_prefilled.date_period eq "M"}M{else}{$search_prefilled.date_period}{/if}';
{literal}
function managedate(type, status) {

  if (type == 'address')
    var fields = new Array('posted_data[city]','posted_data[state]','posted_data[country]','posted_data[zipcode]');
  else if (type == 'date')
    var fields = new Array('StartDay','StartMonth','StartYear','EndDay','EndMonth','EndYear');
  else if (type == 'date_type') {
    status = document.searchform.elements['posted_data[registration_date]'].checked + document.searchform.elements['posted_data[last_login_date]'].checked + document.searchform.elements['posted_data[suspended_by_admin]'].checked + document.searchform.elements['posted_data[auto_suspended]'].checked;
    status = !(status != 0);
  
    for (var i = 0; i < document.searchform.elements.length; i++)
      if (document.searchform.elements[i].name == 'posted_data[date_period]')
        document.searchform.elements[i].disabled = status;
  
    disable_dates = false;
    
    if (status)
      disable_dates = true;
    else if (date_selected != 'C')
      disable_dates = true;
    
    managedate('date', disable_dates);
    return true;

  }
  
  for (var i in fields)
    document.searchform.elements[fields[i]].disabled = status;
}
{/literal}
-->
</script>

{capture name=dialog}

<br />

<form name="searchform" action="users.php" method="post">

<table cellpadding="0" cellspacing="0" width="100%">

<tr>
  <td>

<table cellpadding="1" cellspacing="5" width="100%">

<tr>
  <td height="10" width="20%" class="FormButton" nowrap="nowrap">{$lng.lbl_search_for_pattern}:</td>
  <td height="10">
  <input type="text" name="posted_data[substring]" size="30" style="width:70%" value="{$search_prefilled.substring|escape}" />
  &nbsp;
  <input type="submit" value="{$lng.lbl_search|strip_tags:false|escape}" />
  </td>
</tr>

<tr>
  <td height="10" class="FormButton">{$lng.lbl_search_in}:</td>
  <td>
<table cellpadding="0" cellspacing="0">
<tr>
  <td width="5"><input type="checkbox" id="posted_data_by_username" name="posted_data[by_username]"{if $search_prefilled eq "" or $search_prefilled.by_username} checked="checked"{/if} /></td>
  <td class="OptionLabel"><label for="posted_data_by_username">{$lng.lbl_username}</label></td>

  <td width="5"><input type="checkbox" id="posted_data_by_firstname" name="posted_data[by_firstname]"{if $search_prefilled eq "" or $search_prefilled.by_firstname} checked="checked"{/if} /></td>
  <td class="OptionLabel"><label for="posted_data_by_firstname">{$lng.lbl_first_name}</label></td>

  <td width="5"><input type="checkbox" id="posted_data_by_lastname" name="posted_data[by_lastname]"{if $search_prefilled eq "" or $search_prefilled.by_lastname} checked="checked"{/if} /></td>
  <td class="OptionLabel"><label for="posted_data_by_lastname">{$lng.lbl_last_name}</label></td>

  <td width="5"><input type="checkbox" id="posted_data_by_email" name="posted_data[by_email]"{if $search_prefilled eq "" or $search_prefilled.by_email} checked="checked"{/if} /></td>
  <td class="OptionLabel"><label for="posted_data_by_email">{$lng.lbl_email}</label></td>

  <td width="5"><input type="checkbox" id="posted_data_by_company" name="posted_data[by_company]"{if $search_prefilled eq "" or $search_prefilled.by_company} checked="checked"{/if} /></td>
  <td class="OptionLabel"><label for="posted_data_by_company">{$lng.lbl_company}</label></td>
</tr>
</table>
  </td>
</tr>

<tr>
  <td></td>
  <td>
<table cellpadding="0" cellspacing="0">
<tr>
  <td><input type="checkbox" id="posted_data_is_export" name="posted_data[is_export]" value="Y" /></td>
  <td>&nbsp;</td>
  <td class="FormButton" nowrap="nowrap"><label for="posted_data_is_export">{$lng.lbl_search_and_export}</label></td>
</tr>
</table> 
  </td>
</tr>

</table>

<br />
{include file="main/advanced_search_options.tpl" no_use_class="Y" mark="1" title=$lng.lbl_advanced_search_options extra=' width="100%"'}
<br />

<table cellpadding="1" cellspacing="5" width="100%" style="display: none;" id="box1">

<tr class="TableSubHead">
  <td height="10" class="FormButton" width="20%" nowrap="nowrap">{$lng.lbl_search_for_user_type}:</td>
  <td height="10">
  <select name="posted_data[membershipid]">
    <option value="">{$lng.lbl_all}</option>
{if $config.General.membership_signup eq "Y"}
    <option value="-pending_membership"{if $search_prefilled.usertype eq "" and $search_prefilled.membershipid eq "pending_membership"} selected="selected" {/if}>{$lng.lbl_pending_membership}</option>
{/if}
{foreach from=$memberships item=lvls key=k}
    <option value="{$k}-"{if $search_prefilled.usertype eq $k && $search_prefilled.membershipid eq ''} selected="selected"{/if}>{$memberships_lbls.$k}</option>
{if $config.General.membership_signup eq "Y" && $lvls ne ''}
    <option value="{$k}-pending_membership"{if $search_prefilled.usertype eq $k and $search_prefilled.membershipid eq "pending_membership"} selected="selected" {/if}>&nbsp;&nbsp;&nbsp;{$lng.lbl_pending_membership}</option>
{/if}
{foreach from=$lvls item=v}
    <option value="{$k}-{$v.membershipid}"{if $search_prefilled.usertype eq $k && $search_prefilled.membershipid eq $v.membershipid} selected="selected"{/if}>&nbsp;&nbsp;&nbsp;{$v.membership}</option>
{/foreach}
{/foreach}
  </select>
  </td>
</tr>

<tr class="TableSubHead">
  <td height="10" class="FormButton" nowrap="nowrap">{$lng.lbl_customer_registration_type}: *</td>
  <td height="10">
  <select name="posted_data[registration_type]">
    <option value="">{$lng.lbl_all}</option>
    <option value="1"{if $search_prefilled.registration_type eq "1"} selected="selected"{/if}>{$lng.lbl_anonymous}</option>
    <option value="2"{if $search_prefilled.registration_type eq "2"} selected="selected"{/if}>{$lng.lbl_registered}</option>
  </select>
  </td>
</tr>

<tr>
  <td height="10" width="20%" class="FormButton" nowrap="nowrap">{$lng.lbl_search_by_address}:</td>
  <td>
<table cellpadding="0" cellspacing="0">
<tr>
  <td width="5"><input type="radio" id="address_type_null" name="posted_data[address_type]" value=""{if $search_prefilled eq "" or $search_prefilled.address_type eq ""} checked="checked"{/if} onclick="javascript:managedate('address',true)" /></td>
  <td class="OptionLabel"><label for="address_type_null">{$lng.lbl_ignore_address}</label></td>

  <td width="5"><input type="radio" id="address_type_B" name="posted_data[address_type]" value="B"{if $search_prefilled.address_type eq "B"} checked="checked"{/if} onclick="javascript:managedate('address',false)" /></td>
  <td class="OptionLabel"><label for="address_type_B">{$lng.lbl_billing}</label></td>

  <td width="5"><input type="radio" id="address_type_S" name="posted_data[address_type]" value="S"{if $search_prefilled.address_type eq "S"} checked="checked"{/if} onclick="javascript:managedate('address',false)" /></td>
  <td class="OptionLabel"><label for="address_type_S">{$lng.lbl_shipping}</label></td>

  <td width="5"><input type="radio" id="address_type_both" name="posted_data[address_type]" value="Both"{if $search_prefilled.address_type eq "Both"} checked="checked"{/if} onclick="javascript:managedate('address',false)" /></td>
  <td class="OptionLabel"><label for="address_type_both">{$lng.lbl_both}</label></td>
</tr>
</table>
  </td>
</tr>

<tr>
  <td height="10" width="20%" class="FormButton" nowrap="nowrap">{$lng.lbl_city}:</td>
  <td height="10" width="80%">
  <input type="text" maxlength="64" name="posted_data[city]" value="{$search_prefilled.city|escape}" style="width:70%" />
  </td>
</tr>

<tr>
  <td height="10" width="20%" class="FormButton" nowrap="nowrap">{$lng.lbl_state}:</td>
  <td height="10" width="80%">
  {include file="main/states.tpl" states=$states name="posted_data[state]" default=$search_prefilled.state required="N" style="style='width:70%'"}
  </td>
</tr>

<tr>
  <td height="10" width="20%" class="FormButton" nowrap="nowrap">{$lng.lbl_country}:</td>
  <td height="10" width="80%">
  <select name="posted_data[country]" style="width:70%">
    <option value="">[{$lng.lbl_please_select_one}]</option>
{section name=country_idx loop=$countries}
    <option value="{$countries[country_idx].country_code}"{if $search_prefilled.country eq $countries[country_idx].country_code} selected="selected"{/if}>{$countries[country_idx].country}</option>
{/section}
  </select>
  </td>
</tr>

<tr>
  <td height="10" width="20%" class="FormButton" nowrap="nowrap">{$lng.lbl_zip_code}:</td>
  <td height="10" width="80%">
  <input type="text" maxlength="16" name="posted_data[zipcode]" value="{$search_prefilled.zipcode|escape}" style="width:70%" />
  </td>
</tr>

<tr>
  <td height="10" width="20%" class="FormButton" nowrap="nowrap">{$lng.lbl_phone}/{$lng.lbl_fax}:</td>
  <td height="10" width="80%">
  <input type="text" maxlength="25" name="posted_data[phone]" value="{$search_prefilled.phone|escape}" style="width:70%" />
  </td>
</tr>

<tr>
  <td height="10" width="20%" class="FormButton" nowrap="nowrap">{$lng.lbl_web_site}:</td>
  <td height="10" width="80%">
  <input type="text" maxlength="128" name="posted_data[url]" value="{$search_prefilled.url|escape}" style="width:70%" />
  </td>
</tr>

<tr>
  <td height="10" width="20%" class="FormButton" nowrap="nowrap">{$lng.lbl_orders_count}:</td>
  <td height="10" width="80%">
  <table cellpadding="0" cellspacing="0"><tr>
  <td><input type="text" maxlength="18" name="posted_data[orders_min]" value="{$search_prefilled.orders_min|escape}" /></td>
  <td> - </td>
  <td><input type="text" maxlength="18" name="posted_data[orders_max]" value="{$search_prefilled.orders_max|escape}" /></td>
  </tr></table>
  </td>
</tr>

<tr class="TableSubHead">
  <td height="10" class="FormButton">{$lng.lbl_search_for_users_that_is}:</td>
  <td height="10">
<table cellpadding="0" cellspacing="0">
<tr>
  <td width="5"><input type="checkbox" id="posted_data_registration_date" name="posted_data[registration_date]" value="Y"{if $search_prefilled.registration_date ne ""} checked="checked"{/if} onclick="javascript: managedate('date_type')" /></td>
  <td class="OptionLabel"><label for="posted_data_registration_date">{$lng.lbl_registered}</label></td>

  <td width="5"><input type="checkbox" id="posted_data_last_login_date" name="posted_data[last_login_date]" value="Y"{if $search_prefilled.last_login_date ne ""} checked="checked"{/if} onclick="javascript:managedate('date_type')" /></td>
  <td class="OptionLabel"><label for="posted_data_last_login_date">{$lng.lbl_last_logged_in}</label></td>

  <td width="5"><input type="checkbox" id="posted_data_suspended_by_admin" name="posted_data[suspended_by_admin]" value="Y"{if $search_prefilled.suspended_by_admin ne ""} checked="checked"{/if} onclick="javascript:managedate('date_type')" /></td>
  <td class="OptionLabel"><label for="posted_data_suspended_by_admin">{$lng.lbl_suspended_by_admin}</label></td>

  <td width="5"><input type="checkbox" id="posted_data_auto_suspended" name="posted_data[auto_suspended]" value="Y"{if $search_prefilled.auto_suspended ne ""} checked="checked"{/if} onclick="javascript:managedate('date_type')" /></td>
  <td class="OptionLabel" width="100%"><a href="javascript:void(0);" class="NeedHelpLink" onmouseover="javascript: viewHelp('help_what_is_auto_suspended', this);"><label for="posted_data_auto_suspended">{$lng.lbl_suspended_automatically}</label></a>

      <div id="help_what_is_auto_suspended" class="NeedHelpBox" style="display:none;">{$lng.txt_help_auto_suspended}</div></td>
</tr>
</table>
  </td>
</tr>

<tr class="TableSubHead">
  <td class="FormButton" nowrap="nowrap">{$lng.lbl_during_date_period}:</td>
  <td>
<table cellpadding="2" cellspacing="2">
<tr>
  <td width="5"><input type="radio" id="date_period_M" name="posted_data[date_period]" value="M"{if $search_prefilled.date_period eq "" or $search_prefilled.date_period eq "M"} checked="checked"{/if} onclick="javascript:date_selected='M';managedate('date',true)" /></td>
  <td colspan="2" class="OptionLabel"><label for="date_period_M">{$lng.lbl_this_month}</label></td>
</tr>

<tr>
  <td width="5"><input type="radio" id="date_period_W" name="posted_data[date_period]" value="W"{if $search_prefilled.date_period eq "W"} checked="checked"{/if} onclick="javascript:date_selected='W';managedate('date',true)" /></td>
  <td colspan="2" class="OptionLabel"><label for="date_period_W">{$lng.lbl_this_week}</label></td>
</tr>

<tr>
  <td width="5"><input type="radio" id="date_period_D" name="posted_data[date_period]" value="D"{if $search_prefilled.date_period eq "D"} checked="checked"{/if} onclick="javascript:date_selected='D';managedate('date',true)" /></td>
  <td colspan="2" class="OptionLabel"><label for="date_period_D">{$lng.lbl_today}</label></td>
</tr>

<tr>
  <td width="5"><input type="radio" id="date_period_C" name="posted_data[date_period]" value="C"{if $search_prefilled.date_period eq "C"} checked="checked"{/if} onclick="javascript:date_selected='C';managedate('date',false)" /></td>
  <td class="OptionLabel"><label for="date_period_C">{$lng.lbl_from}</label></td>
  <td>{html_select_date prefix="Start" time=$search_prefilled.start_date start_year=$config.Company.start_year end_year=$config.Company.end_year}</td>
</tr>

<tr>
  <td></td>
  <td class="OptionLabel">{$lng.lbl_through}</td>
  <td>{html_select_date prefix="End" time=$search_prefilled.end_date start_year=$config.Company.start_year end_year=$config.Company.end_year display_days=yes}</td>
</tr>

</table>
  </td>
</tr>

<tr>
  <td colspan="2"><br />
    {$lng.txt_users_search_note}
    <script type="text/javascript" language="JavaScript 1.2">
    <!--
      {if $search_prefilled eq "" or $search_prefilled.address_type eq ""}
      managedate('address',true);
      {/if}
      managedate('date_type');
      {if ($search_prefilled.registration_date ne "" or $search_prefilled.last_login_date ne "" or $search_prefilled.auto_suspended ne "" or $search_prefilled.suspended_by_admin ne "") and $search_prefilled.date_period ne "C"}
      managedate('date', true);
      {/if}
    -->
    </script>
  </td>
</tr>

</table>

  </td>
</tr>

</table>

<table cellpadding="1" cellspacing="5" width="100%">
  <tr>
    <td class="FormButton" width="20%">
      <a href="javascript:void(0);" onclick="javascript: reset_form('searchform', searchform_def);" class="underline">{$lng.lbl_reset}</a>
    </td>
    <td>
      <input type="submit" value="{$lng.lbl_search|strip_tags:false|escape}" />
    </td>
  </tr>
</table>

</form>

{if $search_prefilled.need_advanced_options}
<script type="text/javascript" language="JavaScript 1.2">
<!--
visibleBox('1');
-->
</script>
{/if}

{/capture}
{include file="dialog.tpl" title=$lng.lbl_search_for_user content=$smarty.capture.dialog extra='width="100%"'}

<br />

<!-- SEARCH FORM DIALOG END -->

{/if}

<!-- SEARCH RESULTS SUMMARY -->

<a name="results"></a>

{if $mode eq "search"}
{if $total_items gt "0"}
{$lng.txt_N_results_found|substitute:"items":$total_items}<br />
{$lng.txt_displaying_X_Y_results|substitute:"first_item":$first_item:"last_item":$last_item}
{else}
{$lng.txt_N_results_found|substitute:"items":0}
{/if}
{/if}

{if $mode eq "search" and $users ne ""}

<!-- SEARCH RESULTS START -->

<br /><br />

{capture name=dialog}

<div align="right">{include file="buttons/button.tpl" button_title=$lng.lbl_search_again href="users.php"}</div>

{if $total_pages lt 3}
<br />
{else}
{assign var="pagestr" value="&page=`$navigation_page`"}
{/if}

{include file="main/navigation.tpl"}

{include file="main/check_all_row.tpl" style="line-height: 170%;" form="processuserform" prefix="user"}

<form action="process_user.php" method="post" name="processuserform">
<input type="hidden" name="mode" value="" />
<input type="hidden" name="pagestr" value="{$pagestr|amp}" />

<table cellpadding="2" cellspacing="1" width="100%">

<tr class="TableHead">
  <td>&nbsp;</td>
  <td>{if $search_prefilled.sort_field eq "username"}{include file="buttons/sort_pointer.tpl" dir=$search_prefilled.sort_direction}&nbsp;{/if}<a href="users.php?mode=search{$pagestr|amp}&amp;sort=username">{$lng.lbl_username}</a></td>
  <td>{if $search_prefilled.sort_field eq "name"}{include file="buttons/sort_pointer.tpl" dir=$search_prefilled.sort_direction}&nbsp;{/if}<a href="users.php?mode=search{$pagestr|amp}&amp;sort=name">{$lng.lbl_name}</a> / {if $search_prefilled.sort_field eq "email"}{include file="buttons/sort_pointer.tpl" dir=$search_prefilled.sort_direction}&nbsp;{/if}<a href="users.php?mode=search{$pagestr|amp}&amp;sort=email">{$lng.lbl_email}</a></td>
  <td>{if $search_prefilled.sort_field eq "usertype"}{include file="buttons/sort_pointer.tpl" dir=$search_prefilled.sort_direction}&nbsp;{/if}<a href="users.php?mode=search{$pagestr|amp}&amp;sort=usertype">{$lng.lbl_usertype}</a></td>
  <td>{if $search_prefilled.sort_field eq "last_login"}{include file="buttons/sort_pointer.tpl" dir=$search_prefilled.sort_direction}&nbsp;{/if}<a href="users.php?mode=search{$pagestr|amp}&amp;sort=last_login">{$lng.lbl_last_logged_in}</a></td>
  {if $users_has_partner}
    <td>{$lng.lbl_affiliate_plan}</td>
  {/if}
  <td>{if $search_prefilled.sort_field eq "cnt"}{include file="buttons/sort_pointer.tpl" dir=$search_prefilled.sort_direction}&nbsp;{/if}<a href="users.php?mode=search{$pagestr|amp}&amp;sort=cnt">{$lng.lbl_orders_counter}</a></td>
</tr>

{foreach from=$users item=u name=users}

  {assign var="_usertype" value=$u.usertype}
  {if $_usertype eq "P" and $single_mode eq ""}
    {assign var="products" value=$u.products}
  {else}
    {assign var="products" value=""}
  {/if}

  <tr{interline name=users class=TableSubHead}>
    <td width="5"><input type="checkbox" name="user[{$u.login}]"{if $u.login eq $login} disabled="disabled"{/if} /></td>
    <td><a href="user_modify.php?user={$u.login|escape:"url"}&amp;usertype={$u.usertype}{$pagestr|amp}" title="{$lng.lbl_modify_profile|escape}">{$u.login}</a></td>
    <td><a href="user_modify.php?user={$u.login|escape:"url"}&amp;usertype={$u.usertype}{$pagestr|amp}" title="{$lng.lbl_modify_profile|escape}"><font class="ItemsList">{$u.firstname} {$u.lastname}</font></a> / {$u.email}</td>
    <td>
      <span title="{$u.membership|default:$lng.lbl_no_membership}">{$usertypes.$_usertype}</span>
      {if $_usertype eq 'B'}
        <br /><font class="SmallText"><i>({if $u.status eq 'Q'}{$lng.lbl_unapproved}{elseif $u.status eq 'D'}{$lng.lbl_declined}{elseif $u.status eq 'Y'}{$lng.lbl_approved}{else}{$lng.lbl_disabled}{/if})</i></font>
      {elseif $u.status ne 'Y' and $u.status ne 'A'}
        <br /><font class="SmallText"><i>({$lng.lbl_account_status_suspended})</i></font>
      {/if}
      {if $products ne ""}
        <span style="white-space: nowrap;">({$lng.txt_N_products|substitute:"products":$products})</span>
      {/if}
    </td>
    <td nowrap="nowrap">{if ($u.last_login ne 0)}{$u.last_login|date_format:$config.Appearance.datetime_format}{else}{$lng.lbl_never_logged_in}{/if}</td>
    {if $users_has_partner}
      <td>
        {if $u.usertype eq 'B'}
          <select name="plan[{$u.login}]">
            <option value="0">{$lng.lbl_none}</option>
            {foreach from=$plans item=p}
              <option value="{$p.plan_id}"{if $u.plan_id eq $p.plan_id} selected="selected"{/if}>{$p.plan_title}</option>
            {/foreach}
          </select>
        {else}
          &nbsp;
        {/if}
      </td>
    {/if}
    <td>{if $u.cnt ne "0"}<a href="orders.php?username={$u.login}">{$u.cnt}</a>{else} 0 {/if}</td>
  </tr>

{/foreach}

<tr>
  <td colspan="5" class="SubmitBox">
    <input type="button" value="{$lng.lbl_delete_selected|strip_tags:false|escape}" onclick="javascript: if (checkMarks(this.form, new RegExp('^user\\[.+\\]', 'gi'))) submitForm(this, 'delete');" />
    <input type="button" value="{$lng.lbl_export_selected|strip_tags:false|escape}" onclick="javascript: if (checkMarks(this.form, new RegExp('^user\\[.+\\]', 'gi'))) submitForm(this, 'export');" />
    <input type="button" value="{$lng.lbl_export_all_found|strip_tags:false|escape}" onclick="javascript: self.location='users.php?mode=search&amp;export=export_found';" />
  </td>
  {if $users_has_partner}
    <td>
      <input type="button" value="{$lng.lbl_update|strip_tags:false|escape}" onclick="javascript: submitForm(this, 'update');" />
    </td>
  {/if}
</tr>

<tr>
  <td colspan="5">
<br /><br /><br />
<table cellpadding="5">

<tr>
  <td><font class="FormButton">{$lng.lbl_reg_chpass_admin}</font></td>
  <td><input type="checkbox" name="op_change_password" /></td>
</tr>

<tr>
  <td><font class="FormButton">{$lng.lbl_reg_account_status_admin}</font></td>
  <td>
  <select name="op_change_status">
    <option value="">{$lng.lbl_reg_do_not_change_admin}</option>
    <option value="N" class="UsersActionDisable">{$lng.lbl_reg_account_status_suspend}</option>
    <option value="Y" class="UsersActionEnable">{$lng.lbl_reg_account_status_enable}</option>
  </select>
  </td>
</tr>
<tr>
  <td>
  <font class="FormButton">{$lng.lbl_reg_account_activity_admin}</font>
  <br />
  <font class="SmallText">{$lng.lbl_reg_account_activity_note_admin}</font>
  </td>
  <td>
  <select name="op_change_activity">
    <option value="">{$lng.lbl_reg_do_not_change_admin}</option>
    <option value="N" class="UsersActionDisable">{$lng.lbl_reg_account_activity_disable}</option>
    <option value="Y" class="UsersActionEnable">{$lng.lbl_reg_account_activity_enable}</option>
  </select>
  </td>
</tr>
</table>
  </td>
</tr>
<tr>
  <td colspan="5">
<table cellpadding="2" cellspacing="1">
<tr>
  <td><input type="radio" id="for_users_S" name="for_users" value="S" checked="checked" /></td>
  <td class="OptionLabel"><label for="for_users_S">{$lng.lbl_of_selected_users}</label></td>
  <td>&nbsp;&nbsp;</td>
  <td><input type="radio" id="for_users_A" name="for_users" value="A" /></td>
  <td class="OptionLabel"><label for="for_users_A">{$lng.lbl_of_all_found_users}</label></td>
</tr>
</table>
<br />
<input type="button" value="{$lng.lbl_apply|strip_tags:false|escape}" onclick="javascript: submitForm(this, 'group_operation');" />
</td>
</tr>

</table>
</form>

<br />

{include file="main/navigation.tpl"}

{/capture}
{include file="dialog.tpl" title=$lng.lbl_search_results content=$smarty.capture.dialog extra='width="100%"'}

<!-- SEARCH RESULTS START -->

{/if}

<br />

