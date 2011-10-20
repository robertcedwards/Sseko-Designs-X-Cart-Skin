/*
$Id: check_required_fields_js.js,v 1.11 2009/04/21 06:55:47 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*/

/*
	Check required fields
*/
function checkRequired(lFields, id, softError) {
	if (!lFields || lFields.length == 0)
		return true;

	if (id) {
		for (var x = 0; x < lFields.length; x++) {
			if (lFields[x][0] == id) {
				lFields = [lFields[x]];
				break;
			}
		}
	}

	var errFields = [];
	for (var x = 0; x < lFields.length; x++) {
		if (!lFields[x] || (!document.getElementById(lFields[x][0]) && !document.getElementById(lFields[x][0]+'Adv')))
			continue;

		var obj = _getById(lFields[x][0]);
    var objEditor = false;    

    /* For WYSIWYG editor. */
    if (obj && obj.style.display == 'none' && _getById(lFields[x][0]+'Adv')) {
      obj = _getById(lFields[x][0]+'Adv');
      objEditor = get_html_editor(lFields[x][0]);
    }

		if ((obj.type == 'text' || obj.type == 'password' || obj.type == 'textarea') && !obj.value.search(/^[\s]*$/gi)) {
			if (softError) {
				errFields[errFields.length] = lFields[x][1];

			} else {
				alert(lbl_required_field_is_empty ? substitute(lbl_required_field_is_empty, 'field', lFields[x][1]) : lFields[x][1]);
				if (!obj.disabled && obj.type != 'hidden') {
					checkRequiredShow(obj);
          if (objEditor) {
            obj.focus();
            obj.style.display = 'none';
            objEditor.focus();
          } else {
            obj.focus();
          }
				}
				return false;
			}
		}
	}

	if (errFields.length > 0) {
		return confirm(substitute(txt_required_fields_not_completed, 'fields', "\n\t" + errFields.join(",\n\t") + "\n\n"));
	}

	return true;
}

/*
	Show hidden element and element's parents
*/
function checkRequiredShow(elm) {
	if (elm.style && elm.style.display == 'none') {

		if (elm.id == 'ship_box' && document.getElementById('ship2diff')) {
			/* Exception for Register page */
			document.getElementById('ship2diff').checked = true;
			document.getElementById('ship2diff').onclick();
			
		} else
			elm.style.display = '';
	}

	if (elm.parentNode)
		checkRequiredShow(elm.parentNode);

}

/*
	Check form fields (class-based)
*/
function checkFormFields() {
	if (!this.tagName || this.tagName.toUpperCase() != 'FORM') {
		if (arguments.length > 0 && arguments[0] && arguments[0].tagName && arguments[0].tagName.toUpperCase() == 'FORM')
			return checkFormFields.call(arguments[0]);

		return true;
	}

	var labels = this.getElementsByTagName('LABEL');
	
	for (var i = 0; i < labels.length; i++) {

		if (!labels[i].htmlFor)
			continue;

		var f = document.getElementById(labels[i].htmlFor);
		if (!f || f.disabled)
			continue;

		var p = f;
		var visible = true;
		while (p && visible) {
			if (p.style && p.style.display == 'none')
				visible = false;

			p = p.parentNode;
		}

		if (!visible)
			continue;

		var r = (
			(labels[i].parentNode.tagName.toUpperCase() == 'TD' && labels[i].parentNode.className && labels[i].parentNode.className.search(/data-name/) != -1 &&
			labels[i].parentNode.parentNode.cells[1] && labels[i].parentNode.parentNode.cells[1].className && labels[i].parentNode.parentNode.cells[1].className.search(/data-required/) != -1) ||
			(f.className && f.className.search(/input-required/) != -1)
		);

		var fType = false;
		if (f.className) {
			var m = f.className.replace(/input-required/, '').match(/input-([a-z]+)/);
			if (m)
				fType = m[1];
		}

    if (!fType && !r)
      continue;

    var err = false;
    var errMsg = lbl_required_field_is_empty;

    if (r && f.value.replace(/ /g, '').length == 0) {
		  err = true;

    } else if (fType && f.value.replace(/ /g, '').length > 0) {

      var val = f.value.replace(/^\s+/g, '').replace(/\s+$/g, '');
      errMsg = lbl_field_format_is_invalid;
  		switch (fType) {
        case 'email':
          if (val.search(email_validation_regexp) == -1) {
            err = true;
            errMsg = txt_email_invalid;
          }
          break;

        case 'int':
          err = val.search(/^[-+]?\d+$/) == -1;
          break;

        case 'uint':
          err = val.search(/^\+?\d+$/) == -1;
          break;

        case 'intz':
          err = val.search(/^[-+]?\d+$/) == -1 || val == '0';
          break;

        case 'uintz':
          err = val.search(/^\+?\d+$/) == -1 || val == '0';
          break;

        case 'double':
          err = val.search(/^[-+]?(?:\d+|\.\d+|\d+\.|\d+\.\d+)$/) == -1;
          break;

        case 'udouble':
          err = val.search(/^\+?(?:\d+|\.\d+|\d+\.|\d+\.\d+)$/) == -1;
          break;

        case 'doublez':
          err = val.search(/^[-+]?(?:\d+|\.\d+|\d+\.|\d+\.\d+)$/) == -1 || val.search(/^[-+]?[0\.]+$/) != -1;
          break;

        case 'udoublez':
          err = val.search(/^\+?(?:\d+|\.\d+|\d+\.|\d+\.\d+)$/) == -1 || val.search(/^\+?[0\.]+$/) != -1;
          break;

        case 'ip':
          err = val.search(/^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/) == -1;
          break;
		  }
    }

		if (err) {
			alert(substitute(errMsg, 'field', labels[i].innerHTML));
			if (f.type != 'hidden' && f.focus)
        f.focus();

      return false;
		}
	}	
	
	return true;
}
