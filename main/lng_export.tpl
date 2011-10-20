{*
$Id: lng_export.tpl,v 1.2 2008/08/21 09:52:51 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{section name=di loop=$data}
{$data[di].name}{$csv_delimiter}{$data[di].value}{$csv_delimiter}{$data[di].descr}{$csv_delimiter}{$data[di].topic}
{/section}
