{*
$Id: ga_code.tpl,v 1.6 2009/04/18 06:33:05 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $ga_track_commerce neq "Y" || $ga_init eq "Y"}
<script type="text/javascript">
//<!--[CDATA[
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("\<script src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'>\<\/script>" ));
//]]-->
</script>

<script type="text/javascript">
//<!--[CDATA[
if (window._gat && _gat._getTracker) {ldelim}
  var pageTracker = _gat._getTracker("{$config.Google_Analytics.ganalytics_code}");

  if (pageTracker && pageTracker._initData) {ldelim}
    pageTracker._initData();

    if (pageTracker && pageTracker._trackPageview)
      pageTracker._trackPageview();
  {rdelim}
{rdelim}
//]]-->
</script>
{/if}
