/*
$Id: iefix.js,v 1.189.2.22 2010/01/28 08:38:23 aim Exp $
vim: set ts=2 sw=2 sts=2 et:
*/
if ($.browser.msie) {
  function IEFix() {
      $('#page-container2').height($('#page-container').height());
  };

  $.event.add(window, "load", IEFix);
  $.event.add(window, "resize", IEFix);
}
