{*
$Id: recommends.tpl,v 1.16 2009/04/18 06:33:07 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $recommends}

  {capture name=recommends}

    <ul class="rproducts">

      {foreach from=$recommends item=p name=recommends}
        <li{interline name=recommends}><a href="product.php?productid={$p.productid}">{$p.product|amp}</a></li>
      {/foreach}

    </ul>

  {/capture}

  {include file="customer/dialog.tpl" title=$lng.txt_recommends_comment content=$smarty.capture.recommends additional_class="rproducts-dialog"}

{/if}
