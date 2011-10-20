{*
$Id: counties.tpl,v 1.5 2008/08/21 09:52:51 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $counties ne ""}
<select name="{$name}" id="{$name}" {$style}>
{if $required eq "N"}
<option value="">[{$lng.lbl_please_select_one}]</option>
{/if}
<option value="{if $value_for_other ne "no"}Other{/if}"{if $default eq "Other"} selected="selected"{/if}>{$lng.lbl_other}</option>
{section name=county_idx loop=$counties}
{if $config.General.default_country eq $counties[county_idx].country_code || $country_name eq '' || $default_fields.$country_name.avail eq 'Y'}
<option value="{$counties[county_idx].countyid}"{if $default eq $counties[county_idx].countyid} selected="selected"{/if}>{$counties[county_idx].state}: {$counties[county_idx].county}</option>
{/if}
{/section}
</select>
{else}
<input type="text" id="{$name}" size="32" maxlength="65" name="{$name}" value="{$default|escape}" />
{/if}
