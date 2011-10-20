{*
$Id: customer_manufacturers_list.tpl,v 1.11 2009/04/17 13:03:10 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

<h1>{$lng.lbl_manufacturers}</h1>

{capture name=dialog}

  {include file="customer/main/navigation.tpl"}

  <ul class="manufacturers-list list-item">
    {foreach from=$manufacturers item=v}
      <li><a href="manufacturers.php?manufacturerid={$v.manufacturerid}">{$v.manufacturer|escape}</a></li>
    {/foreach}
  </ul>

  {include file="customer/main/navigation.tpl"}

{/capture}
{include file="customer/dialog.tpl" title=$lng.lbl_manufacturers content=$smarty.capture.dialog noborder=true}
