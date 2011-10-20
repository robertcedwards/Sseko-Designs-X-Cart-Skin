{*
$Id: authbox.tpl,v 1.32 2009/06/11 07:27:10 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{capture name=menu}
<form action="{$xcart_web_dir}/include/login.php" method="post" name="loginform">
<table cellpadding="0" cellspacing="0" width="100%">
<tr> 
  <td>&nbsp;&nbsp;&nbsp;</td>
  <td class="VertMenuItems" valign="top">
{$login}
<br />
{if $js_enabled}
{include file="buttons/logout_menu.tpl"}
{else}
<input type="submit" value="{$lng.lbl_logoff|escape}" />
{/if}
<br />
  </td>
</tr>
{if $usertype eq "C"}
<tr>
  <td class="VertMenuItems" colspan="2" align="right">
<br />
{if $js_enabled}
<a href="{$js_update_link|amp}" class="SmallNote" rel="nofollow">{$lng.txt_javascript_disabled}</a>
{else}
<a href="{$js_update_link|amp}" class="SmallNote" rel="nofollow">{$lng.txt_javascript_enabled}</a>
{/if}
  </td>
</tr>
{/if}
</table>
<input type="hidden" name="mode" value="logout" />
<input type="hidden" name="usertype" value="{$auth_usertype|escape}" />
<input type="hidden" name="redirect" value="{$redirect|amp}" />
</form>
{/capture}
{ include file="menu.tpl" dingbats="dingbats_authentification.gif" menu_title=$lng.lbl_authentication menu_content=$smarty.capture.menu }
