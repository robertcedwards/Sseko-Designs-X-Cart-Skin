{*
$Id: dialog.tpl,v 1.10 2009/04/22 12:39:49 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<div class="dialog{if $additional_class} {$additional_class}{/if}{if $noborder} noborder{/if}{if $sort && $printable ne 'Y'} list-dialog{/if}">
  <div class="title">
    <h2>{$title}</h2>
    {if $sort && $printable ne 'Y'}
      <div class="sort-box">
        {if $selected eq '' && $direction eq ''}
          {include file="customer/search_sort_by.tpl" selected=$search_prefilled.sort_field direction=$search_prefilled.sort_direction url=$products_sort_url}
        {else}
          {include file="customer/search_sort_by.tpl" url=$products_sort_url}
        {/if}
      </div>
    {/if}
  </div>
  <div class="content">{$content}</div>
</div>
