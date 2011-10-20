{*
$Id: head.tpl,v 1.189.2.22 2010/01/28 08:38:23 aim Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
    <header>
      <div id="logo" class="grid_3">
        <a href="/">
          <img src="/images/logo.png"/>
        </a>
      </div>
      <div id="description" class="grid_5">
        <span style="display:none;">Every Sandal has a story</span>
        <img src="/images/description.png"/>
      </div>
      <div class="grid_9 nav">
      <div id="menu" class="menu-main-container">
        <ul id="menu-main" class="menu">
          <li id="menu-item-8" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-8"><a href="http://shop.ssekodesigns.com/">Shop Sseko //</a></li>
          <li id="menu-item-322" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-322"><a href="http://sseko.welovewebsit.es/style/">Style your Ssekos //</a></li>
          <li id="menu-item-14" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-14"><a href="http://sseko.welovewebsit.es/the-sseko-story/">The Sseko Story //</a>
            <ul class="sub-menu">
              <li id="menu-item-422" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-422"><a href="http://sseko.welovewebsit.es/what-we-do/">What We Do ::</a></li>
              <li id="menu-item-421" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-421"><a href="http://sseko.welovewebsit.es/meet-the-women/">meet {the women} ::</a></li>
              <li id="menu-item-423" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-423"><a href="http://sseko.welovewebsit.es/the-sseko-story/">Our Story</a></li>
            </ul>
          </li>
          <li id="menu-item-19" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-19"><a href="http://sseko.welovewebsit.es/get-involved/">Get Involved //</a></li>
          <li id="menu-item-317" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-317"><a href="http://sseko.welovewebsit.es/news-2/">News</a></li>
        </ul>
      </div>     
      </div>
  
      <div class="clear"></div> 
    </header>

	
{if $main ne "fast_lane_checkout" && !$printable}
  <div class="line2">
    {include file="customer/search.tpl"}
    <div class="auth">
      {if $login eq "" }
        {include file="customer/auth.tpl" }
      {else}
        {include file="customer/authbox.tpl" }
      {/if}
    </div>
    {if $main ne "catalog" || $current_category.category ne ""}
      <div class="subauth-line">
        {include file="customer/bread_crumbs.tpl"}
      </div>
    {/if}
  </div>
{/if}
{include file="customer/noscript.tpl"}