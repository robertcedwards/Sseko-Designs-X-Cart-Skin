{*
$Id: fancy_subcategories.tpl,v 1.6 2009/09/02 04:57:58 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<ul class="fancycat-icons-level-{$level}">

  {assign var="loop_name" value="subcat`$parentid`"}
  {foreach from=$categories item=c key=catid name=$loop_name}

    <li{interline name=$loop_name} style="z-index: {$smarty.foreach.$loop_name.total|dec:$smarty.foreach.$loop_name.iteration|inc:1};">
      {strip}
      <a href="home.php?cat={$catid}" class="{if $config.Flyout_Menus.icons_icons_in_categories gte $level+1}icon-link{/if}{if $config.Flyout_Menus.icons_disable_subcat_triangle eq 'Y' && $c.subcategory_count gt 0} sub-link{/if}{if $config.Flyout_Menus.icons_empty_category_vis eq 'Y' && !$c.childs && !$c.product_count} empty-link{/if}{if $config.Flyout_Menus.icons_nowrap_category ne 'Y'} nowrap-link{/if}">
        {if $config.Flyout_Menus.icons_icons_in_categories gte $level+1 && $c.is_icon}
          <img src="{$c.thumb_url|amp}" alt="" width="{$c.thumb_x}" height="{$c.thumb_y}" />
        {/if}
        {$c.category|amp}
        {if $config.Flyout_Menus.icons_display_products_cnt eq 'Y' && $c.top_product_count gt 0}
          &#32;({$c.top_product_count})
        {/if}
      </a>
      {/strip}

      {if $c.childs && $c.subcategory_count gt 0 && ($config.Flyout_Menus.icons_levels_limit eq 0 || $config.Flyout_Menus.icons_levels_limit gt $level)}
        {include file="`$fc_skin_path`/fancy_subcategories.tpl" categories=$c.childs parentid=$catid level=$level+1}
      {/if}
    </li>

  {/foreach}

</ul>
