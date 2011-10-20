{*
$Id: dialog_message.tpl,v 1.10 2009/04/18 06:33:02 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $top_message.content ne "" || $alt_content ne ""}

  <div id="dialog-message">
    <div class="box message-{$top_message.type|default:"I"}"{if $top_message.title} title="{$top_message.title|escape}"{/if}>

      {if $top_message.no_close eq ""}
        <a href="{$smarty.server.PHP_SELF}?{$smarty.server.QUERY_STRING|amp}" class="close-link" onclick="javascript: document.getElementById('dialog-message').style.display = 'none'; return false;"><img src="{$ImagesDir}/spacer.gif" alt="{$lng.lbl_close|escape}" class="close-img" /></a>
      {/if}

      {$top_message.content|default:$alt_content}

      {if $top_message.anchor ne ""}
        <div class="anchor">
          <a href="#{$top_message.anchor}">{$lng.lbl_go_to_last_edit_section}<img src="{$ImagesDir}/spacer.gif" alt="" /></a>
        </div>
      {/if}

    </div>
  </div>

{/if}
