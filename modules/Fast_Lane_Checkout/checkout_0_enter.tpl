{*
$Id: checkout_0_enter.tpl,v 1.29 2009/07/28 12:16:25 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<br>
<br>
<h1>{$lng.lbl_my_account}</h1>
{if $active_modules.Image_Verification and $show_antibot.on_login eq 'Y' and $login_antibot_on}
  {assign var="is_antibot" value="Y"}
{/if}
{if $active_modules.Image_Verification && $show_antibot.on_login eq 'Y' && $login_antibot_on and $main ne 'disabled'}
  {assign var="left_ext_additional_class" value=" flc-ext-left-dialog"}
  {assign var="right_ext_additional_class" value=" flc-ext-right-dialog"}
{/if}
{capture name=dialog}
  {*<div class="text-block2">{$lng.txt_login_incorrect}</div>*}
  {include file="customer/main/login_form.tpl" is_flc=true}
{/capture}
{include file="customer/dialog.tpl" title=$lng.lbl_returning_customer content=$smarty.capture.dialog additional_class="flc-left-dialog`$left_ext_additional_class`"}
<script type="text/javascript">
<!--
{literal}
function show_regdlg() {
  $('#content-container').css("height", "auto");
  document.getElementById('flc-register-dialog').style.display = (document.getElementById('flc-register-dialog').style.display == '') ? 'none' : '';
  setTimeout(
    function() {
      self.location.hash = 'regdlg';
    },
    200
  );
  if (typeof(window.IEFix) != 'undefined') window.IEFix();
  $('#content-container').css("height", "auto");
  change_width_iefix();
  return false;
}
{/literal}
-->
</script>
{capture name=dialog}
  <span class="flc-login-text">
    {$lng.lbl_flc_new_customer_text}
    <a href="cart.php?mode=checkout&amp;no_script=Y#regdlg" onclick="javascript: return show_regdlg();">{$lng.lbl_flc_new_customer_link}</a>
  </span>
{/capture}
{include file="customer/dialog.tpl" title=$lng.lbl_new_customer content=$smarty.capture.dialog additional_class="flc-right-dialog`$right_ext_additional_class`"}
<div class="clearing"></div>
{if $paypal_express_active}
  {include file="payments/ps_paypal_pro_express_checkout.tpl"}
{/if}
<div id="flc-register-dialog"{if $av_error ne 1 && $js_enabled && $top_message.reg_error eq '' && $smarty.get.no_script ne 'Y'} style="display: none;"{/if}>
  <a name="regdlg"></a>
  {include file="customer/main/register.tpl"}
</div>
{if $top_message.reg_error ne '' || $av_error eq 1}
<script type="text/javascript">
<!--
self.location = '#regdlg';
-->
</script>
{/if}
