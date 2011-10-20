{*
$Id: register_additional_info.tpl,v 1.5 2008/08/21 09:52:51 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $section ne '' && $additional_fields ne '' && (($is_areas.A eq 'Y' && $section eq 'A') || $section ne 'A')}
{if $hide_header eq "" && $section eq 'A'}
<tr>
<td height="20" colspan="3"><font class="RegSectionTitle">{$lng.lbl_additional_information}</font><hr size="1" noshade="noshade" /></td>
</tr>
{/if}
{foreach from=$additional_fields item=v}
{if $section eq $v.section && $v.avail eq 'Y'}
<tr>
<td align="right">{$v.title|default:$v.field}</td>
<td>{if $v.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap">
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
{if $reg_error ne "" and $v.value eq "" && $v.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}
{/foreach}
{/if}
