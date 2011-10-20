{*
$Id: image_property2.tpl,v 1.4 2009/03/23 13:15:12 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{strip}
  {if $image && $image.image_type ne '' && $image.image_size gt 0}
    {$image.image_x}x{$image.image_y}, {byte_format value=$image.image_size format=k} kb
  {/if}
  {if $show_modified}
    &nbsp;&nbsp;<span style="color: #b51a00;"><b>{$lng.lbl_modified}</b></span>
  {/if}
{/strip}
