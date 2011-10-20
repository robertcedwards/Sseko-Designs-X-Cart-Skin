{*
$Id: currency.tpl,v 1.22 2008/10/07 15:52:55 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{strip}

{if $plain_text_message eq ""}
<span class="currency">
{/if}

{if $display_sign}

{if $value gte 0}
+
{else}
-
{/if}

{/if}

{assign var="cf_value" value=$value|abs_value|formatprice}

{if $tag_id ne "" && $plain_text_message eq ""}
{assign var="cf_value" value="<span id=\"`$tag_id`\">`$cf_value`</span>"}
{/if}

{$config.General.currency_format|replace:"x":$cf_value|replace:"$":$config.General.currency_symbol}

{if $plain_text_message eq ""}
</span>
{/if}

{/strip}
