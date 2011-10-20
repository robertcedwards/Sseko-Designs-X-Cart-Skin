{*
$Id: subscribe_confirmation.tpl,v 1.3 2009/04/17 13:03:09 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

<h1>{$lng.txt_thankyou_for_subscription}</h1>

{capture name=dialog}

  <p class="text-block">
    {$lng.txt_newsletter_subscription_msg}:<br />
    <strong>{$smarty.get.email|replace:"\\":""}</strong>
  </p>
  {$lng.txt_unsubscribe_information} <a href="{$http_location}/mail/unsubscribe.php?email={$smarty.get.email|replace:"\\":""}">{$lng.lbl_this_url}</a>.

{/capture}
{include file="customer/dialog.tpl" title=$lng.txt_thankyou_for_subscription content=$smarty.capture.dialog noborder=true}
