/*
$Id: install_preview_fix.js,v 1.1 2009/11/02 09:09:42 igoryan Exp $ 
vim: set ts=2 sw=2 sts=2 et:
*/

/* 
  Fix problem with refreshing of the skin preview  
  during skin installation 
*/
var _ts = new Date();
$('link').each(function(){
  $(this).attr('href', this.href + '?' + _ts.valueOf());
});
