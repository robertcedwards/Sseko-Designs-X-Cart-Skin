{*
$Id: mail_header.tpl,v 1.9 2009/05/18 08:26:24 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<br /><font size="2">
{assign var="link" value="<a href=\"$http_location/\" target=\"_blank\">`$config.Company.company_name`</a>"}
{$lng.eml_mail_header|substitute:"company":$link}
</font>

