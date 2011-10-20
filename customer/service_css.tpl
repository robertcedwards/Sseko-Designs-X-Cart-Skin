{*
$Id: service_css.tpl,v 1.162.2.22 2010/01/28 08:38:23 aim Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
  <link rel="stylesheet" type="text/css" href="{$SkinDir}/{#CSSFilePrefix#}.css" />
  <!--[if lt IE 7]>
  <link rel="stylesheet" type="text/css" href="{$SkinDir}/{#CSSFilePrefix#}.IE6.css" />
  <![endif]-->
  <!--[if IE 7]>
  <link rel="stylesheet" type="text/css" href="{$SkinDir}/{#CSSFilePrefix#}.IE7.css" />
  <![endif]-->
<script type="text/javascript">
<!--
if (/mozilla/.test(navigator.userAgent.toLowerCase()) && !/(compatible|webkit)/.test(navigator.userAgent.toLowerCase()))
  document.write('<link rel="stylesheet" type="text/css" href="{$SkinDir}/{#CSSFilePrefix#}.FF.css" />');
-->
</script>
{if $config.UA.browser eq 'Firefox' || $config.UA.browser eq 'Mozilla'}
  <link rel="stylesheet" type="text/css" href="{$SkinDir}/{#CSSFilePrefix#}.FF.css" />
  {if $config.UA.version[0] eq '2' || $config.UA.browser eq 'Mozilla'}
    <link rel="stylesheet" type="text/css" href="{$SkinDir}/{#CSSFilePrefix#}.FF2.css" />
  {/if}
{/if}

{if $config.UA.browser eq 'Opera'}
  <link rel="stylesheet" type="text/css" href="{$SkinDir}/{#CSSFilePrefix#}.Opera.css" />
{/if}

{if $config.UA.browser eq 'Chrome'}
  <link rel="stylesheet" type="text/css" href="{$SkinDir}/{#CSSFilePrefix#}.GC.css" />
{/if}

{foreach from=$css_files item=files key=mname}
  {foreach from=$files item=f}
    {if $f.condition}
      <!--[if {$f.condition}]>
        <link rel="stylesheet" type="text/css" href="{$SkinDir}/modules/{$mname}/{if $f.subpath}{$f.subpath}/{/if}{#CSSFilePrefix#}{if $f.suffix}.{$f.suffix}{/if}.css"{if $f.media} media="{$f.media}"{/if} />
      <![endif]-->
    {elseif ($f.browser && $config.UA.browser eq $f.browser) || !$f.browser}
      <link rel="stylesheet" type="text/css" href="{$SkinDir}/modules/{$mname}/{if $f.subpath}{$f.subpath}/{/if}{#CSSFilePrefix#}{if $f.suffix}.{$f.suffix}{/if}.css"{if $f.media} media="{$f.media}"{/if} />
    {/if}
  {/foreach}
{/foreach}

  <link rel="stylesheet" type="text/css" href="{$SkinDir}/altskin.css" />
  <!--[if lt IE 7]>
  <link rel="stylesheet" type="text/css" href="{$SkinDir}/altskin.IE6.css" />
  <![endif]-->
  <!--[if IE 7]>
  <link rel="stylesheet" type="text/css" href="{$SkinDir}/altskin.IE7.css" />
  <![endif]-->

{if $custom_styles}
<style type="text/css">
<!--
  {foreach from=$custom_styles item=attrs key=sname}
{$sname} {ldelim}
    {foreach from=$attrs key=k item=v}
  {$k}: {$v};
    {/foreach}
{rdelim}
  {/foreach}
-->
</style>
{/if}
