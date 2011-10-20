{*
$Id: register_ccmulticard.tpl,v 1.4 2009/04/18 06:33:04 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="check_cc_number_script.tpl"}
<table cellspacing="0" cellpadding="2">

<tr valign="middle">
  <td align="right">{$lng.lbl_credit_card_type}:</td>
  <td><font class="Star">*</font></td>
  <td nowrap="nowrap" colspan="3">

<select name="pay_method_type">
  <option value="creditcard_visa">Visa</option>
  <option value="creditcard_mastercard">Mastercard</option>
  <option value="creditcard_eurocard">Eurocard</option>
  <option value="creditcard_americanexpress">American Express</option>
  <option value="creditcard_discover">Discover</option>
  <option value="creditcard_dinersclub">Diners Club</option>
  <option value="creditcard_carteblanche">Carte Blanche</option>
  <option value="creditcard_jcb">JCB</option>
  <option value="bank_directdebit">Bank transafer (USA only)</option>
</select>

  </td>
</tr>

</table>
