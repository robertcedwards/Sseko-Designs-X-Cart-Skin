{*
$Id: rma_authorize.tpl,v 1.13 2009/06/04 06:42:36 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{config_load file="$skin_config"}
{include file="mail/html/mail_header.tpl"}

<br />{$lng.eml_dear|substitute:"customer":"`$userinfo.title` `$userinfo.firstname` `$userinfo.lastname`"},<br />
<br />
{$lng.eml_rma_return_authorized|substitute:"returnid":$return.returnid}<br />
<br />
{$lng.eml_rma_return_auth_note}<br />
<br />
{include file="modules/RMA/return_data.tpl"}
<br />
{include file="mail/html/signature.tpl"}
