{*
$Id: states.tpl,v 1.16 2009/04/18 06:33:04 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $states ne ""}
<select name="{$name}" id="{$name|replace:"[":"_"|replace:"]":""}" {$style}>
{if $required eq "N"}
  <option value="">[{$lng.lbl_please_select_one}]</option>
{/if}
  <option value="{if $value_for_other ne "no"}Other{/if}"{if $default eq "Other"} selected="selected"{/if}>{$lng.lbl_other}</option>
{section name=state_idx loop=$states}
{if $config.General.default_country eq $states[state_idx].country_code || $country_name eq '' || $default_fields.$country_name.avail eq 'Y'}
  <option value="{$states[state_idx].state_code|escape}"{if $default eq $states[state_idx].state_code && (!$default_country || $default_country eq $states[state_idx].country_code)} selected="selected"{/if}>{$states[state_idx].country_code}: {$states[state_idx].state|amp}</option>
{/if}
{/section}
</select>
{else}
<input type="text"{if $name ne ''} id="{$name|replace:"[":"_"|replace:"]":""}"{/if} size="32" maxlength="65" name="{$name}" value="{$default|escape}" />
{/if}
