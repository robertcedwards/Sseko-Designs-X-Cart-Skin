{*
$Id: products_list.tpl,v 1.189.2.22 2010/01/28 08:38:23 aim Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<div class="products products-list">
  {foreach from=$products item=product name=products}

<script type="text/javascript">
<!--
products_data[{$product.productid}] = {ldelim}{rdelim};
-->
</script>

    {if $active_modules.Product_Configurator and $is_pconf and $current_product}
      {assign var="url" value="product.php?productid=`$product.productid`&amp;pconf=`$current_product.productid`&amp;slot=`$slot`"}
    {else}
      {assign var="url" value="product.php?productid=`$product.productid`&amp;cat=`$cat`&amp;page=`$navigation_page`"}
      {if $featured eq 'Y'}
        {assign var="url" value=$url|cat:"&amp;featured=Y"}
      {/if}
    {/if}

    <div{interline name=products additional_class=item}>

      <div class="image">
        <div class="image-border">
        <a href="{$url}" class="image-link">{include file="product_thumbnail.tpl" productid=$product.productid image_x=$product.tmbn_x image_y=$product.tmbn_y product=$product.product tmbn_url=$product.tmbn_url}</a>

        {if $active_modules.Special_Offers}
          {include file="modules/Special_Offers/customer/product_offer_thumb.tpl"}
        {/if}
        </div>
        <a href="{$url}" class="see-details">{$lng.lbl_see_details}</a>

        {if $active_modules.Feature_Comparison}
          {include file="modules/Feature_Comparison/compare_checkbox.tpl"}
        {/if}

      </div>
      <div class="details"{if $config.Appearance.thumbnail_width gt 0 || $product.tmbn_x gt 0} style="margin-left: {math equation="x + 16" x=$config.Appearance.thumbnail_width|default:$product.tmbn_x|default:0}px;"{/if}>
        <a href="{$url}" class="product-title">{$product.product|escape}</a>

        {if $config.Appearance.display_productcode_in_list eq "Y" && $product.productcode ne ""}
          <div class="sku">{$lng.lbl_sku}: <span class="sku-value">{$product.productcode|escape}</span></div>
        {/if}

        <div class="descr">{$product.descr}</div>

        {if $product.rating_data}
          {include file="modules/Customer_Reviews/vote_bar.tpl" rating=$product.rating_data productid=$product.productid}
        {/if}

        {if $product.product_type eq "C"}

          {include file="customer/buttons/details.tpl" href=$url}

        {else}

          {if $active_modules.Subscriptions ne "" && ($product.catalogprice gt 0 || $product.sub_priceplan gt 0)}

            {include file="modules/Subscriptions/subscription_info_inlist.tpl"}

          {else}

            {if !$product.appearance.is_auction}

              {if $product.appearance.has_price}

                <div class="price-row{if $active_modules.Special_Offers ne "" && $product.use_special_price ne ""} special-price-row{/if}">
                  <span class="price">{$lng.lbl_our_price}:</span> <span class="price-value">{include file="currency.tpl" value=$product.taxed_price}</span>
                  <span class="market-price">{include file="customer/main/alter_currency_value.tpl" alter_currency_value=$product.taxed_price}</span>
                </div>

                {if $product.appearance.has_market_price && $product.appearance.market_price_discount gt 0}
                  <div class="market-price">
                    {$lng.lbl_market_price}: <span class="market-price-value">{include file="currency.tpl" value=$product.list_price}</span>

                    {if $product.appearance.market_price_discount gt 0}
                      {if $config.General.alter_currency_symbol ne ""}, {/if}
                      <span class="price-save">{$lng.lbl_save_price} {$product.appearance.market_price_discount}%</span>
                    {/if}

                  </div>
                {/if}

                {if $product.taxes}
                  <div class="taxes">
                    {include file="customer/main/taxed_price.tpl" taxes=$product.taxes is_subtax=true}
                  </div>
                {/if}

              {/if}

              {if $active_modules.Special_Offers ne "" && $product.use_special_price ne ""}
                {include file="modules/Special_Offers/customer/product_special_price.tpl"}
              {/if}

            {else}

              <span class="price">{$lng.lbl_enter_your_price}</span><br />
              {$lng.lbl_enter_your_price_note}

            {/if}

          {/if}

          {if $active_modules.Product_Configurator and $is_pconf and $current_product}
            {include file="modules/Product_Configurator/pconf_add_form.tpl"}
          {elseif $product.appearance.buy_now_enabled and $product.product_type ne "C"}
            {include file="customer/main/buy_now.tpl"}
          {/if}

        {/if}

      </div>

      <div class="clearing"></div>
    </div>

  {/foreach}

</div>
