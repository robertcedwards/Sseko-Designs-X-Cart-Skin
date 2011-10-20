{*
$Id: today_news.tpl,v 1.20 2009/04/18 06:01:10 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $news_message eq ""}

  {$lng.txt_no_news_available}

{else}

  <strong>{$news_message.date|date_format:$config.Appearance.date_format}</strong><br />
  {$news_message.body}<br />
  <br />

{/if}
<hr />
