/*
$Id: iepositioning_fix.js,v 1.5 2009/07/28 12:32:59 joy Exp $ 
vim: set ts=2 sw=2 sts=2 et:
*/
var i = 100;
$(document).ready(function(){
  $(".products div.item").each(function() {
    $(this).css({'background-color' : $(this).css('background-color'), 'z-index' : i--});
  });
  $(".dialog div.title").each(function() {
    $(this).css({'z-index': -1});
  });
  change_width_iefix();
});
