{*
$Id: auth.tpl,v 1.11.2.1 2010/01/11 10:40:06 aim Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $is_allow_auth eq "Y" or $config.Security.use_secure_login_page eq "Y"}

  <form action="{$auth_form_url}/include/login.php" method="post" name="authform" class="item">
    <input type="hidden" name="{$XCARTSESSNAME}" value="{$XCARTSESSID}" />

    {if $config.Security.use_secure_login_page eq "Y"}

      <div class="login-buttons">
        <label><a href="{$slogin_url}">{$lng.lbl_secure_login}</a></label>
        <div class="register-button vertical-align">
          {include file="customer/buttons/create_profile_menu.tpl" style="link"}
        </div>
      </div>

    {elseif $active_modules.Image_Verification and $show_antibot.on_login eq 'Y' && $login_antibot_on}

      <label><a href="error_message.php?need_login">{$lng.lbl_login}</a></label>

    {else}

      <input type="hidden" name="mode" value="login" />
      <input type="hidden" name="usertype" value="{$auth_usertype}" />
      <input type="hidden" name="redirect" value="{$redirect|amp}" />

      <label for="auth_username">{$lng.lbl_username}</label>
      <input type="text" id="auth_username" name="username" size="16" value="{#default_login#|default:$username}" class="text" />

      <label for="auth_password">{$lng.lbl_password}</label>
      <input type="password" id="auth_password" name="password" size="16" maxlength="64" value="{#default_password#}" class="text" />

      {include file="customer/buttons/login_menu.tpl" style="image"}

      <div class="register-button vertical-align">
        {include file="customer/buttons/create_profile_menu.tpl" style="link"}
      </div>

    {/if}

  </form>

{/if}
