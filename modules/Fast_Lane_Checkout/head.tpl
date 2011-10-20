{*
$Id: head.tpl,v 1.5 2009/06/11 07:27:10 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $active_modules.SnS_connector and $sns_collector_path_url ne '' && $config.SnS_connector.sns_display_button eq 'Y'}
  <div class="flc-sns-button">
    <div class="valign-middle">
      <img src="{$ImagesDir}/rarrow.gif" alt="" /><strong>{include file="modules/SnS_connector/button.tpl" text_link="Y"}</strong>
    </div>
  </div>
{/if}

{if $login ne ""}
  <div class="flc-top-login">

    <form action="{$xcart_web_dir}/include/login.php" method="post" name="toploginform">
      <input type="hidden" name="mode" value="logout" />
      <input type="hidden" name="redirect" value="{$redirect|amp}" />
      <input type="hidden" name="usertype" value="{$auth_usertype|escape}" />

      <span class="flc-top-login-text">
        <strong>{if $userinfo.firstname || $userinfo.lastname}{$userinfo.firstname} {$userinfo.lastname}{else}{$login}{/if}</strong>
      </span>
      {include file="customer/buttons/logout_menu.tpl" style="link"}

    </form>

  </div>
{/if}
