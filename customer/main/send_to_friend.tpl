{*
$Id: send_to_friend.tpl,v 1.23 2009/04/18 06:33:02 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="check_required_fields_js.tpl"}

{capture name=dialog}
<form action="product.php" method="post" name="send" onsubmit="javascript: return checkFormFields(this);">
  <input type="hidden" name="mode" value="send" />
  <input type="hidden" name="productid" value="{$product.productid}" />

  <table cellspacing="0" class="data-table" summary="{$lng.lbl_send_to_friend|escape}">
    <tr>
      <td class="data-name"><label for="send_name">{$lng.lbl_send_your_name}</label>:</td>
      <td class="data-required">*</td>
      <td>
        <input class="send2friend input-required" id="send_name" type="text" name="name" value="{$send_to_friend_info.name|escape}" />
        {if $send_to_friend_info.fill_err && $send_to_friend_info.name eq ''}
          <span class="data-required">&lt;&lt;</span>
        {/if}
      </td>
    </tr>

    <tr>
      <td class="data-name"><label for="send_from">{$lng.lbl_send_your_email}</label>:</td>
      <td class="data-required">*</td>
      <td>
        <input class="send2friend input-required input-email" id="send_from" type="text" name="from" value="{$send_to_friend_info.from|escape}" />
        {if ($send_to_friend_info.fill_err && $send_to_friend_info.from eq '') || $send_to_friend_info.from_failed eq "Y"}
          <span class="data-required">&lt;&lt;</span>
        {/if}
      </td>
    </tr>

    <tr>
      <td class="data-name"><label for="send_to">{$lng.lbl_recipient_email}</label>:</td>
      <td class="data-required">*</td>
      <td>
        <input class="send2friend input-required input-email" id="send_to" type="text" name="email" value="{$send_to_friend_info.email|escape}" />
        {if ($send_to_friend_info.fill_err && $send_to_friend_info.email eq '') || $send_to_friend_info.email_failed eq "Y"}
          <span class="data-required">&lt;&lt;</span>
        {/if}
      </td>

    </tr> 

    {if $active_modules.Image_Verification && $show_antibot.on_send_to_friend eq 'Y'}
      {include file="modules/Image_Verification/spambot_arrest.tpl" mode="data-table" id=$antibot_sections.on_send_to_friend antibot_err=$antibot_friend_err}
    {/if}

    <tr>
      <td colspan="2">&nbsp;</td>
      <td class="button-row">
        {include file="customer/buttons/button.tpl" type="input" button_title=$lng.lbl_send_to_friend}
      </td>
    </tr>

  </table>

</form>

{/capture}
{include file="customer/dialog.tpl" title=$lng.lbl_send_to_friend content=$smarty.capture.dialog additional_class="no-print send2friend-dialog"}
