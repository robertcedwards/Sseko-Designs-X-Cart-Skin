{*
$Id: register_contact_info.tpl,v 1.7 2009/06/29 07:54:30 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $is_areas.C eq 'Y'}
{if $hide_header eq ""}
      <tr>
        <td class="register-section-title" colspan="3">
          <div>
            <label>{$lng.lbl_contact_information}</label>
          </div>
        </td>
      </tr>
{/if}

{if $default_fields.phone.avail eq 'Y'}
      <tr>
        <td class="data-name">{$lng.lbl_phone}</td>
        <td class="data-required">{if $default_fields.phone.required eq 'Y'}*{/if}</td>
        <td>
          <input type="text" id="phone" name="phone" size="32" maxlength="32" value="{$userinfo.phone|escape}" />
{if $reg_error ne "" and $userinfo.phone eq "" and $default_fields.phone.required eq 'Y'}<span class="error-message">&lt;&lt;</span>{/if}
        </td>
      </tr>
{/if}

{if $default_fields.email.avail eq 'Y'}
      <tr>
        <td class="data-name">{$lng.lbl_email}</td>
        <td class="data-required">{if $default_fields.email.required eq 'Y'}*{/if}</td>
        <td>
          <input type="text" id="email" name="email" size="32" maxlength="128" value="{$userinfo.email|escape}" onblur="javascript: $('#email_note').hide();" onfocus="showNote('email_note',this);" />
          <div id="email_note" class="note-box" style="display: none;">{$lng.txt_email_note}</div>
          {if $emailerror ne "" or ($reg_error ne "" and $userinfo.email eq "" and $default_fields.email.required eq 'Y')}<span class="error-message">&lt;&lt;</span>{/if}
        </td>
      </tr>
{/if}
{if $default_fields.fax.avail eq 'Y'}
      <tr>
        <td class="data-name">{$lng.lbl_fax}</td>
        <td class="data-required">{if $default_fields.fax.required eq 'Y'}*{/if}</td>
        <td>
          <input type="text" id="fax" name="fax" size="32" maxlength="128" value="{$userinfo.fax|escape}" />
{if $reg_error ne "" and $userinfo.fax eq "" and $default_fields.fax.required eq 'Y'}<span class="error-message">&lt;&lt;</span>{/if}
        </td>
      </tr>
{/if}
{if $default_fields.url.avail eq 'Y'}
      <tr>
        <td class="data-name">{$lng.lbl_web_site}</td>
        <td class="data-required">{if $default_fields.url.required eq 'Y'}*{/if}</td>
        <td>
          <input type="text" id="url" name="url" size="32" maxlength="128" value="{$userinfo.url|escape}" />
{if $reg_error ne "" and $userinfo.url eq "" and $default_fields.url.required eq 'Y'}<span class="error-message">&lt;&lt;</span>{/if}
        </td>
      </tr>
{/if}

{include file="customer/main/register_additional_info.tpl" section="C"}

{/if}

