{if $js_enabled}
{include file="buttons/button.tpl" button_title=$lng.lbl_register href="register.php" image_menu=true}
{else}
{include file="buttons/button.tpl" button_title=$lng.lbl_register href="register.php" image_menu=true style=""}
{/if}
