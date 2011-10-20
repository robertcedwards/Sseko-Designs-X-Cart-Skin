{*
$Id: spambot_arrest.tpl,v 1.11 2009/04/18 06:33:06 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if !$id}
  {assign var="id" value="image"}
{/if}

{if $mode eq 'advanced' || $mode eq 'simple'}

  <div class="iv-box">
    {if $mode eq 'advanced'}
      {$lng.lbl_word_verification}
      <hr />
    {/if}
    {$lng.lbl_type_the_characters}:
    <div class="iv-row">
      {include file="modules/Image_Verification/image_block.tpl"}
      <div class="iv-input valign-middle-adv-lvl1">
        <div class="valign-middle-adv-lvl2">
          <div class="valign-middle-adv-lvl3">

            <input type="text" name="antibot_input_str" />
            {if $antibot_err}
              <span class="iv-error">&lt;&lt;</span>
            {/if}

          </div>
        </div>
      </div>
    </div>
    <div class="clearing"></div>
  </div>

  {if $config.Image_Verification.spambot_arrest_case_sensitive eq 'Y' && $mode ne "simple_column"}
    {$lng.lbl_case_sensitive_note}
  {/if}

{elseif $mode eq 'data-table'}

  <tr>
    <td colspan="3" class="iv-box-descr">{$lng.lbl_type_the_characters}:</td>
  </tr>
  <tr>
    <td colspan="2" class="iv-box">
      {include file="modules/Image_Verification/image_block.tpl"}
    </td>
    <td class="iv-box">
      <input type="text" name="antibot_input_str" />
      {if $antibot_err}
        <span class="iv-error">&lt;&lt;</span>
      {/if}
    </td>
  </tr>

{elseif $mode eq 'simple_column'}

  <div class="iv-box">
    {$lng.lbl_type_the_characters}:
    {include file="modules/Image_Verification/image_block.tpl"}
    <div class="iv-input">
      <input type="text" name="antibot_input_str" />
      {if $antibot_err}
        <span class="iv-error">&lt;&lt;</span>
      {/if}

    </div>
    <div class="clearing"></div>
  </div>

  {if $config.Image_Verification.spambot_arrest_case_sensitive eq 'Y' && $mode ne "simple_column"}
    {$lng.lbl_case_sensitive_note}
  {/if}

{/if}

