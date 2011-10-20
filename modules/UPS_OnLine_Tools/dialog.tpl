{*
$Id: dialog.tpl,v 1.7 2008/08/21 09:53:12 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<table cellspacing="0" {$extra}>
<tr> 
{*<td height="15" class="DialogTitle" style="background-image: url({$ImagesDir}/dialog_bg_n.gif);" valign="bottom">&nbsp;&nbsp;{$title}</td>*}
<td height="20" class="DialogBorder"><font class="DialogTitle">{$title}</font></td>
</tr>
<tr><td class="DialogBorder"><table cellspacing="1" width="100%">
<tr><td class="DialogBox">{$content}
&nbsp;
</td></tr>
</table></td></tr>
</table>
