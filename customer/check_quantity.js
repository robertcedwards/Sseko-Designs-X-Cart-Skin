/*
$Id: check_quantity.js,v 1.4 2009/10/13 05:44:28 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*/

// Check quantity input box
function check_quantity(id) {

	var inp = document.getElementById('product_avail_' + id);
  if (!inp)
    return true;

  if (isNaN(inp.minQuantity))
    inp.minQuantity = products_data[id].min_quantity;

  if (isNaN(inp.maxQuantity))
    inp.maxQuantity = products_data[id].quantity;

  if (!isNaN(inp.minQuantity) && !isNaN(inp.maxQuantity)) {
    var q = parseInt(inp.value);
    if (isNaN(q)) {
      alert(substitute(lbl_product_quantity_type_error, "min", inp.minQuantity, "max", inp.maxQuantity));
      return false;
    }

    if (q < inp.minQuantity) {
      alert(substitute(lbl_product_minquantity_error, "min", inp.minQuantity));
      return false;
    }

    if (q > inp.maxQuantity && is_limit) {
      alert(substitute(lbl_product_maxquantity_error, "max", inp.maxQuantity));
      return false;
    }
  }

  return true;
}

