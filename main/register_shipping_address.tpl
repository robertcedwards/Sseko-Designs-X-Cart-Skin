{*
$Id: register_shipping_address.tpl,v 1.47 2009/06/26 06:33:15 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $is_areas.S eq 'Y'}
{if $hide_header eq ""}
<tr>
  <td height="20" colspan="3">
<script type="text/javascript">
<!--
{literal}
function ship2diffOpen() {
  var obj = document.getElementById('ship2diff');
  var box = document.getElementById('ship_box');
  if (!obj || !box)
    return;

  box.style.display = obj.checked ? "" : "none";
}
{/literal}
-->
</script>
  
  <br />
  <table cellpadding="0" cellspacing="0">
  <tr>
    <td><label for="ship2diff" class="RegSectionTitle">{$lng.lbl_ship_to_different_address}</label></td>
    <td>&nbsp;</td>
    <td><input type="checkbox" id="ship2diff" name="ship2diff" value="Y" onclick="javascript: ship2diffOpen();"{if $ship2diff} checked="checked"{/if} /></td>
  </tr>
  </table>
  <hr size="1" noshade="noshade" />
  <br />
  </td>
</tr>
{/if}
</tbody>
<tbody id="ship_box">
{if $default_fields.s_title.avail eq 'Y'}
<tr>
<td align="right">{$lng.lbl_title}</td>
<td>{if $default_fields.s_title.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap"> 
<select name="s_title">
{include file="main/title_selector.tpl" field=$userinfo.s_titleid}
</select> 
</td> 
</tr> 
 {/if}

{if $default_fields.s_firstname.avail eq 'Y'}
<tr>
<td align="right">{$lng.lbl_first_name}</td>
<td>{if $default_fields.s_firstname.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap"> 
<input type="text" id="s_firstname" name="s_firstname" size="32" maxlength="32" value="{$userinfo.s_firstname|escape}" />
{if $reg_error ne "" and $userinfo.s_firstname eq "" && $default_fields.s_firstname.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
 {/if}

{if $default_fields.s_lastname.avail eq 'Y'}
<tr>
<td align="right">{$lng.lbl_last_name}</td>
<td>{if $default_fields.s_lastname.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap">
<input type="text" id="s_lastname" name="s_lastname" size="32" maxlength="32" value="{$userinfo.s_lastname|escape}" />
{if $reg_error ne "" and $userinfo.s_lastname eq "" && $default_fields.s_lastname.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}

{if $default_fields.s_address.avail eq 'Y'}
<tr>
<td align="right">{$lng.lbl_address}</td>
<td>{if $default_fields.s_address.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap">
<input type="text" id="s_address" name="s_address" size="32" maxlength="64" value="{$userinfo.s_address|escape}" />
{if $reg_error ne "" and $userinfo.s_address eq "" and $default_fields.s_address.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}

{if $default_fields.s_address_2.avail eq 'Y'}
<tr>
<td align="right">{$lng.lbl_address_2}</td>
<td>{if $default_fields.s_address_2.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap">
<input type="text" id="s_address_2" name="s_address_2" size="32" maxlength="64" value="{$userinfo.s_address_2|escape}" />
{if $reg_error ne "" and $userinfo.s_address_2 eq "" and $default_fields.s_address_2.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}

{if $default_fields.s_city.avail eq 'Y'}
<tr>
<td align="right">{$lng.lbl_city}</td>
<td>{if $default_fields.s_city.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap">
<input type="text" id="s_city" name="s_city" size="32" maxlength="64" value="{$userinfo.s_city|escape}" />
{if $reg_error ne "" and $userinfo.s_city eq "" and $default_fields.s_city.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}

{if $default_fields.s_county.avail eq 'Y' and $config.General.use_counties eq "Y"}
<tr>
<td align="right">{$lng.lbl_county}</td>
<td>{if $default_fields.s_county.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap">
{include file="main/counties.tpl" counties=$counties name="s_county" default=$userinfo.s_county country_name="s_country"}
{if ($reg_error ne "" and $userinfo.s_county eq "" and $default_fields.s_county.required eq 'Y') or $error eq "s_county"}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}

{if $default_fields.s_state.avail eq 'Y'}
<tr>
<td align="right">{$lng.lbl_state}</td>
<td>{if $default_fields.s_state.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap">
{include file="main/states.tpl" states=$states name="s_state" default=$userinfo.s_state|default:$config.General.default_state default_country=$userinfo.s_country|default:$config.General.default_country country_name="s_country"}
{if ($reg_error ne "" and $userinfo.s_state eq "" and $default_fields.s_state.required eq 'Y' && $userinfo.s_display_states) or $error eq "s_statecode"}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}

{if $default_fields.s_country.avail eq 'Y'}
<tr>
<td align="right">{$lng.lbl_country}</td>
<td>{if $default_fields.s_country.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap">
<select name="s_country" id="s_country" size="1" onchange="check_zip_code()">
{section name=country_idx loop=$countries}
<option value="{$countries[country_idx].country_code}"{if $userinfo.s_country eq $countries[country_idx].country_code} selected="selected"{elseif $countries[country_idx].country_code eq $config.General.default_country and $userinfo.s_country eq ""} selected="selected"{/if}>{$countries[country_idx].country|amp}</option>
{/section}
</select>
{if $reg_error ne "" and $userinfo.s_country eq "" and $default_fields.s_country.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}

{if $default_fields.s_state.avail eq 'Y' && $default_fields.s_country.avail eq 'Y' && $js_enabled eq 'Y'}
<tr style="display: none;">
  <td>
{include file="main/register_states.tpl" state_name="s_state" country_name="s_country" county_name="s_county" state_value=$userinfo.s_state|default:$config.General.default_state county_value=$userinfo.s_county}
  </td>
</tr>
{/if}
{if $default_fields.s_zipcode.avail eq 'Y'}
<tr>
<td align="right">{$lng.lbl_zip_code}</td>
<td>{if $default_fields.s_zipcode.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap">
<input type="text" id="s_zipcode" name="s_zipcode" size="32" maxlength="32" value="{$userinfo.s_zipcode|escape}" onchange="check_zip_code()" />
{if $reg_error ne "" and $userinfo.s_zipcode eq "" and $default_fields.s_zipcode.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}

{include file="main/register_additional_info.tpl" section="S"}
{if !$ship2diff}
<tr style="display: none;">
  <td>
<script type="text/javascript">
<!--
if (document.getElementById('ship_box'))
  document.getElementById('ship_box').style.display = 'none';
-->
</script>
  </td>
</tr>
{/if}
</tbody>
<tbody>
{/if}
