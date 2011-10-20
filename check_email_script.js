// $Id: check_email_script.js,v 1.2 2008/06/09 14:04:20 zaa Exp $

function checkEmailAddress(field, empty_err) {
	var err = false;

	if (!field) {
		return true;
	}

	if (field.value.length == 0) {
		if (empty_err != 'Y') {
			return true;
		} else {
			err = true;
		}
	}

	if (!err && field.value.replace(/^\s+/g, '').replace(/\s+$/g, '').search(email_validation_regexp) == -1) {
		err = true;
	}

	if (err) {
		alert(txt_email_invalid);
		field.focus();
		field.select();
	}

	return !err;
}

