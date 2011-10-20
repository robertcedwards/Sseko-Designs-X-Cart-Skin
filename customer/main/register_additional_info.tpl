{*
$Id: register_additional_info.tpl,v 1.3 2009/06/29 07:54:30 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $section ne '' && $additional_fields ne '' && (($is_areas.A eq 'Y' && $section eq 'A') || $section ne 'A')}

  {if $hide_header eq "" && $section eq 'A'}
    <tr>
      <td colspan="3" class="register-section-title">
        <div>
          <label>{$lng.lbl_additional_information}</label>
        </div>
      </td>
    </tr>
  {/if}

  {foreach from=$additional_fields item=v}
    {if $section eq $v.section && $v.avail eq 'Y'}
      <tr>
        <td class="data-name">{$v.title|default:$v.field}</td>
        <td class="data-required">{if $v.required eq 'Y'}*{/if}</td>
        <td>

          {if $v.type eq 'T'}
            <input type="text" name="additional_values[{$v.fieldid}]" id="additional_values_{$v.fieldid}" size="32" value="{$v.value|escape}" />

          {elseif $v.type eq 'C'}
            <input type="checkbox" name="additional_values[{$v.fieldid}]" id="additional_values_{$v.fieldid}" value="Y"{if $v.value eq 'Y'} checked="checked"{/if} />

          {elseif $v.type eq 'S'}
            <select name="additional_values[{$v.fieldid}]" id="additional_values_{$v.fieldid}">
              {foreach from=$v.variants item=o}
                <option value='{$o|escape}'{if $v.value eq $o} selected="selected"{/if}>{$o|escape}</option>
              {/foreach}
            </select>
          {/if}

          {if $reg_error ne "" and $v.value eq "" && $v.required eq 'Y'}
            <span class="error-message">&lt;&lt;</span>
          {/if}
        </td>
      </tr>
    {/if}
  {/foreach}

{/if}
