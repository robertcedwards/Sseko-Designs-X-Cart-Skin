{*
$Id: image_block.tpl,v 1.5 2009/05/22 12:59:19 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<div class="iv-img">
	<img src="{$xcart_web_dir}/antibot_image.php?section={$id}&amp;rnd={"1"|mt_rand:10000}" id="{$id}" alt="" /><br />
<script type="text/javascript">
<!--
document.write('<'+'a href="javascript:void(0);" onclick="javascript: change_antibot_image(\'{$id}\');">{$lng.lbl_get_a_different_code|wm_remove|escape:javascript}<'+'/a>');
-->
</script>
</div>
<br />
