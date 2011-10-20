{*
$Id: contactus.tpl,v 1.11 2009/08/10 10:52:20 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

<h1>{$lng.lbl_contact_us}</h1>

<script type="text/javascript">
<!--
var requiredFields = [
{foreach from=$default_fields item=v key=k name=default_fields}
{if $v.required eq 'Y' && $v.avail eq 'Y'}
  ["{$k}","{$v.title|strip|wm_remove|escape:javascript}", false],

{/if}
{/foreach}
{foreach from=$additional_fields item=v key=k}
{if $v.required eq 'Y' && $v.type eq 'T'  && $v.avail eq 'Y'} 
  ["additional_values_{$v.fieldid}","{$v.title|strip|wm_remove|escape:javascript}", false],

{/if} 
{/foreach}
  ["subject","{$lng.lbl_subject|strip|wm_remove|escape:javascript}", false],
  ["message_body","{$lng.lbl_message|strip|wm_remove|escape:javascript}", false]
];
-->
</script>
{include file="check_required_fields_js.tpl"}
{include file="check_email_script.tpl"}
{include file="check_zipcode_js.tpl"}

{if $smarty.get.mode eq "update" || $smarty.get.mode eq ""}
  <p class="text-block">{$lng.txt_contact_us_header}</p>
{/if}

{capture name=dialog}

  {if $smarty.get.mode eq "sent"}

    {$lng.txt_contact_us_sent}

  {elseif $smarty.get.mode eq "update" || $smarty.get.mode eq ""}

    <form action="help.php?section=contactus&amp;mode=update&amp;action=contactus" method="post" name="registerform" onsubmit="javascript: return checkEmailAddress(this.email) &amp;&amp; checkRequired(requiredFields) &amp;&amp; check_zip_code(document.getElementById('b_country'), document.getElementById('b_zipcode'));">
      <input type="hidden" name="usertype" value="{$usertype}" />

      <table cellspacing="0" class="data-table" summary="{$lng.lbl_contact_us|escape}">

        {if $default_fields.username.avail eq 'Y'}
          <tr>
            <td class="data-name">{$lng.lbl_username}</td>
            <td class="data-required">{if $default_fields.username.required eq 'Y'}*{/if}</td>
            <td><input type="text" id="username" name="username" size="32" maxlength="32" value="{if $userinfo.username ne ''}{$userinfo.username}{else}{$userinfo.login}{/if}" /></td>
          </tr>
        {/if}

        {if $default_fields.title.avail eq 'Y'}
          <tr>
            <td class="data-name">{$lng.lbl_title}</td>
            <td class="data-required">{if $default_fields.title.required eq 'Y'}*{/if}</td>
             <td>
              <select id="title" name="title">
                {include file="main/title_selector.tpl" field=$userinfo.titleid}
              </select>
            </td>
          </tr>
        {/if}

        {if $default_fields.firstname.avail eq 'Y'}
          <tr>
            <td class="data-name">{$lng.lbl_first_name}</td>
            <td class="data-required">{if $default_fields.firstname.required eq 'Y'}*{/if}</td>
            <td>
              <input type="text" id="firstname" name="firstname" size="32" maxlength="32" value="{$userinfo.firstname|escape}" />
              {if $fillerror ne "" and $userinfo.firstname eq "" && $default_fields.firstname.required eq 'Y'}
                <span class="error-message">&lt;&lt;</span>
              {/if}
            </td>
          </tr>
        {/if}
 
        {if $default_fields.lastname.avail eq 'Y'}
          <tr>
            <td class="data-name">{$lng.lbl_last_name}</td>
            <td class="data-required">{if $default_fields.lastname.required eq 'Y'}*{/if}</td>
            <td>
              <input type="text" id="lastname" name="lastname" size="32" maxlength="32" value="{$userinfo.lastname|escape}" />
              {if $fillerror ne "" and $userinfo.lastname eq "" && $default_fields.lastname.required eq 'Y'}
                <span class="error-message">&lt;&lt;</span>
              {/if}
            </td>
          </tr>
        {/if}

        {if $default_fields.company.avail eq 'Y'}
          <tr>
            <td class="data-name">{$lng.lbl_company}</td>
            <td class="data-required">{if $default_fields.company.required eq 'Y'}*{/if}</td>
            <td>
              <input type="text" id="company" name="company" size="32" value="{$userinfo.company|escape}" />
              {if $fillerror ne "" and $userinfo.company eq "" && $default_fields.company.required eq 'Y'}
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
              {if $fillerror ne "" and $userinfo.b_address eq "" && $default_fields.b_address.required eq 'Y'}
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
              {if $fillerror ne "" and $userinfo.b_address_2 eq "" && $default_fields.b_address_2.required eq 'Y'}
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
              {if $fillerror ne "" and $userinfo.b_city eq "" && $default_fields.b_city.required eq 'Y'}
                <span class="error-message">&lt;&lt;</span>
              {/if}
            </td>
          </tr>
        {/if}
 
        {if $default_fields.b_county.avail eq 'Y' && $config.General.use_counties eq "Y"}
          <tr>
            <td class="data-name">{$lng.lbl_county}</td>
            <td class="data-required">{if $default_fields.b_county.required eq 'Y'}*{/if}</td>
            <td>
              {include file="main/counties.tpl" counties=$counties name="b_county" default=$userinfo.b_county stateid=$userinfo.b_stateid country_name="b_country"}
            </td>
          </tr>
        {/if}

        {if $default_fields.b_state.avail eq 'Y'}
          <tr>
            <td class="data-name">{$lng.lbl_state}</td>
            <td class="data-required">{if $default_fields.b_state.required eq 'Y'}*{/if}</td>
            <td>
              {include file="main/states.tpl" states=$states name="b_state" default=$userinfo.b_state|default:$config.General.default_state default_country=$userinfo.b_country|default:$config.General.default_country country_name="b_country"}
            </td>
          </tr>
        {/if}
 
        {if $default_fields.b_country.avail eq 'Y'}
          <tr>
            <td class="data-name">{$lng.lbl_country}</td>
            <td class="data-required">{if $default_fields.b_country.required eq 'Y'}*{/if}</td>
            <td>
              <select id="b_country" name="b_country" onchange="javascript: check_zip_code();">
                {foreach from=$countries item=c}
                  <option value="{$c.country_code}"{if ($userinfo.b_country eq $c.country_code) || ($c.country_code eq $config.General.default_country && $userinfo.b_country eq "")} selected="selected"{/if}>{$c.country}</option>
                {/foreach}
              </select>
            </td>
          </tr>
        {/if}

        {if $default_fields.b_state.avail eq 'Y' && $default_fields.b_country.avail eq 'Y'}
          <tr style="display: none;">
            <td>
              {include file="change_states_js.tpl"}
              {include file="main/register_states.tpl" state_name="b_state" country_name="b_country" county_name="b_county" state_value=$userinfo.b_state|default:$config.General.default_state county_value=$userinfo.b_county}
            </td>
          </tr>
        {/if}

        {if $default_fields.b_zipcode.avail eq 'Y'}
          <tr>
            <td class="data-name">{$lng.lbl_zip_code}</td>
            <td class="data-required">{if $default_fields.b_zipcode.required eq 'Y'}*{/if}</td>
            <td>
              <input type="text" id="b_zipcode" name="b_zipcode" size="32" maxlength="32" value="{$userinfo.b_zipcode|escape}" onchange="javascript: check_zip_code(document.getElementById('b_country'), this);" />
              {if $fillerror ne "" and $userinfo.b_zipcode eq "" && $default_fields.b_zipcode.required eq 'Y'}
                <span class="error-message">&lt;&lt;</span>
              {/if}
            </td>
          </tr>
        {/if}
 
        {if $default_fields.phone.avail eq 'Y'}
          <tr>
            <td class="data-name">{$lng.lbl_phone}</td>
            <td class="data-required">{if $default_fields.phone.required eq 'Y'}*{/if}</td>
            <td>
              <input type="text" id="phone" name="phone" size="32" maxlength="32" value="{$userinfo.phone|escape}" />
              {if $fillerror ne "" and $userinfo.phone eq "" && $default_fields.phone.required eq 'Y'}
                <span class="error-message">&lt;&lt;</span>
              {/if}
            </td>
          </tr>
        {/if}
 
        {if $default_fields.email.avail eq 'Y'}
          <tr>
            <td class="data-name">{$lng.lbl_email}</td>
            <td class="data-required">{if $default_fields.email.required eq 'Y'}*{/if}</td>
            <td>
              <input type="text" id="email" name="email" size="32" maxlength="128" value="{$userinfo.email|escape}" onchange="javascript: checkEmailAddress(this);" />
              {if $fillerror ne "" and $userinfo.email eq "" && $default_fields.email.required eq 'Y'}
                <span class="error-message">&lt;&lt;</span>
              {/if}
            </td>
          </tr>
        {/if}

        {if $default_fields.fax.avail eq 'Y'}
          <tr>
            <td class="data-name">{$lng.lbl_fax}</td>
            <td class="data-required">{if $default_fields.fax.required eq 'Y'}*{/if}</td>
            <td><input type="text" id="fax" name="fax" size="32" maxlength="128" value="{$userinfo.fax|escape}" /></td>
          </tr>
        {/if}
 
        {if $default_fields.url.avail eq 'Y'}
          <tr>
            <td class="data-name">{$lng.lbl_web_site}</td>
            <td class="data-required">{if $default_fields.url.required eq 'Y'}*{/if}</td>
            <td>
              <input type="text" id="url" name="url" size="32" maxlength="128" value="{if $userinfo.url eq ""}http://{else}{$userinfo.url}{/if}" />
              {if $fillerror ne "" and $userinfo.url eq "" && $default_fields.url.required eq 'Y'}
                <span class="error-message">&lt;&lt;</span>
              {/if}
            </td>
          </tr>
        {/if}

        {foreach from=$additional_fields item=v}
          {if $v.avail eq "Y"}
            <tr>
              <td class="data-name">{$v.title|default:$v.field}</td>
              <td>{if $v.required eq 'Y'}*{else}&nbsp;{/if}</td>
              <td>

                {if $v.type eq 'T'}
                  <input type="text" id="additional_values_{$v.fieldid}" name="additional_values[{$v.fieldid}]" size="32" value="{$v.value|escape}" />

                {elseif $v.type eq 'C'}
                  <input type="checkbox" id="additional_values_{$v.fieldid}" name="additional_values[{$v.fieldid}]" value="Y"{if $v.value eq 'Y'} checked="checked"{/if} />

                {elseif $v.type eq 'S'}

                  <select id="additional_values_{$v.fieldid}" name="additional_values[{$v.fieldid}]">
                    {foreach from=$v.variants item=o}
                      <option value='{$o|escape}'{if $v.value eq $o} selected="selected"{/if}>{$o|escape}</option>
                    {/foreach}
                  </select>
                {/if}

                {if $fillerror ne "" and $v.value eq "" && $v.required eq 'Y'}
                  <span class="error-message">&lt;&lt;</span>
                {/if}
              </td>
            </tr>
          {/if}
        {/foreach}

        {if $default_fields.department.avail eq 'Y'}
          <tr>
            <td class="data-name">{$lng.lbl_department}</td>
            <td class="data-required">{if $default_fields.department.required eq 'Y'}*{/if}</td>
            <td>

              <select id="department" name="department">
                <option value="All" {if $userinfo.department eq "All" or $userinfo.department eq ""}selected="selected"{/if}>{$lng.lbl_all}</option>
                <option value="Partners" {if $userinfo.department eq "Partners"}selected="selected"{/if}>{$lng.lbl_partners}</option>
                <option value="Marketing / publicity" {if $userinfo.department eq "Marketing / publicity"}selected="selected"{/if}>{$lng.lbl_marketing_publicity}</option>
                <option value="Webdesign" {if $userinfo.department eq "Webdesign"}selected="selected"{/if}>{$lng.lbl_web_design}</option>
                <option value="Sales" {if $userinfo.department eq "Sales"}selected="selected"{/if}>{$lng.lbl_sales_department}</option>
              </select>

            </td>
          </tr>
        {/if}

        <tr>
          <td class="data-name">{$lng.lbl_subject}</td>
          <td class="data-required">*</td>
          <td>
            <input type="text" id="subject" name="subject" size="32" maxlength="128" value="{$userinfo.subject|escape}" />
            {if $fillerror ne "" and $userinfo.subject eq ""}
              <span class="error-message">&lt;&lt;</span>
            {/if}
          </td>
        </tr>

        <tr>
          <td class="data-name">{$lng.lbl_message}</td>
          <td class="data-required">*</td>
          <td>
            <textarea cols="48" id="message_body" rows="12" name="body">{$userinfo.body}</textarea>
            {if $fillerror ne "" and $userinfo.body eq ""}
              <span class="error-message">&lt;&lt;</span>
            {/if}
          </td>
        </tr>

        {if $active_modules.Image_Verification && $show_antibot.on_contact_us eq 'Y'}
          {include file="modules/Image_Verification/spambot_arrest.tpl" mode="data-table" id=$antibot_sections.on_contact_us antibot_err=$antibot_contactus_err}
        {/if}

        <tr>
          <td colspan="2">&nbsp;</td>
          <td class="button-row">
            {include file="customer/buttons/submit.tpl" type="input" additional_button_class="main-button"}
          </td>
        </tr>

      </table>

    </form>

  {/if}

{/capture}
{include file="customer/dialog.tpl" title=$lng.lbl_contact_us content=$smarty.capture.dialog noborder=true}
