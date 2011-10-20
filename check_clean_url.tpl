{*
$Id: check_clean_url.tpl,v 1.5 2008/11/17 12:47:40 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<script type="text/javascript"><!--
var err_clean_url_wrong_format = "{$lng.err_clean_url_wrong_format|wm_remove|escape:javascript|replace:"\n":" "|replace:"\r":" "}";
var clean_url_validation_regexp = new RegExp("{$clean_url_validation_regexp|wm_remove|escape:javascript}", "g");
//--></script>
<script type="text/javascript" src="{$SkinDir}/check_clean_url.js"></script>
