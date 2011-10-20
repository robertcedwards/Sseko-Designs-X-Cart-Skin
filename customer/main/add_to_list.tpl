{*
$Id: add_to_list.tpl,v 1.6 2009/06/19 08:29:32 igoryan Exp $ 
vim: set ts=2 sw=2 sts=2 et:
*}
{if !$form_name}
{assign var=form_name value="orderform"}
{/if}
{if $js_if_condition}
{assign var=js_condition value="if (`$js_if_condition`) "}
{/if}
{if $product.appearance.dropout_actions.W}
  <li>
      {include file="customer/buttons/button.tpl" button_title=$lng.lbl_to_wishlist href="javascript: `$js_condition`submitForm(document.`$form_name`, 'add2wl');" additional_button_class="light-button" style="div_button"}
  </li>
{/if}
{if $product.appearance.dropout_actions.C}
  <li>
    {include file="customer/buttons/button.tpl" button_title=$lng.lbl_fcomp_add_to href="comparison_list.php?mode=add&productid=`$product.productid`" additional_button_class="light-button" style="div_button"}
  </li>
{/if}

{if $product.appearance.dropout_actions.G}
  <li>
    {include file="modules/Gift_Registry/giftreg_add_form.tpl" prefix="`$product.productid`_`$product.add_date`"}
  </li>
{/if}

