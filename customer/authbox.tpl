{*
$Id: authbox.tpl,v 1.11 2009/06/23 06:48:50 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<div class="login-text item right-box">
  <div class="register-button vertical-align">

  <strong>{$login}</strong>
    <a href="register.php?mode=update">{$lng.lbl_modify_profile}</a>&nbsp;&nbsp;
      <form action="{$xcart_web_dir}/include/login.php" method="post" name="loginform">
        <input type="hidden" name="mode" value="logout" />
        <input type="hidden" name="usertype" value="{$auth_usertype|escape}" />
        <input type="hidden" name="redirect" value="{$redirect|amp}" />
        <a href="javascript:void(0);" onclick="javascript: setTimeout(function() {ldelim}document.loginform.submit();{rdelim}, 100);">{$lng.lbl_logoff}</a>
      </form>
  </div>
</div>
