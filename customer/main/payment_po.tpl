{*
$Id: payment_po.tpl,v 1.18 2008/10/30 17:57:31 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<script type="text/javascript">
<!--
requiredFields = [
  ["PO_Number", "{$lng.lbl_po_number}"],
  ["Company_name", "{$lng.lbl_company_name}"],
  ["Name_of_purchaser", "{$lng.lbl_name_of_purchaser}"],
  ["Position", "{$lng.lbl_position}"]
];
-->
</script>

<table cellspacing="0" class="data-table" summary="{$lng.lbl_po_information|escape}">

  {if $hide_header ne "Y"}
    <tr>
      <td class="register-section-title"><label>{$lng.lbl_po_information}</label></td>
    </tr>
  {/if}

  <tr>
    <td class="data-name">{$lng.lbl_po_number}</td>
    <td class="data-required">*</td>
    <td><input type="text" size="32" id="PO_Number" name="PO_Number" /></td>
  </tr>

  <tr>
    <td class="data-name">{$lng.lbl_company_name}</td>
    <td class="data-required">*</td>
    <td><input type="text" size="32" id="Company_name" name="Company_name" /></td>
  </tr>

  <tr>
    <td class="data-name">{$lng.lbl_name_of_purchaser}</td>
    <td class="data-required">*</td>
    <td><input type="text" size="32" id="Name_of_purchaser" name="Name_of_purchaser" /></td>
  </tr>

  <tr>
    <td class="data-name">{$lng.lbl_position}</td>
    <td class="data-required">*</td>
    <td><input type="text" size="32" id="Position" name="Position" /></td>
  </tr>

</table>
