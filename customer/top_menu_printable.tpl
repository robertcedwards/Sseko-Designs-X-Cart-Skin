{*
$Id: top_menu_printable.tpl,v 1.4 2008/08/21 09:52:44 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<table cellpadding="0" cellspacing="0">
<tr>
<td height="35" align="center" class="HeadText">
{if $config.Company.company_phone}{$lng.lbl_phone_1_title}: {$config.Company.company_phone}{/if}<br />
{if $config.Company.company_phone_2}&nbsp;&nbsp;&nbsp;{$lng.lbl_phone_2_title}: {$config.Company.company_phone_2}{/if}&nbsp;&nbsp;
</td>
</tr>
</table>
