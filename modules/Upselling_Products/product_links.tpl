{*
$Id: product_links.tpl,v 1.31 2009/04/18 06:33:08 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $active_modules.Upselling_Products ne ""}
<script type="text/javascript" src="{$SkinDir}/main/popup_product.js"></script>

{$lng.txt_upselling_links_top_text}

<br /><br />

{capture name=dialog}
{if $config.General.display_all_products_on_1_page eq 'Y'}<div align="right"><a href="#main">{$lng.lbl_top}</a></div>{/if}

<form action="product_modify.php" name="upsales" method="post">

<input type="hidden" name="productid" value="{$product.productid}" />
<input type="hidden" name="selected_productid" value="" />
<input type="hidden" name="mode" value="upselling_links" />
<input type="hidden" name="geid" value="{$geid}" />

<table {if $geid ne ''}cellspacing="0" cellpadding="4"{else}cellspacing="1" cellpadding="2"{/if} width="100%">

<tr class="TableHead">
{if $geid ne ''}<td width="15" class="TableSubHead">&nbsp;</td>{/if}
  <td width="15" class="DataTable">&nbsp;</td>
  <td width="20" class="DataTable">{$lng.lbl_pos}</td>
  <td width="15%" class="DataTable">{$lng.lbl_productid}</td>
  <td width="15%" class="DataTable">{$lng.lbl_sku}&nbsp;&nbsp;&nbsp;</td>
  <td width="70%">{$lng.lbl_product}</td>
</tr>

{if $product_links}

{section name=cat_num loop=$product_links}

<tr{cycle values=", class='TableSubHead'"}>
  {if $geid ne ''}<td width="15" class="TableSubHead"><input type="checkbox" value="Y" name="fields[u_product][{$product_links[cat_num].productid}]" /></td>{/if}
  <td><input type="checkbox" value="Y" name="uids[{$product_links[cat_num].productid}]" /></td>
  <td class="DataTable"><input type="text" value="{$product_links[cat_num].orderby}" name="upselling[{$product_links[cat_num].productid}]" size="4" /></td>
  <td class="DataTable">#{$product_links[cat_num].productid}</td>
  <td class="DataTable">{$product_links[cat_num].productcode}</td>
  <td class="DataTable"><a href="product.php?productid={ $product_links[cat_num].productid }" class="ItemsList">{ $product_links[cat_num].product|escape|truncate:35:"...":false}</a></td>
</tr>
{/section}

{else}

<tr>
  {if $geid ne ''}<td width="15" class="TableSubHead">&nbsp;</td>{/if}
  <td colspan="5" align="center">{$lng.lbl_no_products}</td>
</tr>

{/if}

<tr>
  {if $geid ne ''}<td width="15" class="TableSubHead">&nbsp;</td>{/if}
  <td>&nbsp;</td>
</tr>
<tr>
  {if $geid ne ''}<td width="15" class="TableSubHead">&nbsp;</td>{/if}
  <td colspan="5">{include file="main/subheader.tpl" title=$lng.lbl_add_new_link}</td>
</tr>

<tr>
  {if $geid ne ''}<td width="15" class="TableSubHead"><input type="checkbox" value="Y" name="fields[new_u_product]" /></td>{/if}
  <td colspan="5">{$lng.lbl_product}: <input type="text" name="prod_name" size="40" style="width: 50%" disabled="disabled" />
<input type="button" value="{$lng.lbl_browse_|strip_tags:false|escape}" onclick="javascript: popup_product('upsales.selected_productid', 'upsales.prod_name');" /><br />
{$lng.lbl_bidirectional_link}<input type="checkbox" name="bi_directional" />
  </td>
</tr>
<tr>
  {if $geid ne ''}<td width="15" class="TableSubHead">&nbsp;</td>{/if}
  <td>&nbsp;</td>
</tr>
<tr>
  {if $geid ne ''}<td width="15" class="TableSubHead">&nbsp;</td>{/if}
  <td nowrap="nowrap" colspan="5"><input type="button" value="{$lng.lbl_delete_selected|strip_tags:false|escape}" onclick="javascript: if (checkMarks(this.form, new RegExp('uids', 'gi'))) {ldelim}document.upsales.mode.value='del_upsale_link'; document.upsales.submit();{rdelim}" />&nbsp;&nbsp;&nbsp;<input type="submit" value="{$lng.lbl_add_update|strip_tags:false|escape}" />&nbsp;&nbsp;&nbsp;
  </td>
</tr>
</table>
</form>

{/capture}
{include file="dialog.tpl" title=$lng.lbl_upselling_links content=$smarty.capture.dialog extra='width="100%"'}
{/if}
