{*
$Id: taxed_price.tpl,v 1.16 2009/04/07 08:06:05 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $taxes}

  {foreach key=tax_name item=tax from=$taxes}

    {if $tax.tax_value gt 0 &&  $tax.display_including_tax eq "Y"}

      {if $display_info eq ""}
        {assign var="display_info" value=$tax.display_info}
      {/if}

      {$lng.lbl_including_tax|substitute:"tax":$tax.tax_display_name}

      {if $display_info eq "V" || ($display_info eq "A" && $tax.rate_type eq "$")}

        {if !$is_subtax}
          {include file="currency.tpl" value=$tax.tax_value tag_id="tax_`$tax.taxid`"}
        {else}
          {include file="currency.tpl" value=$tax.tax_value}
        {/if}

      {elseif $display_info eq "R"}

        {if $tax.rate_type eq "$"}
          {include file="currency.tpl" value=$tax.rate_value}
        {else}
          {$tax.rate_value}%
        {/if}

      {elseif $display_info eq "A"}

        {if $tax.rate_type eq "%"}
          {$tax.rate_value}% (

          {if !$is_subtax}
            {include file="currency.tpl" value=$tax.tax_value tag_id="tax_`$tax.taxid`"}
          {else}
            {include file="currency.tpl" value=$tax.tax_value}
          {/if}
          )

        {/if}

      {/if}

      <br />

    {/if}

  {/foreach}

{/if}
