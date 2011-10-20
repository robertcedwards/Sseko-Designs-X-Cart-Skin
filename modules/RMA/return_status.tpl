{*
$Id: return_status.tpl,v 1.2 2009/04/18 06:33:06 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $extended eq "" and $status eq ""}

{$lng.lbl_wrong_status}

{elseif $mode eq "select"}

<select name="{$name}" {$extra}>
{if $extended ne ""}
  <option value="">&nbsp;</option>
{/if}
  <option value="R"{if $status eq "R"} selected="selected"{/if}>{$lng.lbl_return_requested}</option>
  <option value="A"{if $status eq "A"} selected="selected"{/if}> {$lng.lbl_return_authorized}</option>
  <option value="D"{if $status eq "D"} selected="selected"{/if}>{$lng.lbl_return_declined}</option>
  <option value="C"{if $status eq "C"} selected="selected"{/if}> {$lng.lbl_return_completed}</option>
  <option value="E"{if $status eq "E"} selected="selected"{/if}> {$lng.lbl_removed_by_customer}</option>
</select>

{elseif $mode eq "static"}

{if $status eq "R"}
{$lng.lbl_return_requested}

{elseif $status eq "A"}
{$lng.lbl_return_authorized}

{elseif $status eq "D"}
{$lng.lbl_return_declined}

{elseif $status eq "C"}
{$lng.lbl_return_completed}

{elseif $status eq ""}
{$lng.lbl_removed_by_customer}

{/if}

{/if}
