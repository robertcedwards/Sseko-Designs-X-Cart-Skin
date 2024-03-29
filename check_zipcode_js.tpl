{*
$Id: check_zipcode_js.tpl,v 1.16.2.4 2010/01/22 15:53:22 aim Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<script type="text/javascript">
<!--
var config_default_country = "{$config.General.default_country|wm_remove|escape:javascript}";

// used in check_zip_code_field() from check_zipcode.js
// note: you should update language variables after change this table
// Please, update func_check_zip php function after any changes
{literal}
var check_zip_code_rules = {
  AT: { rules: [/^\d{4}$/gi] },
  CA: { rules: [/^[ a-z0-9-]{6,7}$/gi] },
  CH: { rules: [/^\d{4}$/gi] },
  DE: { rules: [/^\d{5}$/gi] },
  LU: { rules: [/^\d{4}$/gi] },
  US: { rules: [/^\d{5}$/gi] }
};
{/literal}

txt_error_common_zip_code = '{$lng.txt_error_common_zip_code|strip_tags|wm_remove|escape:javascript}';
check_zip_code_rules.AT.error = '{$lng.txt_error_at_zip_code|strip_tags|wm_remove|escape:javascript}';
check_zip_code_rules.CA.error = '{$lng.txt_error_ca_zip_code|strip_tags|wm_remove|escape:javascript}';
check_zip_code_rules.CH.error = '{$lng.txt_error_ch_zip_code|strip_tags|wm_remove|escape:javascript}';
check_zip_code_rules.DE.error = '{$lng.txt_error_de_zip_code|strip_tags|wm_remove|escape:javascript}';
check_zip_code_rules.LU.error = '{$lng.txt_error_lu_zip_code|strip_tags|wm_remove|escape:javascript}';
check_zip_code_rules.US.error = '{$lng.txt_error_us_zip_code|strip_tags|wm_remove|escape:javascript}';

lbl_billing_address = '{$lng.lbl_billing_address|lower|strip_tags|wm_remove|escape:javascript} ';
lbl_shipping_address = '{$lng.lbl_shipping_address|lower|strip_tags|wm_remove|escape:javascript} ';
check_zip_code_posted_alert = '';
-->
</script>
<script type="text/javascript" src="{$SkinDir}/check_zipcode.js"></script>

