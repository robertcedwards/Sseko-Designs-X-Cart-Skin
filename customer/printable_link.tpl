{*
$Id: printable_link.tpl,v 1.1 2009/04/17 13:03:09 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $printable_link_visible}
  <div class="printable-bar">
    <a href="{$php_url.url}?printable=Y{if $php_url.query_string ne ''}&amp;{$php_url.query_string|amp}{/if}">{$lng.lbl_printable_version}</a>
  </div>
{/if}
