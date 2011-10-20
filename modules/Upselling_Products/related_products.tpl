{*
$Id: related_products.tpl,v 1.25 2009/05/01 13:55:35 vvs Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $product_links ne "" && $printable ne "Y"}

  {capture name=dialog}

    <ul class="uproducts">

      {foreach from=$product_links item=p name=related}
        <li{interline name=related}><a href="product.php?productid={$p.productid}"{if $config.Upselling_Products.upselling_new_window eq 'Y'} target="_blank"{/if}>{$p.product|amp}</a></li>
      {/foreach}

    </ul>

  {/capture}
  {include file="customer/dialog.tpl" title=$lng.lbl_related_products content=$smarty.capture.dialog additional_class="uproducts"}

{/if}
