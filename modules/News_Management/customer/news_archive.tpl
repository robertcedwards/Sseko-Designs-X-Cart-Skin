{*
$Id: news_archive.tpl,v 1.8 2009/05/20 14:10:15 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

<h1>{$lng.lbl_news}</h1>

{if $news_messages eq ""}

  {$lng.txt_no_news_available}

{else}

  {include file="customer/main/navigation.tpl"}

  <div class="news-list">

    {foreach from=$news_messages item=m name=news}

      <div{interline name=news additional_class="news-item"}>
        <div class="news-date">{$m.date|date_format:$config.Appearance.date_format}</div>

        <div class="news-title">{$m.subject}</div>

        <div class="news-body">
          {if $m.allow_html eq "N"}
            {$m.body|nl2br}
          {else}
            {$m.body}
          {/if}
        </div>

      </div>

    {/foreach}

  </div>

  {include file="customer/main/navigation.tpl"}

<br /><br />

{/if}

{insert name="gate" func="news_subscription_allowed" assign="is_subscription_allowed" lngcode=$shop_language}

{if $is_subscription_allowed}

  {include file="check_required_fields_js.tpl"}

  <a name="subscribe"></a>
  {capture name=dialog}

    <form action="news.php" name="subscribeform" method="post" onsubmit="javascript: return checkFormFields.call(this);">
      <input type="hidden" name="subscribe_lng" value="{$store_language|escape}" />

      <table cellspacing="1" class="data-table">

        <tr>
          <td class="data-name"><label for="semail">{$lng.lbl_your_email}</label></td>
          <td class="data-required">*</td>
          <td class="data-width-100"><input type="text" class="input-email" id="semail" name="newsemail" size="30" value="{$newsemail|default:""}" /></td>
        </tr>

        {if $active_modules.Image_Verification && $show_antibot.on_news_panel eq 'Y'}
          {include file="modules/Image_Verification/spambot_arrest.tpl" mode="data-table" id=$antibot_sections.on_news_panel}
        {/if}
  
        <tr>
          <td colspan="3" class="button-row">
            {include file="customer/buttons/subscribe_menu.tpl" type="input"}
          </td>
        </tr>

      </table>

    </form>

  {/capture}
  {include file="customer/dialog.tpl" title=$lng.lbl_subscribe content=$smarty.capture.dialog}

{/if}
