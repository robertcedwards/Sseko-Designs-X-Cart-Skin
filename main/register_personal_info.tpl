{*
$Id: register_personal_info.tpl,v 1.17 2009/09/23 08:19:31 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $is_areas.P eq 'Y'}
{if $hide_header eq ""}
<tr>
<td colspan="3" class="RegSectionTitle">{$lng.lbl_personal_information}<hr size="1" noshade="noshade" /></td>
</tr>
{/if}

{if $default_fields.title.avail eq 'Y'}
<tr>
<td align="right">{$lng.lbl_title}</td>
<td>{if $default_fields.title.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap">
<select name="title" id="title">
{include file="main/title_selector.tpl" field=$userinfo.titleid}
</select>
</td>
</tr>
{/if}
{if $default_fields.firstname.avail eq 'Y'}
<tr>
<td align="right">{$lng.lbl_first_name}</td>
<td>{if $default_fields.firstname.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap">
<input type="text" id="firstname" name="firstname" size="32" maxlength="32" value="{$userinfo.firstname|escape}" />
{if $reg_error ne "" and $userinfo.firstname eq "" && $default_fields.firstname.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}
{if $default_fields.lastname.avail eq 'Y'}
<tr>
<td align="right">{$lng.lbl_last_name}</td>
<td>{if $default_fields.lastname.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap">
<input type="text" id="lastname" name="lastname" size="32" maxlength="32" value="{$userinfo.lastname|escape}" />
{if $reg_error ne "" and $userinfo.lastname eq "" && $default_fields.lastname.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}
{if $default_fields.company.avail eq 'Y'}
<tr>
<td align="right">{$lng.lbl_company}</td>
<td>{if $default_fields.company.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap">
<input type="text" id="company" name="company" size="32" maxlength="255" value="{$userinfo.company|escape}" />
{if $reg_error ne "" and $userinfo.company eq "" && $default_fields.company.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}
{if $default_fields.ssn.avail eq 'Y'}
<tr>
<td align="right">{$lng.lbl_ssn}</td>
<td>{if $default_fields.ssn.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap">
<input type="text" id="ssn" name="ssn" size="32" maxlength="32" value="{$userinfo.ssn|escape}" />
{if $reg_error ne "" and $userinfo.ssn eq "" && $default_fields.ssn.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
</td>
</tr>
{/if}
{if $default_fields.tax_number.avail eq 'Y'}
<tr>
<td align="right">{$lng.lbl_tax_number}</td>
<td>{if $default_fields.tax_number.required eq 'Y'}<font class="Star">*</font>{else}&nbsp;{/if}</td>
<td nowrap="nowrap">
{if $userinfo.tax_exempt ne "Y" or $config.Taxes.allow_user_modify_tax_number eq "Y" or $usertype eq "A" or $usertype eq "P"}
<input type="text" id="tax_number" name="tax_number" size="32" maxlength="32" value="{$userinfo.tax_number|escape}" />
{if $reg_error ne "" and $userinfo.tax_number eq "" && $default_fields.tax_number.required eq 'Y'}<font class="Star">&lt;&lt;</font>{/if}
{else}
{$userinfo.tax_number}
{/if}
</td>
</tr>
{/if}
{if $config.Taxes.enable_user_tax_exemption eq 'Y'}
{if (($userinfo.usertype eq "C" or $smarty.get.usertype eq "C") and $userinfo.tax_exempt eq "Y") or ($usertype eq "A" or $usertype eq "P")}
<tr>
<td align="right">{$lng.lbl_tax_exemption}</td>
<td>&nbsp;</td>
<td nowrap="nowrap">
{if $usertype eq "A" or $usertype eq "P"} 
<input type="checkbox" id="tax_exempt" name="tax_exempt" value="Y"{if $userinfo.tax_exempt eq "Y"} checked="checked"{/if} />
{elseif $userinfo.tax_exempt eq "Y"}
{$lng.txt_tax_exemption_assigned}
{/if}
</td>
</tr>
{/if}
{/if}
{if $usertype eq "A" or $usertype eq "P"}
<tr>
<td align="right">{$lng.lbl_referred_by}</td>
<td></td>
<td nowrap="nowrap">
{if $userinfo.referer}
<a href="{$userinfo.referer}">{$userinfo.referer|truncate:80:".....":false:true}</a>
{else}
{$lng.lbl_unknown}
{/if}
</td>
</tr>
{/if}
{include file="main/register_additional_info.tpl" section="P"}
{/if}
