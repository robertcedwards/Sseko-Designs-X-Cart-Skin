{*
$Id: search_sort_by.tpl,v 1.7 2009/04/18 06:33:02 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $sort_fields && ($url || $navigation_script)}

  {if $url eq '' && $navigation_script ne ''}
    {assign var="url" value=$navigation_script}
  {/if}

  {if $navigation_page gt 1}
    {assign var="url" value=$url|amp|cat:"&amp;page=`$navigation_page`"}
  {else}
    {assign var="url" value=$url|amp}
  {/if}

  <div class="search-sort-bar no-print">
    <strong class="search-sort-title">{$lng.lbl_sort_by}:</strong>

    {foreach from=$sort_fields key=name item=field}

      <span class="search-sort-cell">
        {if $name eq $selected}
          <a href="{$url}&amp;sort={$name}&amp;sort_direction={if $direction eq 1}0{else}1{/if}" title="{$lng.lbl_sort_by|escape}: {$field|escape}" class="search-sort-link {if $direction}down-direction{else}up-direction{/if}">{$field}</a>
        {else}
          <a href="{$url}&amp;sort={$name}&amp;sort_direction={$direction}" title="{$lng.lbl_sort_by|escape}: {$field|escape}" class="search-sort-link">{$field}</a>
        {/if}
      </span>

    {/foreach}

  </div>

{/if}
