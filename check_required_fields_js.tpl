{*
$Id: check_required_fields_js.tpl,v 1.23 2009/04/18 06:33:00 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{*
Use service array:
  requiredFields
array structure:
  array(id, name, shadow_flag)
where:
  id       - tag id
  name     - element name
*}
<script type="text/javascript">
<!--
var lbl_required_field_is_empty = "{$lng.lbl_required_field_is_empty|strip_tags|wm_remove|escape:javascript}";
var lbl_field_format_is_invalid = "{$lng.lbl_field_format_is_invalid|wm_remove|escape:javascript}";
var txt_required_fields_not_completed = "{$lng.txt_required_fields_not_completed|wm_remove|escape:javascript}";
{if $use_email_validation ne "N"}
var txt_email_invalid = "{$lng.txt_email_invalid|wm_remove|escape:javascript}";
var email_validation_regexp = new RegExp("{$email_validation_regexp|wm_remove|escape:javascript}", "gi");
{/if}
-->
</script>
<script type="text/javascript" src="{$SkinDir}/check_required_fields_js.js"></script>

