{*
$Id: welcome.tpl,v 1.33 2008/10/30 17:57:31 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
<div id="sidebar" class="grid_3">
    <div id="shop">
      <ul>
        <li><a href="">create your sandals</a></li>
      </ul>
    </div>
    <div class="contact-us">
      {if $active_modules.SnS_connector && $config.SnS_connector.sns_display_button eq 'Y'}
        {include file="modules/SnS_connector/button.tpl"}
      {else}
        <a href="help.php?section=contactus&amp;mode=update" class="contact-us"><img src="{$ImagesDir}/spacer.gif" alt="" /></a>
      {/if}
    </div>
    <div id="bestsellers">
      {if $active_modules.Bestsellers && $config.Bestsellers.bestsellers_menu ne "Y"}
      {include file="modules/Bestsellers/bestsellers.tpl"}<br />
      {/if}
    </div>
    <div id="featured">
      {include file="customer/main/featured.tpl"}
    </div>

</div>
    <div  class="grid_12">
              <ul id="main-slider" class="unoslider">
                <li><div><img src="http://dl.dropbox.com/u/980/Screenshots/16.png"/>
                </div></li>
                <li></li>
              </ul>             
            </div>




<div class="welcome-top grid_8"><img src="{$ImagesDir}/fashion_mosaic/welcome.jpg" class="welcome" alt="" /></div>