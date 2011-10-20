{*
$Id: user_profiles.tpl,v 1.23 2009/04/18 06:33:02 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<script type="text/javascript">
<!--
{literal}
function displayVariants(obj, objv) {
  if (!objv)
    objv = document.getElementById('newfield_variants'); 
  if (!obj || !objv)
    return false;
  objv.disabled = (obj.value != 'S');
}
{/literal}
-->
</script>

<table cellpadding="3" cellspacing="1" width="100%">

<tr>
  <td>

<form action="configuration.php" method="post">
<input type="hidden" name="option" value="{$option}" />
<input type="hidden" name="mode" value="update_status" />

<table cellpadding="3" cellspacing="1" width="100%">

<tr class="TableHead">
  <td rowspan="2" width="20%" nowrap="nowrap">{$lng.lbl_field_name}</td>
{foreach from=$usertypes_array item=to_disable key=utype}
  <td align="center">
{if $utype eq "A"}{$lng.lbl_administrator}{elseif $utype eq "P"}{$lng.lbl_provider}{elseif $utype eq "B"}{$lng.lbl_partner}{elseif $utype eq "H"}{$lng.lbl_customer_at_checkout}{else}{$lng.lbl_customer}{/if}
  </td>
{/foreach}
</tr>

<tr class="TableHeadLevel2">
{foreach from=$usertypes_array item=to_disable key=utype}
  <td width="{$col_width}%" align="center" nowrap="nowrap">{$lng.lbl_active} / {$lng.lbl_required}</td>
{/foreach}
</tr>

{foreach from=$default_fields item=item key=field}

{if $item.field eq "title"}
{assign var="part_title" value=$lng.lbl_personal_information}
{elseif $item.field eq "b_title"}
{assign var="part_title" value=$lng.lbl_billing_address}
{elseif $item.field eq "s_title"}
{assign var="part_title" value=$lng.lbl_shipping_address}
{elseif $item.field eq "phone"}
{assign var="part_title" value=$lng.lbl_contact_information}
{else}
{assign var="part_title" value=""}
{/if}

{if $part_title}
<tr>
  <td colspan="{$colspan}"><br />{include file="main/subheader.tpl" title=$part_title class="grey"}</td>
</tr>
{/if}

<tr{cycle values=", class='TableSubHead'"}>
  <td>
  {$item.title}
  <input type="hidden" name="default_data[{$item.field}][flag]" value="Y" />
  </td>
{foreach from=$usertypes_array item=to_disable key=utype}
  <td align="center">
  <input type="checkbox"{if $to_disable eq ''} onclick="javascript: document.getElementById('dr_{$item.field}_{$utype}').disabled = !this.checked;" name="default_data[{$item.field}][avail][{$utype}]"{/if}{if $item.avail.$utype eq "Y"} checked="checked"{/if}{if $to_disable or $item.field eq "email"} disabled="disabled"{/if} />
  &nbsp;/&nbsp;
  <input type="checkbox"{if $to_disable eq ''} id="dr_{$item.field}_{$utype}" name="default_data[{$item.field}][required][{$utype}]"{/if}{if $item.required.$utype eq "Y"} checked="checked"{/if}{if $to_disable or $item.avail.$utype ne "Y" or $item.field eq "email"} disabled="disabled"{/if} />
{if $to_disable or $item.field eq "email"}
{if $item.required.$utype eq "Y"}<input type="hidden" name="default_data[{$item.field}][required][{$utype}]" value='Y' />{/if}
{if $item.avail.$utype eq "Y"}<input type="hidden" name="default_data[{$item.field}][avail][{$utype}]" value='Y' />{/if}
{/if}
  </td>
{/foreach}
</tr>

{foreach from=$additional_fields item=v key=k}
{if ($item.field eq "tax_number" && $v.section eq 'P') || ($item.field eq "b_zipcode" && $v.section eq 'B') || ($item.field eq "s_zipcode" && $v.section eq 'S') || ($item.field eq "url" && $v.section eq 'C')}
<tr{cycle values=", class='TableSubHead'"}>
  <td>{$v.title|default:$v.field}</td>
{foreach from=$usertypes_array item=to_disable key=utype}
  <td align="center">
  <input type="checkbox" onclick="javascript: document.getElementById('ar_{$v.fieldid}_{$utype}').disabled = !this.checked;" name="add_data[{$v.fieldid}][avail][{$utype}]"{if $v.avail.$utype eq "Y"} checked="checked"{/if} />
  &nbsp;/&nbsp;
  <input id="ar_{$v.fieldid}_{$utype}" type="checkbox" name="add_data[{$v.fieldid}][required][{$utype}]"{if $v.required.$utype eq "Y"} checked="checked"{/if}{if $v.avail.$utype ne "Y"} disabled="disabled"{/if} />
  </td>
{/foreach}
</tr>
{/if}
{/foreach}

{/foreach}

{foreach from=$additional_fields item=v key=k}
{if $v.section eq 'A'}
{if $ai_exist ne 'Y'}
<tr>
  <td colspan="{$colspan}"><br />{include file="main/subheader.tpl" title=$lng.lbl_additional_information class="grey"}</td>
</tr>
{assign var="ai_exist" value='Y'}
{/if}
<tr{cycle values=", class='TableSubHead'"}>
  <td>{$v.title|default:$v.field}</td>
{foreach from=$usertypes_array item=to_disable key=utype}
  <td align="center">
  <input type="checkbox" onclick="javascript: document.getElementById('ar_{$v.fieldid}_{$utype}').disabled = !this.checked;" name="add_data[{$v.fieldid}][avail][{$utype}]"{if $v.avail.$utype eq "Y"} checked="checked"{/if} />
  &nbsp;/&nbsp;
  <input id="ar_{$v.fieldid}_{$utype}" type="checkbox" name="add_data[{$v.fieldid}][required][{$utype}]"{if $v.required.$utype eq "Y"} checked="checked"{/if}{if $v.avail.$utype ne "Y"} disabled="disabled"{/if} />
  </td>
{/foreach}
</tr>
{/if}
{/foreach}

<tr>
  <td colspan="{$colspan}"><br />
  <input type="submit" value=" {$lng.lbl_save|strip_tags:false|escape} " />
  </td>
</tr>

</table>
</form>

<br /><br />

<form action="configuration.php" method="post" name="fieldsform">
<input type="hidden" name="option" value="{$option}" />
<input type="hidden" name="mode" value="update_fields" />

<table cellpadding="3" cellspacing="1" width="100%">

<tr>
  <td colspan="5"><br />{include file="main/subheader.tpl" title=$lng.lbl_additional_fields}</td>
</tr>

<tr class="TableHead">
  <td>&nbsp;</td>
  <td nowrap="nowrap">{$lng.lbl_field_name}</td>
  <td>{$lng.lbl_section}</td>
  <td>{$lng.lbl_type}</td>
  <td nowrap="nowrap">{$lng.lbl_pos}</td>
</tr>

{if $additional_fields}
{foreach from=$additional_fields item=v}
<tr>
  <td><input type="checkbox" name="fields[{$v.fieldid}]" value="Y" /></td>
  <td><input type="text" size="30" maxlength="100" name="update[{$v.fieldid}][field]" value="{$v.title|default:$v.field}" /></td>
  <td>
  <select name="update[{$v.fieldid}][section]">
    {foreach from=$sections item=s key=k}
      <option value="{$k}"{if $v.section eq $k} selected="selected"{/if}>{$s}</option>
    {/foreach}
  </select>
  </td>
  <td>
  <select name="update[{$v.fieldid}][type]" onchange="javascript: displayVariants(this, document.getElementById('var_{$v.fieldid}'));">
  {foreach from=$types item=t key=k}
    <option value="{$k}"{if $v.type eq $k} selected="selected"{/if}>{$t}</option>
  {/foreach}
  </select>
  </td>
  <td><input type="text" name="update[{$v.fieldid}][orderby]" value="{$v.orderby}" size="5" /></td>
</tr>
{if $v.type eq 'S'}
<tr>
    <td>&nbsp;</td>
    <td colspan="4"><input id="var_{$v.fieldid}" {if $v.type ne 'S'} disabled="disabled"{/if}type="text" size="60" name="update[{$v.fieldid}][variants]" value="{$v.variants|escape}" /></td>
</tr>
{/if}
{/foreach}

<tr>
  <td colspan="5"><br />
  <input type="button" value="{$lng.lbl_delete_selected|strip_tags:false|escape}" onclick="javascript: if (checkMarks(this.form, new RegExp('fields', 'ig'))) submitForm(this, 'delete');" />
  </td>
</tr>

{else}

<tr>
  <td colspan="5" align="center">{$lng.txt_no_additional_fields}</td>
</tr>

{/if}

<tr>
  <td colspan="5"><br />{include file="main/subheader.tpl" title=$lng.lbl_add_new_field}</td>
</tr>

<tr>
  <td>&nbsp;</td>
  <td><input type="text" name="newfield" size="30" maxlength="100" /></td>
  <td>
  <select name="newfield_section">
  {foreach from=$sections item=v key=k}
    <option value="{$k}">{$v}</option>
  {/foreach}
  </select>
  </td>
  <td>
  <select id="newfield_type" name="newfield_type" onchange="javascript: displayVariants(this);">
  {foreach from=$types item=v key=k}
    <option value="{$k}">{$v}</option>
  {/foreach}
  </select>
  </td>
  <td><input type="text" size="5" name="newfield_orderby" /></td>
</tr>

<tr>
  <td>&nbsp;</td>
  <td colspan="4">{$lng.lbl_variants_for_selectbox}:</td>
</tr>
<tr>
  <td>&nbsp;</td>
  <td colspan="4"><input disabled="disabled" id="newfield_variants" type="text" size="60" name="newfield_variants" /></td>
</tr> 

<tr>
  <td colspan="5" class="SubmitBox"><input type="submit" value="{$lng.lbl_add_update|strip_tags:false|escape}" /></td>
</tr>

</table>
</form>

  </td>
</tr>
</table>
