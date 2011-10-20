{*
$Id: rectangle_bottom.tpl,v 1.15 2009/04/18 06:33:00 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
</td>
</tr>
{if $active_modules.Users_online ne ""}
<tr>
  <td>{include file="modules/Users_online/menu_users_online.tpl"}</td>
</tr>
{else}
<tr>
  <td><img src="{$ImagesDir}/spacer.gif" class="Spc" alt="" /></td>
</tr>
{/if}
<tr>
  <td class="BottomRow">
{include file="bottom.tpl"}
  </td>
</tr>
</table>
