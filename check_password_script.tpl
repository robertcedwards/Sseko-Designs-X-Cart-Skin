{*
$Id: check_password_script.tpl,v 1.3 2008/11/17 12:47:40 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<script type="text/javascript" language="JavaScript 1.2">
<!--
var txt_simple_password = "{$lng.txt_simple_password|wm_remove|escape:javascript|replace:"\n":" "|replace:"\r":" "}";
var txt_password_match_error = "{$lng.txt_password_match_error|wm_remove|escape:javascript|replace:"\n":" "|replace:"\r":" "}";
-->
</script>
<script type="text/javascript" src="{$SkinDir}/check_password_script.js"></script>
