{*
$Id: clean_url_field.tpl,v 1.13 2009/06/26 06:33:15 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<tr>
  {if $geid ne ''}
    <td width="15" class="TableSubHead" valign="top"><input type="checkbox" disabled="disabled"/></td>
  {/if}
  <td class="FormButton" nowrap="nowrap" valign="top">{$lng.lbl_clean_url}:</td>
  {if $show_req_fields eq "Y"}
    <td width="10" height="10" valign="top"><span class="Star">{if $config.SEO.clean_urls_enabled eq "Y"}*{/if}</span></td>
  {/if}
  <td class="ProductDetails" width="80%">
      <div>
        <input type="text" name="clean_url" id="clean_url" size="45" maxlength="250" value="{$clean_url|escape:"html"}" {if $config.SEO.clean_urls_enabled eq "Y"}class="InputWidth" onchange="javascript: checkCleanUrl(this, 'Y', 'Y');"{else}class="InputWidth ReadOnlyField" readonly="readonly"{/if} />&nbsp;
        {if $clean_url_fill_error}<span class="Star">&lt;&lt;&nbsp;</span>{/if}

        <a href="javascript:void(0);" class="NeedHelpLink" onmouseover="javascript: viewHelp('help_what_is_clean_url', this);">{$lng.lbl_clean_url_what_is}</a>
        <div id="help_what_is_clean_url" class="NeedHelpBox" style="display:none">{$lng.txt_clean_url_descr}</div>
      </div>

      {if $config.SEO.clean_urls_enabled eq "Y"}

        <div id="clean_url_error" class="Star"></div>
        <input type="checkbox" name="clean_url_save_in_history" id="clean_url_save_in_history" value="Y" checked="checked" />
        <label for="clean_url_save_in_history">{$lng.lbl_clean_url_save_old}</label><br />

        {if $clean_urls_history}
          [ <a href="#clean_url_history">{$lng.lbl_clean_url_manage_history}</a> ]<br />
        {/if}

        {if $usertype eq "A" || ($usertype eq "P" && $active_modules.Simple_Mode eq "Y")}
          {$lng.lbl_clean_url_format_warning|substitute:"seo_option_page":"`$catalogs.admin`/configuration.php?option=SEO"}
        {else}
          {$lng.lbl_clean_url_format_warning_provider}
        {/if}

      {else}

        {if $usertype eq "A" || ($usertype eq "P" && $active_modules.Simple_Mode eq "Y")}
          {$lng.lbl_clean_url_disabled_mode_warning|substitute:"seo_option_page":"`$catalogs.admin`/configuration.php?option=SEO"}
        {else}
          {$lng.lbl_clean_url_disabled_mode_warning_provider}
        {/if}

      {/if}

      <br />
  </td>
</tr>
