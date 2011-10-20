{*
$Id: head_admin.tpl,v 1.19 2009/05/22 07:28:01 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $login ne ""}
{include file="quick_search.tpl"}
{/if}
<table cellpadding="0" cellspacing="0" width="100%">
<tr> 
  <td class="HeadLogo"><a href="{$http_location}/"><img src="{$ImagesDir}/admin_xlogo.gif" alt="" /></a></td>
{if $login ne ""}
  <td align="right" nowrap="nowrap">{include file="authbox_top.tpl" need_quick_search="Y"}</td>
  <td width="10"><img src="{$ImagesDir}/spacer.gif" width="10" height="1" alt="" /></td>
{/if}
</tr>
</table>
<table cellpadding="0" cellspacing="0" width="100%">
<tr> 
  <td colspan="2" class="HeadThinLine"><img src="{$ImagesDir}/spacer.gif" class="Spc" alt="" /></td>
</tr>
<tr> 
  <td colspan="2" class="HeadLine" align="right" height="22">
    {if $login && $all_languages_cnt gt 1}
      <form action="{$smarty.server.REQUEST_URI|amp}" method="post" name="asl_form">
        <table cellpadding="0" cellspacing="0">
          <tr>
            <td class="TopLabel">{$lng.lbl_current_language}:&nbsp;</td>
            <td>
              <input type="hidden" name="redirect" value="{$smarty.server.QUERY_STRING|amp}" />
              <select name="asl" onchange="javascript: document.asl_form.submit()">
                {foreach from=$all_languages item=l}
                  <option value="{$l.code}"{if $current_language eq $l.code} selected="selected"{/if}>{$l.language}</option>
                {/foreach}
              </select>
            </td>
          </tr>
        </table>
      </form>
    {else}
      &nbsp;
    {/if}
</td>
</tr>
<tr> 
  <td colspan="2" class="HeadThinLine"><img src="{$ImagesDir}/spacer.gif" class="Spc" alt="" /></td>
</tr>
{******** Remove this line to display how much products there are online ****
<tr>
{insert name="productsonline" assign="_productsonline"}
  <td colspan="2" class="NumberOfArticles" align="right">
{if $config.Appearance.show_in_stock eq "Y"}
{insert name="itemsonline" assign="_itemsonline"}
{$lng.lbl_products_and_items_online|substitute:"X":$_productsonline:"Y":$_itemsonline}
{else}
{$lng.lbl_products_online|substitute:"X":$_productsonline}
{/if}
&nbsp;
  </td>
</tr>
**** Remove this line to display how much products there are online ********}
<tr>
  <td colspan="2" valign="middle" height="16">
<table cellspacing="0" cellpadding="0" width="100%">
<tr>
  <td height="16"><img src="{$ImagesDir}/spacer.gif" width="1" height="16" alt="" /></td>
</tr>
</table>
  </td>
</tr>
</table>
