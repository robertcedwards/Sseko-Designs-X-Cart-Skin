{*
$Id: membership_signup.tpl,v 1.8 2008/08/21 09:52:42 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<tr valign="middle">
<td align="right">{$lng.lbl_signup_for_membership}</td>
<td></td>
<td nowrap="nowrap">
<select name="pending_membershipid">
<option value="">{$lng.lbl_not_member}</option>
{foreach from=$membership_levels item=v}
<option value="{$v.membershipid}"{if $userinfo.pending_membershipid eq $v.membershipid} selected="selected"{/if}>{$v.membership}</option>
{/foreach}
</select>
</td>
</tr>
