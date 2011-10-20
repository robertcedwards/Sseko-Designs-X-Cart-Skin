{*
$Id: search.tpl,v 1.17 2009/05/12 06:22:13 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<div class="search">
    <form method="post" action="search.php" name="productsearchform">

      <input type="hidden" name="simple_search" value="Y" />
      <input type="hidden" name="mode" value="search" />
      <input type="hidden" name="posted_data[by_title]" value="Y" />
      <input type="hidden" name="posted_data[by_descr]" value="Y" />
      <input type="hidden" name="posted_data[by_sku]" value="Y" />
      <input type="hidden" name="posted_data[search_in_subcategories]" value="Y" />
      <input type="hidden" name="posted_data[including]" value="all" />

      {strip}

        <div class="search-top-box">
        <input type="text" name="posted_data[substring]" class="text{if !$search_prefilled.substring} default-value{/if}" value="{$search_prefilled.substring|default:$lng.lbl_search|escape}" />
        {include file="customer/buttons/button.tpl" type="input" style="image"}
        </div>
        <a href="search.php" class="search">{$lng.lbl_advanced_search}</a>
      {/strip}

    </form>

</div>
