{*
$Id: fancy_subcategories_exp.tpl,v 1.5 2009/07/16 06:09:58 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<ul class="fancycat-icons-level-{$level}">

  {assign var="loop_name" value="subcat`$parentid`"}
  {foreach from=$categories item=c key=catid name=$loop_name}
    {if $config.Flyout_Menus.icons_disable_subcat_triangle eq 'Y' && $c.subcategory_count gt 0}
      {assign var=additional_class value="closed sub-link"}
    {else}
      {assign var=additional_class value=''}
    {/if}

    <li id="cat-layer-{$c.categoryid}"{interline name=$loop_name additional_class=$additional_class}>
      {strip}
      {if $config.Flyout_Menus.icons_disable_subcat_triangle eq 'Y' && $c.subcategory_count gt 0}
        <a href="home.php?cat={$catid}" class="arrow" onclick="javascript: return switchSubcatLayer(this);"></a>
      {/if}
      <a href="home.php?cat={$catid}" class="{if $config.Flyout_Menus.icons_icons_in_categories gte $level+1}icon-link{/if}{if $config.Flyout_Menus.icons_disable_subcat_triangle eq 'Y' && $c.subcategory_count gt 0} sub-link{/if}{if $config.Flyout_Menus.icons_empty_category_vis eq 'Y' && !$c.childs && !$c.product_count} empty-link{/if}{if $config.Flyout_Menus.icons_nowrap_category ne 'Y'} nowrap-link{/if}">
        {$c.category|amp}
        {if $config.Flyout_Menus.icons_display_products_cnt eq 'Y' && $c.top_product_count gt 0}
          &#32;({$c.top_product_count})
        {/if}
      </a>
      {/strip}

      {if $c.childs && $c.subcategory_count gt 0 && ($config.Flyout_Menus.icons_levels_limit eq 0 || $config.Flyout_Menus.icons_levels_limit gt $level)}
        {include file="`$fc_skin_path`/fancy_subcategories_exp.tpl" categories=$c.childs parentid=$catid level=$level+1}
      {/if}
    </li>

  {/foreach}

</ul>
