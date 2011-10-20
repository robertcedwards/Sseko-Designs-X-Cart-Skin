{*
$Id: order_message.tpl,v 1.45 2009/04/23 11:35:03 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<h1>{$lng.lbl_invoice}</h1>
{if $this_is_printable_version eq ""}
  {capture name=dialog}
    <p class="text-block2">{$lng.txt_order_placed}</p>
    {$lng.txt_order_placed_msg}
  {/capture}
  {include file="customer/dialog.tpl" title=$lng.lbl_confirmation content=$smarty.capture.dialog}
{/if}
{capture name=dialog}
  {if $this_is_printable_version eq ""}
    <div class="button-row-right">
      {include file="customer/buttons/button.tpl" button_title=$lng.lbl_print_invoice href="order.php?mode=invoice&orderid=`$orderids`" target="preview_invoice" style="link"}
    </div>
    <hr />
  {/if}
  {foreach from=$orders item=order}
    {include file="mail/html/order_invoice.tpl" is_nomail='Y' products=$order.products giftcerts=$order.giftcerts userinfo=$order.userinfo order=$order.order}
    <br />
    <br />
    <br />
    <br />
    {if $active_modules.Interneka}
      {include file="modules/Interneka/interneka_tags.tpl"} 
    {/if}
  {/foreach}
  {if $this_is_printable_version eq ""}
    <div class="buttons-row center">
      <div class="halign-center">
        {include file="customer/buttons/button.tpl" button_title=$lng.lbl_continue_shopping href="home.php" additional_button_class="main-button"}
      </div>
    </div>
  {/if}
{/capture}
{include file="customer/dialog.tpl" title=$lng.lbl_invoice content=$smarty.capture.dialog noborder=true}
{if $active_modules.Google_Analytics && $config.Google_Analytics.ganalytics_e_commerce_analysis eq "Y" && $ga_track_commerce eq "Y"}
  {include file="modules/Google_Analytics/ga_commerce_form.tpl"}
{/if}
