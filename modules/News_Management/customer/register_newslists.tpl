{*
$Id: register_newslists.tpl,v 1.2 2009/06/29 07:54:31 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $active_modules.News_Management and $newslists}

{if $hide_header eq ""}
      <tr>
        <td class="register-section-title" colspan="3">
          <div>
            <label>{$lng.lbl_newsletter}</label>
          </div>
        </td>
      </tr>
{/if}

      <tr>
        <td colspan="3">{$lng.lbl_newsletter_signup_text}</td>
      </tr>

      <tr>
        <td colspan="2">&nbsp;</td>
        <td>

{foreach from=$newslists item=n}
{assign var="listid" value=$n.listid}
          <div class="news-register-item">
            <label>
              <input type="checkbox" name="subscription[{$n.listid}]"{if $subscription[$listid] ne ""} checked="checked"{/if} />
              {$n.name}
            </label>
            <br />
            <span>{$n.descr}</span>
          </div>
{/foreach}

        </td>
      </tr>

{/if}
