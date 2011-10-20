{*
$Id: authbox_top.tpl,v 1.16 2009/09/09 08:12:04 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<form action="{$xcart_web_dir}/include/login.php" method="post" name="loginform">
<table cellpadding="2" cellspacing="0" border="0">
<tr>
<td nowrap="nowrap" height="20" valign="top">
{if $config.General.shop_closed eq "Y"}
<div class="closed-store">{$lng.lbl_close_storefront|substitute:"STOREFRONT":$xcart_web_dir:"SHOPKEY":$config.General.shop_closed_key}{if $need_storefront_link} [ <a href="{$storefront_link}">{$lng.lbl_open}</a> ]{/if}</div>
{else}
<div class="open-store">{$lng.lbl_open_storefront|substitute:"STOREFRONT":$xcart_web_dir}{if $need_storefront_link} [ <a href="javascript:void(0);" onclick="javascript:if(confirm('{$lng.lbl_open_storefront_warning|escape:'javascript'}'))window.location='{$storefront_link|amp}';">{$lng.lbl_close}</a> ]{/if}</div>
{/if}
</td>
{if $need_quick_search eq "Y"}
<td width="125" height="20" valign="top" align="left"><div class="quick-search-link"><a href="javascript:void(0);" onclick="javascript:show_quick_search();">{$lng.lbl_quick_search}</a></div></td>
{/if}
<td class="AuthText" height="20" valign="top">{$login}</td>
<td>&nbsp;</td>
<td height="20" valign="top"><a href="javascript:document.loginform.submit();" class="AuthText">{$lng.lbl_logoff}</a></td>
<td width="10">&nbsp;</td>
</tr>
</table>
<input type="hidden" name="mode" value="logout" />
<input type="hidden" name="usertype" value="{$auth_usertype|escape}" />
<input type="hidden" name="redirect" value="{$redirect|amp}" />
</form>
