/*
$Id: payment_methods.js,v 1.2 2009/10/23 13:10:33 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*/

function markDisabledCB(obj) {
  $(obj).parents('table').eq(0).find(':checkbox:disabled').attr('checked', obj.checked ? 'checked' : '');
}

function changeDisabledOrderBy(obj) {
  $(obj).parents('table').eq(0).find(':checkbox:disabled').parents('tr').eq(0).find(':text').filter(function() { return this.name.search(/orderby/) != -1; }).attr('value', obj.value);
}
