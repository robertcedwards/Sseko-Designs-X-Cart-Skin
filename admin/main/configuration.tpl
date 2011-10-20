{*
$Id: configuration.tpl,v 1.127 2009/09/30 10:09:41 svowl Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="page_title.tpl" title=$lng.lbl_general_settings}

{$lng.txt_general_settings_top_text}

<br /><br />

{include file="dialog_tools.tpl"}

<br />

{include file="permanent_warning.tpl"}

{capture name=dialog}

{assign var="cycle_name" value="sep"}

{if $option ne "User_Profiles" && $option ne "Contact_Us" && $option ne "Search_products"}
  <form action="configuration.php?option={$option|escape}" method="post" name="processform" onsubmit="return validateFields()">
{/if}

<table cellpadding="3" cellspacing="1" width="100%">
  <tr>
    <td class="TopLabel">{include file="main/subheader.tpl" title=$option_title class="black"}</td>
  </tr>

  {if $option eq 'Shipping_Label_Generator'}
    <tr>
      <td>
        <div align="right">
          {include file="buttons/button.tpl" button_title=$lng.lbl_usps_labels_help href="javascript:window.open('popup_info.php?action=TSTLBL','TSTLBL_HELP','width=600,height=460,toolbar=no,status=no,scrollbars=yes,resizable=no,menubar=no,location=no,direction=no');"}
      </div>
      </td>
    </tr>
  {/if}

</table>

<br />

{if $option eq "User_Profiles"}

  {include file="admin/main/user_profiles.tpl"}

{elseif $option eq "Contact_Us"}

  {include file="admin/main/contact_us_profiles.tpl"}

{elseif $option eq "Search_products"}

  {include file="admin/main/search_products_form.tpl"}

{else}

{include file="admin/main/conf_fields_validation_js.tpl"}

{if $option eq "Google_Checkout"}
  <div align="right">
    {include file="buttons/button.tpl" button_title=$lng.lbl_signup_for_gcheckout href="http://checkout.google.com/sell?promo=sequaliteamsoftware"}<br />
  </div>
  {$lng.txt_gcheckout_setup_note|substitute:"callback_url":$gcheckout_callback_url}<br />
  <br />
  {include file="modules/Google_Checkout/gcheckout_requirements.tpl"}

{/if}

{if $option eq "Image_Verification"}
  {include file="modules/Image_Verification/spambot_requirements.tpl"}
{/if}

{if $option eq "Google_Analytics"}
  {$lng.google_analytics_info}<br />
  <br />
{/if}

{if $option eq "SEO"}
  {$lng.txt_clean_url_htaccess_info|substitute:"clean_url_htaccess":$clean_url_htaccess|substitute:"htaccess":$clean_url_htaccess_path|substitute:"clean_url_test_url":$clean_url_test_url}<br />
{/if}

{if $option eq "XPayments_Connector"}
  {include file="modules/XPayments_Connector/config_recommends.tpl"}
{/if}

<table cellpadding="10" cellspacing="0" class="general-settings">

{assign var="first_row" value=1}

{section name=cat_num loop=$configuration}

{assign var="opt_comment" value="opt_`$configuration[cat_num].name`"}
{assign var="opt_label_id" value="opt_`$configuration[cat_num].name`"}
{assign var="opt_descr" value="opt_descr_`$configuration[cat_num].name`"}

{if $configuration[cat_num].type eq "separator"}

  <tr>
    <td colspan="3" class="TableSeparator">
      {if $first_row eq 0}
        <br />
      {/if}
      <br />
      {if $lng.$opt_comment ne ""}
        {$lng.$opt_comment}
      {elseif $configuration[cat_num].comment}
        {$configuration[cat_num].comment}
      {else}
        <hr />
      {/if}
      <br /><br />
    </td>
  </tr>
  {assign var="cycle_name" value=$configuration[cat_num].name}

{else}

  {if $configuration[cat_num].pre_note}
    <tr>
      <td colspan="3">{$configuration[cat_num].pre_note}<br /><br /></td>
    </tr>
  {/if}

  {if $cols_count eq "1"}
    {assign var="bgcolor" value=""}
    {assign var="cols_count" value=""}
  {else}
    {assign var="bgcolor" value="class=''"}
    {assign var="cols_count" value="1"}
  {/if}

  {cycle name=$cycle_name values=" class='TableSubHead', " assign="row_style"}

  <tr id="tr_{$configuration[cat_num].name}">
    <td width="30">&nbsp;</td>
    <td {$row_style} width="40%">
      {strip}
        {if $configuration[cat_num].type eq "checkbox"}
          <label for="{$opt_label_id}">
        {/if}
        {$lng.$opt_comment|default:$configuration[cat_num].comment}
        {if $configuration[cat_num].type eq "checkbox"}
          </label>
        {/if}
      {/strip}
    </td>
    <td {$row_style} width="60%">

    <table cellpadding="0" cellspacing="0">
    <tr>
      <td>
      
      {if $configuration[cat_num].name eq "blowfish_enabled" && $configuration[cat_num].value eq "Y" && $is_merchant_password ne "Y"}

        {$lng.lbl_enabled}
        <input type="hidden" name="{$configuration[cat_num].name}" value='{$configuration[cat_num].value}' />

      {elseif $configuration[cat_num].name eq "periodic_logs"}

        <input type="hidden" name="periodic_logs" value="" />
        <select name="periodic_logs[]" multiple="multiple" size="10">
          {foreach key=log_label item=txt_label from=$periodical_logs_names}
            <option value="{$log_label}"{if $periodical_log_labels.$log_label ne ""} selected="selected"{/if}>{$txt_label}</option>
          {/foreach}
        </select>

      {elseif ($configuration[cat_num].name eq "use_https_login" or $configuration[cat_num].name eq "dont_leave_https" or $configuration[cat_num].name eq "use_secure_login_page") and not $https_check_success}
        <input type="checkbox" id="{$opt_label_id}" name="{$configuration[cat_num].name}" disabled="disabled" />

      {elseif $configuration[cat_num].type eq "numeric"}

        <input id="{$configuration[cat_num].name}" type="text" size="10" name="{$configuration[cat_num].name}" value="{$configuration[cat_num].value|formatnumeric}" />

      {elseif $configuration[cat_num].type eq "text"}

        <input type="text" size="30" name="{$configuration[cat_num].name}" value="{$configuration[cat_num].value|escape:htmlall}" />
      
      {elseif $configuration[cat_num].type eq "password"}

        <input type="password" size="30" name="{$configuration[cat_num].name}" id="{$opt_label_id}" value="{$configuration[cat_num].value|escape:htmlall}" />

      {elseif $configuration[cat_num].type eq "checkbox"}

        {if $configuration[cat_num].disabled}
          <input type="hidden" name="{$configuration[cat_num].name}" value="{$configuration[cat_num].value|escape}" />
        {/if}
        <input type="checkbox" id="{$opt_label_id}" name="{$configuration[cat_num].name}"{if $configuration[cat_num].value eq "Y"} checked="checked"{/if}{if $configuration[cat_num].disabled} disabled="disabled"{/if} />

      {elseif $configuration[cat_num].type eq "textarea"}

        <textarea name="{$configuration[cat_num].name}" cols="30" rows="5">{$configuration[cat_num].value|escape:html}</textarea>

      {elseif $configuration[cat_num].type eq "selector" && $configuration[cat_num].variants ne ''}

        <select name="{$configuration[cat_num].name}"{if $configuration[cat_num].auto_submit} onchange="javascript: document.processform.submit()"{/if}{if $configuration[cat_num].name eq "gcheckout_package_type"} onchange="javascript: if ($(this).val() == 'use_dimensions') {ldelim}$('#tr_gcheckout_length, #tr_gcheckout_width, #tr_gcheckout_height').show();{rdelim} else {ldelim}$('#tr_gcheckout_length, #tr_gcheckout_width, #tr_gcheckout_height').hide();{rdelim}"{/if}>
          {foreach from=$configuration[cat_num].variants item=vitem key=vkey}
            <option value="{$vkey}"{if $vitem.selected} selected="selected"{/if}>{$vitem.name}</option>
          {/foreach}
        </select>

      {elseif $configuration[cat_num].type eq "multiselector" && $configuration[cat_num].variants ne ''}

        <select name="{$configuration[cat_num].name}[]" multiple="multiple" size="5">
          {foreach from=$configuration[cat_num].variants item=vitem key=vkey}
            <option value="{$vkey}"{if $vitem.selected} selected="selected"{/if}>{$vitem.name}</option>
          {/foreach}
        </select>

      {elseif $configuration[cat_num].type eq "state"}

        {include file="main/states.tpl" states=$states name=$configuration[cat_num].name default=$configuration[cat_num].value default_country=$configuration[cat_num].country_value}
        {assign_ext var="state_values[`$configuration[cat_num].prefix`]" value=$configuration[cat_num].value}

      {elseif $configuration[cat_num].type eq 'country'}

        <select name="{$configuration[cat_num].name}" id="{$configuration[cat_num].name}">
          {foreach from=$countries item=c}
            <option value="{$c.country_code}"{if $c.country_code eq $configuration[cat_num].value} selected="selected"{/if}>{$c.country}</option>
          {/foreach}
        </select>

      {/if}

      {if $configuration[cat_num].prefix}

        {assign var="prefix" value=$configuration[cat_num].prefix}
        {if $dynamic_states.$prefix gt 0}
          {inc assign="next" value=$dynamic_states.$prefix}
          {assign_ext var="dynamic_states[`$prefix`]" value=$next}
        {else}
          {assign_ext var="dynamic_states[`$prefix`]" value=1}
        {/if}

      {/if}
      </td>
      <td valign="middle">
      {if $lng.$opt_descr}
        <a href="javascript:void(0);" class="NeedHelpLink NeedHelpLinkConfig" onmouseover="javascript: viewHelp('help_{$configuration[cat_num].name}', this, 100);"><img src="{$ImagesDir}/help_sign.gif" width="15" height="15" alt="{$lng.lbl_need_help}" /></a>
        <div id="help_{$configuration[cat_num].name}" class="NeedHelpBox" style="display: none;">{$lng.$opt_descr}</div>
      {else}
        &nbsp;
      {/if}
      </td>
    </tr>
    </table>
    </td>
  </tr>

  {if $configuration[cat_num].error}

    <tr>
      <td width="30">&nbsp;</td>
      <td colspan="2" {$row_style}>
        <font class="ErrorMessage">{$configuration[cat_num].error}</font>
      </td>
    </tr>

  {elseif $configuration[cat_num].warning}

    <tr>
      <td width="30">&nbsp;</td>
      <td colspan="2" {$row_style}>
        <strong>{$lng.lbl_warning}:</strong> {$configuration[cat_num].warning}
      </td>
    </tr>

  {elseif $configuration[cat_num].note}

    <tr>
      <td width="30">&nbsp;</td>
      <td colspan="2" {$row_style}>
        <strong>{$lng.lbl_note}:</strong> {$configuration[cat_num].note}
      </td>
    </tr>

  {/if}

{/if}

{assign var="first_row" value=0}

{/section}

{if $dynamic_states ne ''}
  <tr style="display: none;">
    <td>
      {include file="change_states_js.tpl"}
      {foreach from=$dynamic_states item=cnt key=name}
        {if $cnt eq 2}
          {include file="main/register_states.tpl" state_name="`$name`_state" country_name="`$name`_country" state_value=$state_values.$name}
        {/if}
      {/foreach}
    </td>
  </tr>
{/if}

<tr>
  <td colspan="3">
    <br /><br />
    <input type="submit" value=" {$lng.lbl_save|strip_tags:false|escape} "  />
  </td>
</tr>

</table>

{if $option eq "Company" and (not $single_mode)}
  <br />
    <strong>{$lng.lbl_note}:</strong> {$lng.lbl_company_location_country_note}
{/if}

{if $option ne "User_Profiles" && $option ne "Contact_Us" && $option ne "Search_products"}
  </form>
{/if}

{if $option eq "Shipping" && $is_realtime}

  <hr />

  <h3>{$lng.lbl_test_realtime_calculation}</h3>

  {$lng.txt_test_realtime_calculation_text}

  <br /><br />

  <form action="test_realtime_shipping.php" target="_blank">

    <label for="trs_weight">{$lng.lbl_package_weight}</label> <input type="text" id="trs_weight" name="weight" value="1" /> <input type="submit" value="{$lng.lbl_test|strip_tags:false|escape}" />

  </form>

{elseif $option eq "Security"}

  <hr />

  <h3>{$lng.lbl_test_data_encryption}</h3>

  <a href="test_pgp.php">{$lng.lbl_test_data_encryption_link}</a>

{elseif $option eq "XPayments_Connector"}
  {include file="modules/XPayments_Connector/config_bottom.tpl"}

{/if}

<br />

{/if}

{/capture}
{include file="dialog.tpl" title=$lng.lbl_general_settings content=$smarty.capture.dialog extra='width="100%"'}
