{*
$Id: tabs.tpl,v 1.2 2009/04/21 11:42:00 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $speed_bar}
  <div class="tabs">
    <ul>

      {foreach from=$speed_bar item=sb name=tabs}
        <li{interline name=tabs}><a href="{$sb.link|amp}">{$sb.title}</a></li>
      {/foreach}

    </ul>
  </div>
{/if}
