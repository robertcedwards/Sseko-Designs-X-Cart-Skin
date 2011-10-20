{*
$Id: product.tpl,v 1.202 2009/06/22 05:59:17 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

<script type="text/javascript" src="{$SkinDir}/customer/popup_open.js"></script>
<script type="text/javascript" src="{$SkinDir}/main/popup_image.js"></script>

{include file="form_validation_js.tpl"}

<h1>{$product.producttitle}</h1>

{if $product.product_type eq "C" && $active_modules.Product_Configurator}

  {include file="modules/Product_Configurator/pconf_customer_product.tpl"}

{else}

  {if $config.General.ajax_add2cart eq 'Y' && $config.General.redirect_to_cart ne 'Y'}
    {include file="customer/ajax.add2cart.tpl" _include_once=1}

<script type="text/javascript">
<!--
{literal}
$(ajax).bind(
  'load',
  function() {
    var elm = $('.product-details').get(0);
    return elm && ajax.widgets.product(elm);
  }
);
{/literal}
-->
</script>

  {/if}

  {capture name=dialog}

  <div class="product-details">

    <div class="image"{if $max_image_width gt 0} style="width: {math equation="x+14" x=$max_image_width}px;"{/if}>

      {if $active_modules.Detailed_Product_Images && $config.Detailed_Product_Images.det_image_popup eq 'Y' && $images ne '' && $js_enabled eq 'Y'}

        {include file="modules/Detailed_Product_Images/popup_image.tpl"}

      {else}

          <div class="image-box" style="{if $max_image_width gt 0}width: {math equation="x+14" x=$max_image_width}px;{/if}">
            {include file="product_thumbnail.tpl" productid=$product.image_id image_x=$product.image_x image_y=$product.image_y product=$product.product|escape tmbn_url=$product.image_url id="product_thumbnail" type=$product.image_type}
          </div>

      {/if}

      {if $active_modules.Magnifier && $config.Magnifier.magnifier_image_popup eq 'Y' && $zoomer_images && $js_enabled eq 'Y'}
        {include file="modules/Magnifier/popup_magnifier.tpl"}
      {/if}

    </div>

    <div class="details"{if $max_image_width gt 0} style="margin-left: {math equation="x+14" x=$max_image_width}px;"{/if}>

      {include file="customer/main/product_details.tpl"}

      {if $active_modules.Feature_Comparison ne ""}
        {include file="modules/Feature_Comparison/product_buttons.tpl"}
      {/if}

    </div>
    <div class="clearing"></div>

  </div>

  {/capture}
  {include file="customer/dialog.tpl" title=$product.producttitle|escape content=$smarty.capture.dialog noborder=true}

{/if}

{if $active_modules.Magnifier && ($config.Magnifier.magnifier_image_popup ne 'Y' || $js_enabled ne 'Y')}
  {include file="modules/Magnifier/product_magnifier.tpl" productid=$product.productid}
{/if}

{if $active_modules.Special_Offers}
  {include file="modules/Special_Offers/customer/product_offers_short_list.tpl"}
{/if}

{if $config.Appearance.send_to_friend_enabled eq 'Y' && !$printable}
  {include file="customer/main/send_to_friend.tpl" }
{/if}

{if $active_modules.Detailed_Product_Images && ($config.Detailed_Product_Images.det_image_popup ne 'Y' || $js_enabled ne 'Y')}
  {include file="modules/Detailed_Product_Images/product_images.tpl" }
{/if}

{if $active_modules.Upselling_Products}
  {include file="modules/Upselling_Products/related_products.tpl" }
{/if}

{if $active_modules.Recommended_Products}
  {include file="modules/Recommended_Products/recommends.tpl" }
{/if}

{if $active_modules.Customer_Reviews}
  {include file="modules/Customer_Reviews/vote_reviews.tpl" }
{/if}

{if $active_modules.Product_Options && ($product_options ne '' || $product_wholesale ne '') && ($product.product_type ne "C" || !$active_modules.Product_Configurator)}
<script type="text/javascript">
<!--
check_options();
-->
</script>
{/if}
