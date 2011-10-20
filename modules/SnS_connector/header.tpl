{*
$Id: header.tpl,v 1.8 2008/10/29 16:50:48 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $sns_collector_path_url ne ''}
  <script src="{$sns_collector_path_url}/tracker.js.{$config.SnS_connector.sns_script_extension}" type="text/javascript"></script>
  <noscript>
    <img style="display: none" src="{$sns_collector_path_url}/static.{$config.SnS_connector.sns_script_extension}" alt="" />
  </noscript>
{/if}

