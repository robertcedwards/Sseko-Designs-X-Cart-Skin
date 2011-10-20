{*
$Id: bestsellers.tpl,v 1.14 2009/04/18 06:33:04 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $bestsellers}

  {capture name=bestsellers}

    <ul class="bestsellers-products-item">
      {foreach from=$bestsellers item=bestseller}

        <li>
          {if $config.Bestsellers.bestsellers_thumbnails eq "Y"}
            <a href="product.php?productid={$bestseller.productid}&amp;cat={$cat}&amp;bestseller=Y">{include file="product_thumbnail.tpl" productid=$bestseller.productid product=$bestseller.product tmbn_url=$bestseller.tmbn_url}</a>
            <div class="details">
              <a class="product-title" href="product.php?productid={$bestseller.productid}&amp;cat={$cat}&amp;bestseller=Y">{$bestseller.product|escape}</a><br />
              {$lng.lbl_our_price}: {include file="currency.tpl" value=$bestseller.taxed_price}
            </div>
            <div class="clearing"></div>
          {else}
            <a class="product-title" href="product.php?productid={$bestseller.productid}&amp;cat={$cat}&amp;bestseller=Y">{$bestseller.product|escape}1</a><br />
            {$lng.lbl_our_price}: {include file="currency.tpl" value=$bestseller.taxed_price}
          {/if}
        </li>

      {/foreach}
    </ul>

  {/capture}
  {include file="customer/dialog.tpl" title=$lng.lbl_bestsellers content=$smarty.capture.bestsellers}

{/if}
