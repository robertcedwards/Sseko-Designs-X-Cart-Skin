{*
$Id: bread_crumbs.tpl,v 1.7 2009/06/05 11:46:27 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $location}
<table width="100%">
<tr>
  <td valign="top" align="left">
  <div id="location">
      {foreach from=$location item=l name=location}
        {if $l.1 && !$smarty.foreach.location.last}
          <a href="{$l.1|amp}" class="bread-crumb{if $smarty.foreach.location.last} last-bread-crumb{/if}">{if $webmaster_mode eq "editor"}{$l.0}{else}{$l.0|escape}{/if}</a>
        {else}
          <font class="bread-crumb{if $smarty.foreach.location.last} last-bread-crumb{/if}">{if $webmaster_mode eq "editor"}{$l.0}{else}{$l.0|escape}{/if}</font>
        {/if}
        {if !$smarty.foreach.location.last}
          <span>::</span>
        {/if}
      {/foreach}
  </div>
  </td>
  <td width="130" valign="top" align="right">
  {include file="customer/printable_link.tpl"}
  </td>
</tr>
</table>
{/if}
