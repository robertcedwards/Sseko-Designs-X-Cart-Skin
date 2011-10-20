{*
$Id: conditions.tpl,v 1.16 2009/05/13 09:37:21 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<br />
{capture name=dialog}
{* Place terms and conditions here *}

{if $usertype eq "B" }
{include file="help/conditions_affiliates.tpl"}
{else}
{include file="help/conditions_customers.tpl"}
{/if}

{/capture}
{include file="dialog.tpl" title=$lng.lbl_terms_n_conditions content=$smarty.capture.dialog extra='width="100%"'}
