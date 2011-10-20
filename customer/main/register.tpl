{*
$Id: register.tpl,v 1.82 2009/08/26 12:46:33 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

{if $smarty.get.action ne "cart"}
  {if $login}
    <h1>{$lng.lbl_modify_profile}</h1>
  {else}
    {if $anonymous and $config.General.disable_anonymous_checkout neq "Y"}
      <h1>{$lng.lbl_enter_personal_details}</h1>
    {else}
      <h1>{$lng.lbl_create_profile}</h1>
    {/if}
  {/if}
{/if}

{if $av_error eq 1}

  {include file="modules/UPS_OnLine_Tools/register.tpl"}

{else}

  {if $js_enabled eq 'Y'}
    {include file="check_email_script.tpl"}
    {include file="check_password_script.tpl"}
    {include file="check_zipcode_js.tpl"}
    {include file="generate_required_fields_js.tpl"} 
    {include file="check_required_fields_js.tpl"}
    {include file="change_states_js.tpl"}
  {/if}

  <p class="register-note">

    {if $newbie eq "Y" && $registered eq ""}
      {if $mode eq "update"}
        {$lng.txt_modify_profile_msg}
      {else}
        {if $anonymous and $config.General.disable_anonymous_checkout neq "Y"}
          {$lng.txt_anonymous_profile_msg}
        {else}
          {$lng.txt_create_profile_msg}
        {/if}
      {/if}
      <br />
      <br />
    {/if}

    {$lng.txt_fields_are_mandatory}

  </p>

  {capture name=dialog}

    {if $newbie ne "Y" && $main ne "user_add" && ($usertype eq "P" && $active_modules.Simple_Mode eq "Y" || $usertype eq "A")}
      <p class="right-box">
        {include file="customer/buttons/button.tpl" button_title=$lng.lbl_go_to_users_list href="users.php?mode=search"}
      </p>
    {/if}

    {assign var="reg_error" value=$top_message.reg_error}
    {assign var="error" value=$top_message.error}
    {assign var="emailerror" value=$top_message.emailerror}

    {if $registered eq ""}

      {if $top_message.reg_error}

        <p class="error-message">
          {if $top_message.reg_error eq "F" }
            {$lng.txt_registration_error}

          {elseif $top_message.reg_error eq "E" }
            {$lng.txt_email_already_exists}

          {elseif $top_message.reg_error eq "U" }
            {$lng.txt_user_already_exists}
          {/if}
        </p>

      {/if}

      {if $top_message.error ne ""}

        <p class="error-message">
          {if $top_message.error eq "b_statecode"}
            {$lng.err_billing_state}

          {elseif $top_message.error eq "s_statecode"}
            {$lng.err_shipping_state}

          {elseif $top_message.error eq "b_county"}
            {$lng.err_billing_county}

          {elseif $top_message.error eq "s_county"}
            {$lng.err_shipping_county}

          {elseif $top_message.error eq "email"}
            {$lng.txt_email_invalid}

          {elseif $top_message.error eq "username"}
            {$lng.err_username_invalid}

          {else}
            {$top_message.error}
          {/if}
        </p>

      {/if}

<script type="text/javascript">
<!--
var is_run = false;
var unique_key = "{unique_key}";
function check_registerform_fields() {ldelim}
  if (is_run)
    return false;

  var is_valid_card_number = true;
  var is_valid_cvv2 = true;

  {if $config.General.check_cc_number eq "Y" && $config.General.disable_cc ne "Y"}
    var card_number = document.registerform.elements.namedItem('card_number[' + unique_key + ']');
    var card_type = document.registerform.elements.namedItem('card_type[' + unique_key + ']');
    var card_cvv2 = document.registerform.elements.namedItem('card_cvv2[' + unique_key + ']');
    if (card_number && card_type && card_number.value.length > 0)    
      is_valid_card_number = checkCCNumber(card_number, card_type, false);
    
    if (card_cvv2 && card_type && card_cvv2.value.length > 0 && is_valid_card_number)    
      is_valid_cvv2 = checkCVV2(card_cvv2, card_type, false);
  {/if}

  is_run = true;
  if (
      check_zip_code()
      {if $default_fields.email.avail eq 'Y'}
        && checkEmailAddress(document.registerform.email, '{$default_fields.email.required}')
      {/if}
      && is_valid_card_number && is_valid_cvv2 
      && checkRequired(requiredFields, false, {if $is_admin_editor}true{else}false{/if})
      {if $config.Security.use_complex_pwd eq 'Y'} && checkPasswordStrength(document.registerform.passwd1,document.registerform.passwd2){/if}
  )
    return true;

  is_run = false;

  return false;
{rdelim}
-->
</script>

      <form action="{$register_script_name}?{$smarty.server.QUERY_STRING|amp}" method="post" name="registerform" {if $js_enabled eq 'Y'}onsubmit="javascript: return check_registerform_fields();"{/if}>
        {if $config.UA.browser eq 'MSIE'}
<script type="text/javascript">
<!--
{literal}
$(function(){
    $('input').keydown(function(e){
        if (e.keyCode == 13) {
            if ($(this).parents('form').get(0).fireEvent("onsubmit"))
              $(this).parents('form').submit();
            return false;
        }
    });
});
{/literal}
-->
</script>
        {/if}
        <input type="hidden" name="usertype" value="{if $smarty.get.usertype ne ""}{$smarty.get.usertype|escape:"html"}{else}{$usertype}{/if}" />
        <input type="hidden" name="anonymous" value="{$anonymous}" />
        {if $config.Security.use_https_login eq "Y"}
          <input type="hidden" name="{$XCARTSESSNAME}" value="{$XCARTSESSID}" />
        {/if}
        {if $smarty.get.mode eq "update"}
          <input type="hidden" name="mode" value="update" />
        {/if}

        <table cellspacing="1" class="data-table register-table width-100" summary="{$lng.lbl_register|escape}">
          <tbody>

            {include file="customer/main/register_personal_info.tpl"}

            {include file="customer/main/register_billing_address.tpl"}

            {include file="customer/main/register_shipping_address.tpl"}

            {include file="customer/main/register_contact_info.tpl"}

            {include file="customer/main/register_additional_info.tpl" section='A'}

            {if $config.General.disable_cc ne "Y"}
              {include file="customer/main/register_ccinfo.tpl"}
            {/if}

            {include file="customer/main/register_account.tpl"}

            {if $active_modules.News_Management && $newslists}
              {include file="modules/News_Management/customer/register_newslists.tpl"}
            {/if}

            {if $active_modules.Image_Verification and $show_antibot.on_registration eq 'Y' && $display_antibot}
              {include file="modules/Image_Verification/spambot_arrest.tpl" mode="data-table" id=$antibot_sections.on_registration antibot_err=$reg_antibot_err}
            {/if}

            <tr>
              <td colspan="3" class="register-newbie-note">
                {if $newbie eq "Y"}
                  {$lng.txt_terms_and_conditions_newbie_note}
                {/if}
              </td>
            </tr>

            <tr>

              {if $smarty.get.mode eq "update"}

                <td class="button-row"><a href="register.php?mode=delete">{$lng.lbl_delete_profile}</a></td>
                <td colspan="2" class="button-row">
                  {if $smarty.get.action eq "cart"}
                    {include file="customer/buttons/submit.tpl" type="input" additional_button_class="main-button" button_title=$lng.lbl_submit_n_checkout}
                  {else}
                    {include file="customer/buttons/submit.tpl" type="input" additional_button_class="main-button"}
                  {/if}
                </td>

              {else}

                <td colspan="3" class="button-row center">
                  <div class="halign-center">
                    {if $smarty.get.action eq "cart"}
                      {include file="customer/buttons/submit.tpl" type="input" additional_button_class="main-button" button_title=$lng.lbl_submit_n_checkout}
                    {else}
                      {include file="customer/buttons/submit.tpl" type="input" additional_button_class="main-button"}
                    {/if}
                  </div>
                </td>

              {/if}

            </tr>

          </tbody>
        </table>

      </form>

      {if ($is_areas.S eq 'Y' || $is_areas.B eq 'Y') && $active_modules.UPS_OnLine_Tools && $av_enabled eq "Y"}
        <div class="register-ups-box">
          {include file="modules/UPS_OnLine_Tools/ups_av_notice.tpl" postoffice=1}
          {include file="modules/UPS_OnLine_Tools/ups_av_notice.tpl"}
        </div>
      {/if}

    {else}

      {if $smarty.post.mode eq "update" or $smarty.get.mode eq "update"}
        {$lng.txt_profile_modified}

      {elseif $smarty.get.usertype eq "B" || $usertype eq "B"}
        {$lng.txt_partner_created}

      {else}
        {$lng.txt_profile_created}
      {/if}

    {/if}

    {if $userinfo.login|default:$userinfo.uname eq ''}
      {$lng.txt_newbie_registration_bottom}
    {/if}

  {/capture}
  {include file="customer/dialog.tpl" title=$lng.lbl_profile_details content=$smarty.capture.dialog noborder=true}

{/if}
