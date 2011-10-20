{*
$Id: head.tpl,v 1.189.2.22 2010/01/28 08:38:23 aim Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<script type="text/javascript" src="/skin1/js/jquery-1.3.1.min.js"></script>	
<script type="text/javascript" language="javascript" src="/skin1/js/jquery.dropdownPlain.js"></script>
<div class="line1">
  <div class="logo">
    <a href="http://www.ssekodesigns.com"><img src="{$ImagesDir}/ssekowebheaderopp.png" alt="" /></a>
    </div>
  {include file="customer/phones.tpl"}
  {if $main ne "fast_lane_checkout"}
    {include file="customer/language_selector.tpl"}
  {/if}
</div>
<div id="header-test">
<div id="page-wrap">   
  <ul class="dropdown">
<li><a href="http://www.ssekodesigns.com">home</a>
        		
        	</li>
        	<li><a href="#">the story</a>
        		<ul class="sub_menu">
        			<li><a href="http://www.ssekodesigns.com/ourstory/">our story</a></li>
        			<li><a href="http://www.ssekodesigns.com/women/">the women</a></li>
        			 <li><a href="http://www.ssekodesigns.com/whywomen/">why women</a></li>
        			 <li><a href="http://www.ssekodesigns.com/love-liz/">love, liz</a></li>
        		</ul>
        	</li>
        	<li><a href="http://shop.ssekodesigns.com">shop</a>
        	</li>
        	<li><a href="http://www.ssekodesigns.com/wedding/">wedding</a>
        	</li>
        	<li><a href="#">movement</a>
        		<ul class="sub_menu">
        			 <li><a href="http://www.ssekodesigns.com/contact/">contact</a></li>
        			 <li><a href="http://www.ssekodesigns.com/get-involved/">get involved</a></li>
        			 <li><a href="http://www.ssekodesigns.com/host-a-party/">host a party</a></li>
        			 <li><a href="http://www.ssekodesigns.com/ambassador/">become an ambassador</a></li>
        		</ul>
        	</li>
            <li><a href="http://www.ssekodesigns.com/gallery/">gallery</a>	
        	</li>
            <li><a href="http://www.ssekodesigns.com/join-us/">join us</a>
        	</li>
            <li><a href="http://www.ssekodesigns.com/faqs/">faqs</a>
        	</li>
            <li><a href="http://www.ssekodesigns.com/blog/">blog</a>
        	</li>
        </ul>
</div>
<br>	
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
</div>
