{*
$Id: customer_details_html.tpl,v 1.10 2009/04/18 06:33:05 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

<div class="flc-checkout-address-left">

  {include file="customer/subheader.tpl" title=$lng.lbl_contact_information class="grey"}

  <table cellspacing="0" class="flc-checkout-address" summary="{$lng.lbl_contact_information|escape}">
  <tr class="hidden"><td colspan="2">&nbsp;</td></tr>
{if $userinfo.default_fields.title}
    <tr>
      <td>{$lng.lbl_title}:</td>
      <td>{$userinfo.title}</td>
    </tr>
{/if}

{if $userinfo.default_fields.firstname}
    <tr>
      <td>{$lng.lbl_first_name}:</td>
      <td>{$userinfo.firstname}</td>
    </tr>
{/if}

{if $userinfo.default_fields.lastname}
    <tr> 
      <td>{$lng.lbl_last_name}:</td>
      <td>{$userinfo.lastname}</td>
    </tr>
{/if}

{if $userinfo.default_fields.company}
    <tr> 
      <td>{$lng.lbl_company}:</td>
      <td>{$userinfo.company}</td>
    </tr>
{/if}

{if $userinfo.default_fields.tax_number}
    <tr>
      <td>{$lng.lbl_tax_number}:</td>
      <td>{$userinfo.tax_number}</td>
    </tr>
{/if}

{if $userinfo.default_fields.phone}
    <tr> 
      <td>{$lng.lbl_phone}:</td>
      <td>{$userinfo.phone}</td>
    </tr>
{/if}

{if $userinfo.default_fields.fax}
    <tr>  
      <td>{$lng.lbl_fax}:</td>
      <td>{$userinfo.fax}</td>
    </tr>
{/if}

{if $userinfo.default_fields.email}
    <tr>   
      <td>{$lng.lbl_email}:</td>
      <td>{$userinfo.email}</td>
    </tr>
{/if}

{if $userinfo.default_fields.url}
    <tr>   
      <td>{$lng.lbl_web_site}:</td>
      <td>{$userinfo.url}</td>
    </tr>
{/if}

{foreach from=$userinfo.additional_fields item=v}
{if $v.section eq 'C' || $v.section eq 'P'}
    <tr>
      <td>{$v.title}:</td>
      <td>{$v.value}</td>
    </tr>
{/if}
{/foreach}

  </table>
</div>
<div class="clearing"></div>

<div class="flc-checkout-address-left">
  {include file="customer/subheader.tpl" title=$lng.lbl_billing_address class="grey"}

  <table cellspacing="0" class="flc-checkout-address" summary="{$lng.lbl_billing_address|escape}">
  <tr class="hidden"><td colspan="2">&nbsp;</td></tr>
{if $userinfo.default_fields.b_title}
    <tr>
      <td>{$lng.lbl_title}:</td>
      <td>{$userinfo.b_title}</td>
    </tr>
{/if}

{if $userinfo.default_fields.b_firstname}
    <tr>
      <td>{$lng.lbl_first_name}:</td>
      <td>{$userinfo.b_firstname}</td>
    </tr>
{/if}

{if $userinfo.default_fields.b_lastname}
    <tr>
      <td>{$lng.lbl_last_name}:</td>
      <td>{$userinfo.b_lastname}</td>
    </tr>
{/if}

{if $userinfo.default_fields.b_address}
    <tr>
      <td>{$lng.lbl_address}:</td>
      <td>
        {$userinfo.b_address}
{if $userinfo.b_address_2}
        <br />{$userinfo.b_address_2}
{/if}
      </td>
    </tr>
{/if}

{if $userinfo.default_fields.b_city}
    <tr> 
      <td>{$lng.lbl_city}:</td>
      <td>{$userinfo.b_city}</td>
    </tr>
{/if}

{if $userinfo.default_fields.b_state}
    <tr> 
      <td>{$lng.lbl_state}:</td>
      <td>{$userinfo.b_statename}</td>
    </tr>
{/if}

{if $userinfo.default_fields.b_country}
    <tr> 
      <td>{$lng.lbl_country}:</td>
      <td>{$userinfo.b_countryname}</td>
    </tr>
{/if}

{if $userinfo.default_fields.b_zipcode}
    <tr> 
      <td>{$lng.lbl_zip_code}:</td>
      <td>{$userinfo.b_zipcode}</td>
    </tr>
{/if}

{foreach from=$userinfo.additional_fields item=v}
{if $v.section eq 'B'}
    <tr>
      <td>{$v.title}:</td>
      <td>{$v.value}</td>
    </tr>
{/if}
{/foreach}

  </table>
</div>

<div class="flc-checkout-address-right">
  {include file="customer/subheader.tpl" title=$lng.lbl_shipping_address class="grey"}

  <table cellspacing="0" class="flc-checkout-address" summary="{$lng.lbl_shipping_address|escape}">
  <tr class="hidden"><td colspan="2">&nbsp;</td></tr>
{if $userinfo.default_fields.s_title}
    <tr>
      <td>{$lng.lbl_title}:</td>
      <td>{$userinfo.s_title}</td>
    </tr>
{/if}

{if $userinfo.default_fields.s_firstname}
    <tr>
      <td>{$lng.lbl_first_name}:</td>
      <td>{$userinfo.s_firstname}</td>
    </tr>
{/if}

{if $userinfo.default_fields.s_lastname}
    <tr> 
      <td>{$lng.lbl_last_name}:</td>
      <td>{$userinfo.s_lastname}</td>
    </tr>
{/if}

{if $userinfo.default_fields.s_address}
    <tr> 
      <td>{$lng.lbl_address}:</td>
      <td>
        {$userinfo.s_address}
{if $userinfo.s_address_2}
        <br />{$userinfo.s_address_2}
{/if}
      </td>
    </tr>
{/if}

{if $userinfo.default_fields.s_city}
    <tr> 
      <td>{$lng.lbl_city}:</td>
      <td>{$userinfo.s_city}</td>
    </tr>
{/if}

{if $userinfo.default_fields.s_state}
    <tr> 
      <td>{$lng.lbl_state}:</td>
      <td>{$userinfo.s_statename}</td>
    </tr>
{/if}

{if $userinfo.default_fields.s_country}
    <tr> 
      <td>{$lng.lbl_country}:</td>
      <td>{$userinfo.s_countryname}</td>
    </tr>
{/if}

{if $userinfo.default_fields.s_zipcode}
    <tr> 
      <td>{$lng.lbl_zip_code}:</td>
      <td>{$userinfo.s_zipcode}</td>
    </tr>
{/if}

{foreach from=$userinfo.additional_fields item=v}
{if $v.section eq 'S'}
    <tr>
      <td>{$v.title}:</td>
      <td>{$v.value}</td>
    </tr>
{/if}
{/foreach}

  </table>
</div>
<div class="clearing"></div>

{capture name=addfields}
{foreach from=$userinfo.additional_fields item=v}
{if $v.section eq 'A'}
    <tr>
      <td>{$v.title}:</td>
      <td>{$v.value}</td>
    </tr>
{/if}
{/foreach}
{/capture}

{if $smarty.capture.addfields ne ""}

<div class="flc-checkout-address-left">
  {include file="customer/subheader.tpl" title=$lng.lbl_additional_information class="grey"}

  <table cellspacing="0" class="flc-checkout-address" summary="{$lng.lbl_additional_information|escape}">
    {$smarty.capture.addfields}
  </table>
</div>
<div class="clearing"></div>

{/if}
