{*
$Id: pages.tpl,v 1.10 2009/04/17 13:03:09 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

<h1>{$page_data.title}</h1>

{capture name=dialog}

  {if $page_content ne ''}

    {if $config.General.parse_smarty_tags eq "Y"}
      {eval var=$page_content}
    {else}
      {$page_content}
    {/if}

  {/if}

{/capture}
{include file="customer/dialog.tpl" title=$page_data.title content=$smarty.capture.dialog noborder=true}
