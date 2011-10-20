{*
$Id: images_location.tpl,v 1.32 2009/04/18 06:33:01 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{include file="page_title.tpl" title=$lng.lbl_images_location}

{include file="dialog_tools.tpl"}

<br /><br />

{$lng.txt_images_location_top_text}

<br /><br />

{capture name=dialog}

<form action="images_location.php" method="post">

{foreach from=$config.available_images key=type item=is_unique}
{assign var="config_data" value=$config.setup_images.$type}

<table cellpadding="1" cellspacing="1" width="100%">

<tr>
  <td><a name="{$type}"></a>{include file="main/subheader.tpl" title=$config_data.label}</td>
</tr>
<tr>
  <td>
<table>
<tr>
  <td width="40%">{$lng.lbl_store_images_in}:</td>
  <td width="60%">
  <select name="data[{$type}][location]">
    <option value="DB"{if $config_data.location eq "DB"} selected="selected"{/if} class="DBOption">{$lng.lbl_database}</option>
    <option value="FS"{if $config_data.location eq "FS"} selected="selected"{/if} class="FSOption">{$lng.lbl_file_system}</option>
  </select>
  </td>
</tr>
<tr>
  <td><label for="{$type}_save_url">{$lng.lbl_store_url_images}:</label></td>
  <td><input type="checkbox" id="{$type}_save_url" name="data[{$type}][save_url]" value="Y"{if $config_data.save_url eq "Y"} checked="checked"{/if} /></td>
</tr>
<tr>
  <td><label for="{$type}_md5_check">{$lng.lbl_md5_verification}:</label></td>
  <td><input type="checkbox" id="{$type}_md5_check" name="data[{$type}][md5_check]" value="Y"{if $config_data.md5_check eq "Y"} checked="checked"{/if} /></td>
</tr>
<tr>
  <td>{$lng.lbl_file_size_limit}*:</td>
  <td nowrap="nowrap"><input type="text" size="10" maxlength="10" name="data[{$type}][size_limit]" value="{$config_data.size_limit|default:"0"}" /></td>
</tr>
<tr>
  <td>{$lng.lbl_default_image}:</td>
  <td nowrap="nowrap"><input type="text" name="data[{$type}][default_image]" value="{$config_data.default_image|escape}" /></td>
</tr>
<tr>
  <td colspan="2">&nbsp;</td>
</tr>
</table>
  </td>
</tr>
</table>
{/foreach}

<br />

{$lng.txt_images_location_notes}

<br /><br />

<input type="submit" value="{$lng.lbl_submit|strip_tags:false|escape}" />

</form>

{if $log_file}
<br />
{assign var="logfile_date" value=$log_file_date|date_format:$config.Appearance.datetime_format}
{$lng.txt_images_location_logfile_link|substitute:"date":$logfile_date}
{/if}

<br />

{/capture}
{include file="dialog.tpl" title=$lng.lbl_images_location content=$smarty.capture.dialog extra='width="100%"'}
