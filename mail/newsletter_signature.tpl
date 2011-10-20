{*
$Id: newsletter_signature.tpl,v 1.11 2009/10/05 05:40:34 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}

-----------------------------------------------------------
{$lng.eml_unsubscribe_information}
{$http_location}/mail/unsubscribe.php?email={$email|escape}&listid={$listid}

--
{$lng.eml_signature}

{if $config.Company.company_name}{$config.Company.company_name}
{/if}
{if $config.Company.company_phone}{$lng.lbl_phone|mail_truncate}{$config.Company.company_phone}
{/if}
{if $config.Company.company_fax}{$lng.lbl_fax|mail_truncate}{$config.Company.company_fax}
{/if}
{$lng.lbl_url|mail_truncate}{if $config.Company.company_website ne ""} {$config.Company.company_website} ({$http_location}){else}{$http_location}{/if}
