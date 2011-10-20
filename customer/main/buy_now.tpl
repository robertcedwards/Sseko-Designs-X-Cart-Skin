{*
$Id: buy_now.tpl,v 1.65 2009/10/13 05:44:28 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<div class="buy-now">
<script type="text/javascript">
<!--
products_data[{$product.productid}].quantity = {$product.avail|default:0};
products_data[{$product.productid}].min_quantity = {$product.appearance.min_quantity|default:0};
-->
</script>
  {if $product.appearance.buy_now_form_enabled}
    <form name="orderform_{$product.productid}_{$product.add_date}" method="{if $product.appearance.buy_now_cart_enabled}post{else}get{/if}" action="{if $product.appearance.buy_now_cart_enabled}cart.php{else}product.php{/if}" onsubmit="javascript: return check_quantity({$product.productid}){if $config.General.ajax_add2cart eq 'Y' && $config.General.redirect_to_cart ne 'Y' && $product.appearance.buy_now_cart_enabled} &amp;&amp; !ajax.widgets.add2cart(this){/if};">
      <input type="hidden" name="mode" value="add" />
      <input type="hidden" name="productid" value="{$product.productid}" />
      <input type="hidden" name="cat" value="{$smarty.get.cat|escape:"html"}" />
      <input type="hidden" name="page" value="{$smarty.get.page|escape:"html"}" />
      {if $active_modules.Special_Offers eq "Y" && $product.use_special_price && $product.special_price eq 0}
        <input type="hidden" name="is_free_product" value="Y" />
      {/if}
  {/if}
  {if $product.price eq 0 && ($active_modules.Special_Offers ne "Y" || $product.use_special_price eq '')}
    {assign var="button_href" value=$smarty.get.page|escape:"html"}
    {if $is_matrix_view}
      <div class="quantity-empty"></div>
    {/if}
    <form action="product.php" method="get" name="buynowform{$product.productid}">
      <input type="hidden" name="productid" value="{$product.productid}" />
      <input type="hidden" name="cat" value="{$smarty.get.cat|escape:"html"}" />
      <input type="hidden" name="page" value="{$smarty.get.page|escape:"html"}" />
      {include file="customer/buttons/buy_now.tpl" additional_button_class="main-button" type="input}
    </form>
  {else}
    {if $product.appearance.buy_now_cart_enabled}
      {if $product.appearance.force_1_amount}
        {if $is_matrix_view}
          <div class="quantity-empty"></div>
        {/if}
        <input type="hidden" name="amount" value="1" />
      {else}
        <div class="quantity">
          <span class="quantity-title">{$lng.lbl_quantity}</span>
          {if $product.appearance.empty_stock}
            <span class="out-of-stock">{$lng.txt_out_of_stock}</span>
          {else}
            
            {if $product.appearance.quantity_input_box_enabled}
              <input type="text" id="product_avail_{$product.productid}" name="amount" maxlength="11" size="6" onchange="javascript: return check_quantity({$product.productid});" value="{$product.appearance.min_quantity|default:"1"}"/>
              {if $config.General.unlimited_products ne 'Y'}
              <span class="quantity-text">{$lng.lbl_product_quantity_from_to|substitute:"min":$product.appearance.min_quantity:"max":$product.avail}</span>
              {/if}
 
            {else}

	<select name="amount">
               {section name=quantity loop=$product.appearance.loop_quantity start=$product.appearance.min_quantity}
                 <option value="{%quantity.index%}"{if $smarty.get.quantity eq %quantity.index%} selected="selected"{/if}>{%quantity.index%}</option>
               {/section}
             </select>
            {/if}
          {/if}
        </div>
      {/if}
    {elseif $product.distribution eq "" && !($active_modules.Subscriptions ne "" && $product.catalogprice) && $config.General.unlimited_products ne "Y" && ($product.avail le 0 or $product.avail lt $product.min_amount) && !$product.variantid}
      <div class="quantity"><strong>{$lng.txt_out_of_stock}</strong></div>
    {elseif $is_matrix_view}
      <div class="quantity-empty"></div>
    {else}
      <br />
    {/if}
    {if $product.appearance.buy_now_buttons_enabled}
      {if $js_enabled}
        {if $is_matrix_view}
          <div class="button-row">
            {include file="customer/buttons/buy_now.tpl" type="input" additional_button_class="main-button"}
          </div>
          {if $product.appearance.dropout_actions and $js_enabled}
            <div class="button-row">
            {include file="customer/buttons/add_to_list.tpl" id=$product.productid form_name="orderform_`$product.productid`_`$product.add_date`"}
            </div>
          {elseif $active_modules.Wishlist && ($config.Wishlist.add2wl_unlogged_user eq "Y" || $login ne "")}
            <div class="button-row">
              {include file="customer/buttons/add_to_wishlist.tpl" href="javascript: submitForm(document.orderform_`$product.productid`_`$product.add_date`, 'add2wl'); return false;"}
            </div>
          {/if}
        {else}
          <div class="buttons-row">
            {include file="customer/buttons/buy_now.tpl" type="input" additional_button_class="main-button"}
            {if $product.appearance.dropout_actions and $js_enabled}
              <div class="button-separator"></div>
              {include file="customer/buttons/add_to_list.tpl" id=$product.productid form_name="orderform_`$product.productid`_`$product.add_date`"}
            {elseif $active_modules.Wishlist && ($config.Wishlist.add2wl_unlogged_user eq "Y" || $login ne "")}
              <div class="button-separator"></div>
              {include file="customer/buttons/add_to_wishlist.tpl" href="javascript: submitForm(document.orderform_`$product.productid`_`$product.add_date`, 'add2wl'); return false;"}
            {/if}
          </div>
          <div class="clearing"></div>
        {/if}
      {else}
        <div class="button-row">
          {include file="customer/buttons/buy_now.tpl" type="input" additional_button_class="main-button"}
        </div>
      {/if}
    {/if}
    {if $product.min_amount gt 1}
      <div class="product-details-title">{$lng.txt_need_min_amount|substitute:"items":$product.min_amount}</div>
    {/if}
  {/if}
  {if $product.appearance.buy_now_form_enabled}
    </form>
  {/if}
</div>
