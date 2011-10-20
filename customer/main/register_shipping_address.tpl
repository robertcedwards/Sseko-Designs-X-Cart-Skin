{*
$Id: register_shipping_address.tpl,v 1.9.2.1 2009/11/23 14:06:36 aim Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $is_areas.S eq 'Y'}

{if $hide_header eq ""}
      <tr>
        <td class="register-section-title register-exp-section{if !$ship2diff} register-sec-minimized{/if}" colspan="3">
<script type="text/javascript">
<!--
{literal}
function ship2diffOpen(flag) {
  $('#ship_box').css('display', flag ? '' : 'none');
  if (flag)
    $('#ship2diff').parents('.register-exp-section').removeClass('register-sec-minimized');
  else
    $('#ship2diff').parents('.register-exp-section').addClass('register-sec-minimized');

  $('#content-container').css("height", "auto");
  $('#page-container2').css("height", "auto");
}
{/literal}
-->
</script>

          <div>  
            <label class="pointer" for="ship2diff">{$lng.lbl_ship_to_different_address}</label>
            <input type="checkbox" id="ship2diff" name="ship2diff" value="Y" onclick="javascript: ship2diffOpen(this.checked);"{if $ship2diff} checked="checked"{/if} />
          </div>
        </td>
      </tr>
{/if}

    </tbody>

    <tbody id="ship_box">
{if $default_fields.s_title.avail eq 'Y'}
      <tr>
        <td class="data-name">{$lng.lbl_title}</td>
        <td class="data-required">{if $default_fields.s_title.required eq 'Y'}*{/if}</td>
        <td> 
          <select name="s_title">
{include file="main/title_selector.tpl" field=$userinfo.s_titleid}
          </select> 
        </td> 
      </tr> 
 {/if}

{if $default_fields.s_firstname.avail eq 'Y'}
      <tr>
        <td class="data-name">{$lng.lbl_first_name}</td>
        <td class="data-required">{if $default_fields.s_firstname.required eq 'Y'}*{/if}</td>
        <td> 
          <input type="text" id="s_firstname" name="s_firstname" size="32" maxlength="32" value="{$userinfo.s_firstname|escape}" />
{if $reg_error ne "" and $userinfo.s_firstname eq "" && $default_fields.s_firstname.required eq 'Y'}<span class="error-message">&lt;&lt;</span>{/if}
        </td>
      </tr>
 {/if}

{if $default_fields.s_lastname.avail eq 'Y'}
      <tr>
        <td class="data-name">{$lng.lbl_last_name}</td>
        <td class="data-required">{if $default_fields.s_lastname.required eq 'Y'}*{/if}</td>
        <td>
          <input type="text" id="s_lastname" name="s_lastname" size="32" maxlength="32" value="{$userinfo.s_lastname|escape}" />
{if $reg_error ne "" and $userinfo.s_lastname eq "" && $default_fields.s_lastname.required eq 'Y'}<span class="error-message">&lt;&lt;</span>{/if}
        </td>
      </tr>
{/if}

{if $default_fields.s_address.avail eq 'Y'}
      <tr>
        <td class="data-name">{$lng.lbl_address}</td>
        <td class="data-required">{if $default_fields.s_address.required eq 'Y'}*{/if}</td>
        <td>
          <input type="text" id="s_address" name="s_address" size="32" maxlength="64" value="{$userinfo.s_address|escape}" />
{if $reg_error ne "" and $userinfo.s_address eq "" and $default_fields.s_address.required eq 'Y'}<span class="error-message">&lt;&lt;</span>{/if}
        </td>
      </tr>
{/if}

{if $default_fields.s_address_2.avail eq 'Y'}
      <tr>
        <td class="data-name">{$lng.lbl_address_2}</td>
        <td class="data-required">{if $default_fields.s_address_2.required eq 'Y'}*{/if}</td>
        <td>
          <input type="text" id="s_address_2" name="s_address_2" size="32" maxlength="64" value="{$userinfo.s_address_2|escape}" />
{if $reg_error ne "" and $userinfo.s_address_2 eq "" and $default_fields.s_address_2.required eq 'Y'}<span class="error-message">&lt;&lt;</span>{/if}
        </td>
      </tr>
{/if}

{if $default_fields.s_city.avail eq 'Y'}
      <tr>
        <td class="data-name">{$lng.lbl_city}</td>
        <td class="data-required">{if $default_fields.s_city.required eq 'Y'}*{/if}</td>
        <td>
          <input type="text" id="s_city" name="s_city" size="32" maxlength="64" value="{$userinfo.s_city|escape}" />
{if $reg_error ne "" and $userinfo.s_city eq "" and $default_fields.s_city.required eq 'Y'}<span class="error-message">&lt;&lt;</span>{/if}
        </td>
      </tr>
{/if}

{if $default_fields.s_county.avail eq 'Y' and $config.General.use_counties eq "Y"}
      <tr>
        <td class="data-name">{$lng.lbl_county}</td>
        <td class="data-required">{if $default_fields.s_county.required eq 'Y'}*{/if}</td>
        <td>
{include file="main/counties.tpl" counties=$counties name="s_county" default=$userinfo.s_county country_name="s_country"}
{if ($reg_error ne "" and $userinfo.s_county eq "" and $default_fields.s_county.required eq 'Y' && $userinfo.s_display_states) or $error eq "s_county"}<span class="error-message">&lt;&lt;</span>{/if}
        </td>
      </tr>
{/if}

{if $default_fields.s_state.avail eq 'Y'}
      <tr>
        <td class="data-name">{$lng.lbl_state}</td>
        <td class="data-required">{if $default_fields.s_state.required eq 'Y'}*{/if}</td>
        <td>
{include file="main/states.tpl" states=$states name="s_state" default=$userinfo.s_state|default:$config.General.default_state default_country=$userinfo.s_country|default:$config.General.default_country country_name="s_country"}
{if ($reg_error ne "" and $userinfo.s_state eq "" and $default_fields.s_state.required eq 'Y') or $error eq "s_statecode"}<span class="error-message">&lt;&lt;</span>{/if}
        </td>
      </tr>
{/if}

{if $default_fields.s_country.avail eq 'Y'}
      <tr>
        <td class="data-name">{$lng.lbl_country}</td>
        <td class="data-required">{if $default_fields.s_country.required eq 'Y'}*{/if}</td>
        <td>
          <select name="s_country" id="s_country" size="1" onchange="check_zip_code()">
{foreach from=$countries item=c}
            <option value="{$c.country_code}"{if ($userinfo.s_country eq $c.country_code) || ($c.country_code eq $config.General.default_country && $userinfo.s_country eq "")} selected="selected"{/if}>{$c.country|amp}</option>
{/foreach}
          </select>
{if $reg_error ne "" and $userinfo.s_country eq "" and $default_fields.s_country.required eq 'Y'}<span class="error-message">&lt;&lt;</span>{/if}
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
        <td class="data-name">{$lng.lbl_zip_code}</td>
        <td class="data-required">{if $default_fields.s_zipcode.required eq 'Y'}*{/if}</td>
        <td>
          <input type="text" id="s_zipcode" name="s_zipcode" size="32" maxlength="32" value="{$userinfo.s_zipcode|escape}" onchange="javascript: check_zip_code();" />
{if $reg_error ne "" and $userinfo.s_zipcode eq "" and $default_fields.s_zipcode.required eq 'Y'}<span class="error-message">&lt;&lt;</span>{/if}
        </td>
      </tr>
{/if}

{include file="customer/main/register_additional_info.tpl" section="S"}

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
