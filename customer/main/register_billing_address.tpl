{*
$Id: register_billing_address.tpl,v 1.6 2009/06/29 07:54:30 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $is_areas.B eq 'Y'}
  {if $hide_header eq ""}
    <tr>
      <td colspan="3" class="register-section-title">
        <div>
          <label>{$lng.lbl_billing_address}</label>
        </div>
      </td>
    </tr>
  {/if}

  {if $action eq "cart"}
    <tr style="display: none;">
      <td>
        <input type="hidden" name="action" value="cart" />
        <input type="hidden" name="paymentid" value="{$paymentid}" />
      </td>
    </tr>
  {/if}

  {if $default_fields.b_title.avail eq 'Y'}
    <tr>
      <td class="data-name">{$lng.lbl_title}</td>
      <td class="data-required">{if $default_fields.b_title.required eq 'Y'}*{/if}</td>
      <td>
        <select id="b_title" name="b_title">
          {include file="main/title_selector.tpl" field=$userinfo.b_titleid}
        </select>
      </td>
    </tr>
  {/if}

  {if $default_fields.b_firstname.avail eq 'Y'}
    <tr>
      <td class="data-name">{$lng.lbl_first_name}</td>
      <td class="data-required">{if $default_fields.b_firstname.required eq 'Y'}*{/if}</td>
      <td>
        <input type="text" id="b_firstname" name="b_firstname" size="32" maxlength="32" value="{$userinfo.b_firstname|escape}" />
        {if $reg_error ne "" and $userinfo.b_firstname eq "" && $default_fields.b_firstname.required eq 'Y'}
          <span class="error-message">&lt;&lt;</span>
        {/if}
      </td>
    </tr>
  {/if}

  {if $default_fields.b_lastname.avail eq 'Y'}
    <tr>
      <td class="data-name">{$lng.lbl_last_name}</td>
      <td class="data-required">{if $default_fields.b_lastname.required eq 'Y'}*{/if}</td>
      <td>
        <input type="text" id="b_lastname" name="b_lastname" size="32" maxlength="32" value="{$userinfo.b_lastname|escape}" />
        {if $reg_error ne "" and $userinfo.b_lastname eq "" && $default_fields.b_lastname.required eq 'Y'}
          <span class="error-message">&lt;&lt;</span>
        {/if}
      </td>
    </tr>
  {/if}

  {if $default_fields.b_address.avail eq 'Y'}
    <tr>
      <td class="data-name">{$lng.lbl_address}</td>
      <td class="data-required">{if $default_fields.b_address.required eq 'Y'}*{/if}</td>
      <td>
        <input type="text" id="b_address" name="b_address" size="32" maxlength="64" value="{$userinfo.b_address|escape}" />
        {if $reg_error ne "" and $userinfo.b_address eq "" and $default_fields.b_address.required eq 'Y'}
          <span class="error-message">&lt;&lt;</span>
        {/if}
      </td>
    </tr>
  {/if}

  {if $default_fields.b_address_2.avail eq 'Y'}
    <tr>
      <td class="data-name">{$lng.lbl_address_2}</td>
      <td class="data-required">{if $default_fields.b_address_2.required eq 'Y'}*{/if}</td>
      <td>
        <input type="text" id="b_address_2" name="b_address_2" size="32" maxlength="64" value="{$userinfo.b_address_2|escape}" />
        {if $reg_error ne "" and $userinfo.b_address_2 eq "" and $default_fields.b_address_2.required eq 'Y'}
          <span class="error-message">&lt;&lt;</span>
        {/if}
      </td>
    </tr>
  {/if}

  {if $default_fields.b_city.avail eq 'Y'}
    <tr>
      <td class="data-name">{$lng.lbl_city}</td>
      <td class="data-required">{if $default_fields.b_city.required eq 'Y'}*{/if}</td>
      <td>
        <input type="text" id="b_city" name="b_city" size="32" maxlength="64" value="{$userinfo.b_city|escape}" />
        {if $reg_error ne "" and $userinfo.b_city eq "" and $default_fields.b_city.required eq 'Y'}
          <span class="error-message">&lt;&lt;</span>
        {/if}
      </td>
    </tr>
  {/if}

  {if $default_fields.b_county.avail eq 'Y' and $config.General.use_counties eq "Y"}
    <tr>
      <td class="data-name">{$lng.lbl_county}</td>
      <td class="data-required">{if $default_fields.b_county.required eq 'Y'}*{/if}</td>
      <td>
        {include file="main/counties.tpl" counties=$counties name="b_county" default=$userinfo.b_county country_name="b_country"}
        {if ($reg_error ne "" and $userinfo.b_county eq "" and $default_fields.b_county.required eq 'Y') or $error eq "b_county"}
          <span class="error-message">&lt;&lt;</span>
        {/if}
      </td>
    </tr>
  {/if}

  {if $default_fields.b_state.avail eq 'Y'}
    <tr>
      <td class="data-name">{$lng.lbl_state}</td>
      <td class="data-required">{if $default_fields.b_state.required eq 'Y'}*{/if}</td>
      <td>
        {include file="main/states.tpl" states=$states name="b_state" default=$userinfo.b_state|default:$config.General.default_state default_country=$userinfo.b_country|default:$config.General.default_country country_name="b_country"}
        {if $error eq "b_statecode" || ($reg_error ne "" && $userinfo.b_state eq "" && $default_fields.b_state.required eq 'Y' && $userinfo.s_display_states)}
          <span class="error-message">&lt;&lt;</span>
        {/if}
      </td>
    </tr>
  {/if}

  {if $default_fields.b_country.avail eq 'Y'}
    <tr>
      <td class="data-name">{$lng.lbl_country}</td>
      <td class="data-required">{if $default_fields.b_country.required eq 'Y'}*{/if}</td>
      <td>
        <select name="b_country" id="b_country" onchange="check_zip_code()">
          {foreach from=$countries item=c}
            <option value="{$c.country_code}"{if $userinfo.b_country eq $c.country_code || ($c.country_code eq $config.General.default_country && $userinfo.b_country eq "")} selected="selected"{/if}>{$c.country|amp}</option>
          {/foreach}
        </select>
        {if $reg_error ne "" and $userinfo.b_country eq "" and $default_fields.b_country.required eq 'Y'}
          <span class="error-message">&lt;&lt;</span>
        {/if}
      </td>
    </tr>
  {/if}

  {if $default_fields.b_state.avail eq 'Y' && $default_fields.b_country.avail eq 'Y' && $js_enabled eq 'Y'}
    <tr style="display: none;">
      <td>
        {include file="main/register_states.tpl" state_name="b_state" country_name="b_country" county_name="b_county" state_value=$userinfo.b_state|default:$config.General.default_state county_value=$userinfo.b_county}
      </td>
    </tr>
  {/if}

  {if $default_fields.b_zipcode.avail eq 'Y'}
    <tr>
      <td class="data-name">{$lng.lbl_zip_code}</td>
      <td class="data-required">{if $default_fields.b_zipcode.required eq 'Y'}*{/if}</td>
      <td>
        <input type="text" id="b_zipcode" name="b_zipcode" size="32" maxlength="32" value="{$userinfo.b_zipcode|escape}" onchange="javascript: check_zip_code();" />
        {if $reg_error ne "" and $userinfo.b_zipcode eq "" and $default_fields.b_zipcode.required eq 'Y'}
          <span class="error-message">&lt;&lt;</span>
        {/if}
      </td>
    </tr>
  {/if}

  {include file="customer/main/register_additional_info.tpl" section="B"}

{/if}
