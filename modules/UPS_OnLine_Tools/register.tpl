{*
$Id: register.tpl,v 1.17 2009/09/01 12:07:05 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{capture name="dialog"}
  <p class="text-block">{$lng.txt_ups_av_err}</p>

  <form action="{$register_script_name}?{$smarty.server.QUERY_STRING|amp}" method="post" name="registerform">
    <input type="hidden" name="suggest" value="yes" />
    <input type="hidden" name="ups_av" value="1" />

    {foreach key=key item=item from=$get_vars}
      <input type="hidden" name="{$key}" value="{$item|escape}" />
    {/foreach}

    {foreach key=key item=item from=$post_vars}
      {if $key eq "additional_values"}
        {foreach key=akey item=aitem from=$item}
          <input type="hidden" name="additional_values[{$akey}]" value="{$aitem|escape}" />
        {/foreach}
      {else}
        <input type="hidden" name="{$key}" value="{$item|escape}" />
      {/if}
    {/foreach}

    <table cellspacing="1" width="100%" class="ups-error width-100">

      <tr>
        <td class="ups-error-name"><strong>{$lng.lbl_you_entered}:</strong></td>
        <td>
          {$userinfo.s_city}, {$userinfo.s_state}
          {if $userinfo.s_state ne ""}
            ({$s_statename})
          {/if}
          {$userinfo.s_zipcode}
        </td>
      </tr>

      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>

      {if $av_result ne ""}

        <tr>
          <td><strong>{$lng.lbl_we_suggest}:</strong></td>
          <td>
            <select name="rank">
              {foreach item=av key=key from=$av_result}
                <option value="{$key|escape}">{$av.city}, {$av.state} {$av.zipcode}</option>
              {/foreach}
            </select>
          </td>
        </tr>

        <tr>
          <td>&nbsp;</td>
          <td class="button-row">
            {include file="customer/buttons/button.tpl" button_title=$lng.lbl_reenter_address href="javascript: document.registerform.suggest.value='no'; document.registerform.submit();" style="link"}
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td class="button-row">
            {include file="customer/buttons/button.tpl" button_title=$lng.lbl_use_suggestion href="javascript: document.registerform.submit();" style="link"}
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td class="button-row">
            {include file="customer/buttons/button.tpl" button_title=$lng.lbl_keep_current_address href="javascript: document.registerform.suggest.value='';document.registerform.submit();" style="link"}
          </td>
        </tr>

      {else}

        <tr>
          <td colspan="2" class="data-required">{$lng.txt_ups_av_no_alternative_address}</td>
        </tr>

        <tr>
          <td colspan="2" class="button-row">
            {include file="customer/buttons/button.tpl" button_title=$lng.lbl_reenter_address href="javascript: document.registerform.suggest.value='no'; document.registerform.submit();"}
          </td>
        </tr>

      {/if}

    </table>
  </form>

  <hr />

  {include file="modules/UPS_OnLine_Tools/ups_av_notice.tpl"}

{/capture}
{include file="customer/dialog.tpl" title=$lng.lbl_ups_av_error content=$smarty.capture.dialog}
