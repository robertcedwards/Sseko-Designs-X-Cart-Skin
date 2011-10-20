{*
$Id: generate_required_fields_js.tpl,v 1.12 2009/04/18 06:33:00 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<script type="text/javascript">
<!--
var requiredFields = [
{foreach from=$default_fields item=v key=k}
{if $v.required eq 'Y' && $v.avail eq 'Y' && !$v.js_required_block}
  ["{$k}", "{$v.title|strip|replace:'"':'\"'}"],
{/if}
{/foreach}
{foreach from=$additional_fields item=v key=k}
{if $v.required eq 'Y' && $v.type eq 'T'  && $v.avail eq 'Y'} 
  ["additional_values_{$v.fieldid}", "{$v.title|strip|replace:'"':'\"'}"],
{/if} 
{/foreach}
{if $anonymous eq "" || $config.General.disable_anonymous_checkout eq "Y"}
  ["uname", "{$lng.lbl_username|strip|replace:'"':'\"'}"],
  ["passwd1", "{$lng.lbl_password|strip|replace:'"':'\"'}"],
  ["passwd2", "{$lng.lbl_confirm_password|strip|replace:'"':'\"'}"],
{/if}
  false
];
-->
</script>
