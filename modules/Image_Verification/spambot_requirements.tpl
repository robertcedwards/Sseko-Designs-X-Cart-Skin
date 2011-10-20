{*
$Id: spambot_requirements.tpl,v 1.3 2008/08/21 09:53:00 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $spambot_requirements ne ''}

<br />

{include file="main/subheader.tpl" title=$lng.lbl_gcheckout_issues_found class="grey"}
{$spambot_requirements}
{/if}
