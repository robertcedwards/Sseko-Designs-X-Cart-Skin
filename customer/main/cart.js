/*
$Id: cart.js,v 1.2 2009/04/30 06:37:22 igoryan Exp $
vim: set ts=2 sw=2 sts=2 et:
*/

function updateCartItem(id) {
  if (!document.cartform)
    return false;

  var quantity = document.cartform.elements.namedItem('productindexes[' + id + ']');
  if (!quantity)
    return false;

  var url = 'cart.php?action=update&productindexes[' + id + ']=' + quantity.value;

  /* for Gift Registry module */
  var eventMark = document.cartform.elements.namedItem('event_mark[' + id + ']');
  if (eventMark) {
    url += '&event_mark[' + id + ']=' + eventMark.value;
  }

  if ($.browser.msie) {
    setTimeout(
      function() {
        self.location = url;
      },
      200
    );

  } else {
    self.location = url;
  }

  return false;
}

