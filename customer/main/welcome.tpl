{*
$Id: welcome.tpl,v 1.33 2008/10/30 17:57:31 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<div class="welcome-top">

  <img src="{$ImagesDir}/fashion_mosaic/welcome.jpg" class="welcome" alt="" />
  {if $categories && ($active_modules.Flyout_Menus || $config.General.root_categories eq "Y" || $subcategories)}
    {include file="customer/categories.tpl" }
  {else}
    <img src="{$ImagesDir}/spacer.gif" alt="" class="empty-height-extender" />
  {/if}

</div>

{if $active_modules.Bestsellers && $config.Bestsellers.bestsellers_menu ne "Y"}
  {include file="modules/Bestsellers/bestsellers.tpl"}<br />
{/if}

{include file="customer/main/featured.tpl"}

<img src="{$ImagesDir}/spacer.gif" class="menu-columns" alt="" />

<table cellspacing="0" class="menu-columns" summary="{$lng.lbl_special|escape}">
  <tr>

    <td>
      {if $active_modules.Feature_Comparison && $comparison_products ne ''}
        {include file="modules/Feature_Comparison/product_list.tpl" }
      {/if}
      {if $active_modules.Bestsellers}
        {include file="modules/Bestsellers/menu_bestsellers.tpl" }
      {/if}
      {if $active_modules.XAffiliate && $config.XAffiliate.partner_register eq 'Y'}
        {include file="partner/menu_affiliate.tpl" }
      {/if}
    </td>

    <td>
      {include file="customer/special.tpl"}
      {include file="customer/help/menu.tpl"}
    </td>

    <td>
      {include file="customer/news.tpl"}
      {if $active_modules.Interneka}
        {include file="modules/Interneka/menu_interneka.tpl" }
      {/if}
    </td>

    <td class="contact-us">
      {if $active_modules.SnS_connector && $config.SnS_connector.sns_display_button eq 'Y'}
        {include file="modules/SnS_connector/button.tpl"}
      {else}
        <a href="help.php?section=contactus&amp;mode=update" class="contact-us"><img src="{$ImagesDir}/spacer.gif" alt="" /></a>
      {/if}
    </td>

  </tr>
</table>

