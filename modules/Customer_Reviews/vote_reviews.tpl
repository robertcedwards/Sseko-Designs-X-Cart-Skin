{*
$Id: vote_reviews.tpl,v 1.15 2009/05/29 13:19:09 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $printable ne 'Y' or $reviews}

  {capture name=dialog}

    {if $product.rating_data}
      {include file="customer/subheader.tpl" title=$lng.lbl_customers_rating}

      {if $active_modules.Customer_Reviews && $config.Customer_Reviews.ajax_rating eq 'Y'}
        {include file="modules/Customer_Reviews/ajax.rating.tpl" _include_once=1}
      {/if}

      {include file="modules/Customer_Reviews/vote_bar.tpl" productid=$product.productid rating=$product.rating_data}
    {/if}

    {include file="customer/subheader.tpl" title=$lng.lbl_customer_reviews}

    {if $reviews}

      <ul class="creviews-reviews-list">
        {foreach from=$reviews item=r}
          <li>
            {$lng.lbl_author}: <strong>{$r.email|default:$lng.lbl_unknown}</strong><br />
            {$r.message|nl2br}
          </li>
        {/foreach}
      </ul>

    {else}

      <div class="creviews-reviews-list">{$lng.txt_no_customer_reviews}</div>

    {/if}

    {if $printable ne 'Y' and $allow_review}

      {include file="customer/subheader.tpl" title=$lng.lbl_add_your_review}

      {if $allow_add_review}

        {include file="check_required_fields_js.tpl"}

        <form method="post" action="product.php" onsubmit="javascript: return checkFormFields.call(this);">
          <input type="hidden" name="mode" value="add_review" />
          <input type="hidden" name="productid" value='{$product.productid}' />

          <table cellspacing="1" class="data-table" summary="{$lng.lbl_add_your_review|escape}">

            <tr>
              <td class="data-name"><label for="review_author">{$lng.lbl_your_name}</label>:</td>
              <td class="data-required">*</td>
              <td>
                <input type="text" size="24" maxlength="128" name="review_author" id="review_author" value="{$review.author|escape}" />
                {if $review.author eq "" and $review.error}
                  <span class="data-required">&lt;&lt;</span>
                {/if}
              </td>
            </tr>

            <tr>
              <td class="data-name"><label for="review_message">{$lng.lbl_your_message}</label>:</td>
              <td class="data-required">*</td>
              <td>
                <textarea cols="40" rows="4" name="review_message" id="review_message">{$review.message|escape}</textarea>
                {if $review.message eq "" and $review.error}
                  <span class="data-required">&lt;&lt;</span>
                {/if}
                <br />
                {$lng.lbl_max_review}
              </td>
            </tr>

            {if $active_modules.Image_Verification and $show_antibot.on_reviews eq 'Y'}
              {include file="modules/Image_Verification/spambot_arrest.tpl" mode="data-table" id=$antibot_sections.on_reviews antibot_err=$review.antibot_err}
            {/if}

            <tr>
              <td colspan="2">&nbsp;</td>
              <td class="button-row">
                {include file="customer/buttons/button.tpl" button_title=$lng.lbl_add_review type="input"}
              </td>
            </tr>

          </table>

        </form>

      {else}

        {$lng.txt_you_already_voted}

      {/if}

    {/if}

  {/capture}
  {include file="customer/dialog.tpl" content=$smarty.capture.dialog title=$lng.lbl_customers_feedback additional_class="creviews-dialog"}

{/if}
