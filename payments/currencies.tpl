{*
$Id: currencies.tpl,v 1.1 2009/03/26 08:17:55 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $pm_currencies}
  <tr>
    <td>{$lng.lbl_cc_currency}:</td>
    <td>
      <select name="{$param_name}">
        {foreach from=$pm_currencies item=c key=code}
          <option value="{$code}"{if $current eq $code} selected="selected"{/if}>{$c} ({$code})</option>
        {/foreach}
      </select>
    </td>
  </tr>
{/if}
