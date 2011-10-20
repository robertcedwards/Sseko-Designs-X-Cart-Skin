{*
$Id: product.tpl,v 1.14 2009/07/21 13:23:30 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{foreach from=$extra_fields item=v}
  {if $v.active eq "Y" && $v.field_value}
    <tr>
      <td class="property-name">{$v.field}</td>
      <td class="property-value" colspan="2">{$v.field_value}</td>
    </tr>
  {/if}
{/foreach}
