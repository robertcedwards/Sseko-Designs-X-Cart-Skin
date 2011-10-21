{*
$Id: head.tpl,v 1.189.2.22 2010/01/28 08:38:23 aim Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
    <header>
      <div id="logo" class="grid_3">
        <a href="/">
          <img src="{$SkinDir}/images/logo.png"/>
        </a>
      </div>
      <div id="description" class="grid_5">
        <span style="display:none;">Every Sandal has a story</span>
        <img src="{$SkinDir}/images/description.png"/>
      </div>
      <div class="auth">
      {if $login eq "" }
        {include file="customer/auth.tpl" }
      {else}
        {include file="customer/authbox.tpl" }
      {/if}
      </div>

      <div class="grid_9 nav">
      <div id="menu" class="menu-main-container">
        <ul id="menu-main" class="menu">
          <li id="menu-item-8" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-8"><a href="http://shop.ssekodesigns.com/">Shop Sseko //</a>
            <ul class="sub-menu">
              <li id="menu-item-422" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-422"><a href="/what-we-do/">Create your sandals ::</a></li>
              <li id="menu-item-421" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-421"><a href="/meet-the-women/">Buy new straps ::</a></li>
              <li id="menu-item-423" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-423"><a href="/the-sseko-story/">The Wedding Line</a></li>
            </ul>
          </li>
          <li id="menu-item-322" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-322"><a href="/style/">Style your Ssekos //</a></li>
          <li id="menu-item-14" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-14"><a href="/the-sseko-story/">The Sseko Story //</a>
            <ul class="sub-menu">
              <li id="menu-item-422" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-422"><a href="/what-we-do/">What We Do ::</a></li>
              <li id="menu-item-421" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-421"><a href="/meet-the-women/">meet {the women} ::</a></li>
              <li id="menu-item-423" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-423"><a href="/the-sseko-story/">Our Story</a></li>
            </ul>
          </li>
          <li id="menu-item-19" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-19"><a href="/get-involved/">Get Involved //</a></li>
          <li id="menu-item-317" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-317"><a href="/news-2/">News</a></li>
        </ul>
      </div>     
      </div>
  

	
{if $main ne "fast_lane_checkout" && !$printable}

    </header>
{if $main ne "catalog" || $current_category.category ne ""}
      <div class="subauth-line">
        {include file="customer/bread_crumbs.tpl"}
      </div>
    {/if}  
{/if}
{include file="customer/noscript.tpl"}