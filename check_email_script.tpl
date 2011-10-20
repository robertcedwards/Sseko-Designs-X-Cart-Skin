{*
$Id: check_email_script.tpl,v 1.25 2008/11/17 12:47:40 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<script type="text/javascript">
<!--
var txt_email_invalid = "{$lng.txt_email_invalid|wm_remove|escape:javascript|replace:"\n":" "|replace:"\r":" "}";
var email_validation_regexp = new RegExp("{$email_validation_regexp|wm_remove|escape:javascript}", "gi");
-->
</script>
<script type="text/javascript" src="{$SkinDir}/check_email_script.js"></script>
