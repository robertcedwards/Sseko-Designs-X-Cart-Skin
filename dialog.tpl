{*
$Id: dialog.tpl,v 1.29 2008/08/26 12:32:11 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<table cellspacing="0" {$extra}>
<tr> 
<td class="DialogTitle">{$title}</td>
</tr>
<tr><td class="DialogBorder"><table cellspacing="1" class="DialogBox">
<tr><td class="DialogBox" valign="{$valign|default:"top"}">{$content}
&nbsp;
</td></tr>
</table></td></tr>
</table>
