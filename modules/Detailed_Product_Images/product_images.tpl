{*
$Id: product_images.tpl,v 1.22 2009/10/05 08:01:36 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $images ne ""}

  {capture name=dialog}

    {foreach from=$images item=i name=images}
      <img src="{if $i.image_url}{$i.image_url|amp}{else}{$xcart_web_dir}/image.php?id={$i.imageid}&amp;type=D{/if}" alt="{$i.alt|escape}"{if $smarty.foreach.images.last} class="last"{/if} />
    {/foreach}

  {/capture}
  {include file="customer/dialog.tpl" title=$lng.lbl_detailed_images content=$smarty.capture.dialog additional_class="dpimages-list"}

{/if}
