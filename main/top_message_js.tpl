{*
$Id: top_message_js.tpl,v 1.3 2008/12/02 08:04:40 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<script type="text/javascript">
<!--
var top_message_icon = {ldelim}
  "E": "{$ImagesDir}/icon_error_small.gif",
  "W": "{$ImagesDir}/icon_warning_small.gif",
  "I": "{$ImagesDir}/icon_info_small.gif"
{rdelim};

var top_message_title = {ldelim}
  "E": "{$lng.lbl_error}",
  "W": "{$lng.lbl_warning}",
  "I": "{$lng.lbl_information}"
{rdelim};
-->
</script>
<script type="text/javascript" src="{$SkinDir}/main/top_message.js"></script>
