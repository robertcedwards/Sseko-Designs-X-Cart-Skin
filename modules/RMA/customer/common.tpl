{*
$Id: common.tpl,v 1.2 2009/04/20 11:00:12 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $mode eq 'modify'}
  {include file="modules/RMA/customer/modify_return.tpl"}

{elseif $mode eq 'search'}
  {if $returns eq ''}
    {include file="modules/RMA/customer/search.tpl"}
  {/if}
  {include file="modules/RMA/customer/returns.tpl"}

{else}

  {include file="modules/RMA/customer/search.tpl"}

{/if}
