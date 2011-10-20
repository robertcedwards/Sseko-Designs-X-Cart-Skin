{*
$Id: membership_signup.tpl,v 1.1 2008/12/01 13:56:53 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<tr>
  <td class="data-name">{$lng.lbl_signup_for_membership}</td>
  <td></td>
  <td>
    <select name="pending_membershipid">
      <option value="">{$lng.lbl_not_member}</option>
      {foreach from=$membership_levels item=v}
        <option value="{$v.membershipid}"{if $userinfo.pending_membershipid eq $v.membershipid} selected="selected"{/if}>{$v.membership}</option>
      {/foreach}
    </select>
  </td>
</tr>
