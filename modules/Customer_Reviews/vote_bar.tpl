{*
$Id: vote_bar.tpl,v 1.5 2009/07/01 13:16:50 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<div class="creviews-rating-box">
  <div class="creviews-vote-bar{if $rating.allow_add_rate} allow-add-rate{/if}" title="{if $rating.total gt 0}{$lng.txt_rating_note|substitute:avg:$rating.rating_level:rating:$rating.total|escape}{else}{$lng.lbl_not_rated_yet|escape}{/if}">
    {include file="modules/Customer_Reviews/vote_subbar.tpl" level=0}
  </div>
  <script type="text/javascript" src="{$SkinDir}/modules/Customer_Reviews/vote_bar.js"></script>

  {if !$rating.allow_add_rate && $rating.forbidd_reason}
    <div class="creviews-rating">

      {if $rating.forbidd_reason eq 'already_added'}
        {$lng.txt_you_have_rated_this_product}
      {elseif $rating.forbidd_reason eq 'unlogged'}
        {$lng.lbl_sign_in_to_rate}
      {/if}

    </div>
  {/if}

</div>
