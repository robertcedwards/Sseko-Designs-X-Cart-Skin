{*
$Id: auth.tpl,v 1.54.2.1 2010/01/11 10:40:06 aim Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $main ne "login_incorrect" and $main ne "antibot_error" and $main ne "disabled" or $config.Security.use_secure_login_page eq "Y"}
{capture name=menu}
{if $config.Security.use_https_login eq "Y"}
{assign var="form_url" value=$https_location}
{else}
{assign var="form_url" value=$current_location}
{/if}
<form action="{$form_url}/include/login.php" method="post" name="authform" onsubmit="javascript: return lockForm(this);">
<input type="hidden" name="{$XCARTSESSNAME}" value="{$XCARTSESSID}" />
<table cellpadding="0" cellspacing="0" class="AuthBox" align="center">
{if $config.Security.use_secure_login_page eq "Y"} {* use_secure_login_page *}
<tr>
<td>
{assign var="slogin_url_add" value=""}
{if $usertype eq "C"}
{assign var="slogin_url" value=$catalogs_secure.customer}
{if $catalogs_secure.customer ne $catalogs.customer}
{assign var="slogin_url_add" value="?`$XCARTSESSNAME`=`$XCARTSESSID`"}
{/if}
{elseif $usertype eq "P" and $active_modules.Simple_Mode eq "Y" or $usertype eq "A"}
{assign var="slogin_url" value=$catalogs_secure.admin}
{elseif $usertype eq "P"}
{assign var="slogin_url" value=$catalogs_secure.provider}
{elseif $usertype eq "B"}
{assign var="slogin_url" value=$catalogs_secure.partner}
{/if}
{include file="buttons/secure_login.tpl"}
</td>
</tr>
{else} {* use_secure_login_page *}
<tr>
<td class="VertMenuItems">
<font class="VertMenuItems">{$lng.lbl_username}</font><br />
<input type="text" name="username" size="17" value="{#default_login#|default:$username|escape:"html"}" /><br />
<font class="VertMenuItems">{$lng.lbl_password}</font><br />
<input type="password" name="password" size="17" maxlength="64" value="{#default_password#}" /><br />
<input type="hidden" name="mode" value="login" />
<input type="hidden" name="usertype" value="{$auth_usertype|escape}" />
<input type="hidden" name="redirect" value="{$redirect|amp}" />
</td></tr>

{if $active_modules.Image_Verification and $show_antibot.on_login eq 'Y' && $login_antibot_on && $main ne 'secure_login_form'}
<tr>
<td class="VertMenuItems">
{include file="modules/Image_Verification/spambot_arrest.tpl" mode="simple_column" id=$antibot_sections.on_login}
</td>
</tr>
{/if}

{if $usertype ne "C" and ($usertype ne "B" or $config.XAffiliate.partner_register ne "Y")}
<tr>
<td align="center" height="24" class="VertMenuItems"><br />{include file="buttons/login_menu.tpl" style="button" button_style="menu"}</td>
</tr>
{/if} 
{/if} {* use_secure_login_page *}
{if $usertype eq "C" or ($usertype eq "B" and $config.XAffiliate.partner_register eq "Y")}
<tr>
<td align="center" height="24" nowrap="nowrap" class="VertMenuItems">
<br />
<table cellpadding="0" cellspacing="0">
<tr>
{if $config.Security.use_secure_login_page ne "Y"}
<td height="24" class="VertMenuItems">{include file="buttons/login_menu.tpl" style="button" button_style="menu"}</td>
<td><img src="{$ImagesDir}/spacer.gif" width="10" height="1" alt="" /></td>
{/if}
<td>{include file="buttons/create_profile_menu.tpl" style="button" button_style="menu"}</td>
</tr>
</table>
</td>
</tr>
{/if}
{if $login eq ""}
<tr>
<td align="center" height="24" nowrap="nowrap" class="VertMenuItems"><a href="help.php?section=Password_Recovery" class="VertMenuItems" style="text-decoration: underline;">{$lng.lbl_recover_password}</a></td>
</tr>
{/if}

{if ($is_https_zone and $config.Security.use_https_login neq 'Y') and (($usertype eq "P" and $active_modules.Simple_Mode) or $usertype eq "A")}
<!-- insecure login form link -->
<tr>
<td class="VertMenuItems">
<br />
<div align="center"><a href="insecure_login.php" class="SmallNote">{$lng.lbl_insecure_login}</a></div>
</td>
</tr>
<!-- insecure login form link -->
{/if}
</table>
</form>
{/capture}
{ include file="menu.tpl" dingbats="dingbats_authentification.gif" menu_title=$lng.lbl_authentication menu_content=$smarty.capture.menu }
{/if}
