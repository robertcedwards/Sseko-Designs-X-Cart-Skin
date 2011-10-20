{*
$Id: register_states.tpl,v 1.16 2009/06/17 08:10:04 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $country_id eq ''}
  {assign var="country_id" value=$country_name}
{/if}
<span style="display:none;">
<input id="{$country_id}_state_value" type="text" value='{$state_value|wm_remove|escape}' />
<input id="{$country_id}_county_value" type="text" value='{$county_value|wm_remove|escape}' />
</span>
<script type="text/javascript">
<!--
init_js_states(document.getElementById('{$country_id}'), '{$state_name}', '{$county_name}', '{$country_id}');
-->
</script>

