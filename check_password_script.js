// $Id: check_password_script.js,v 1.6 2009/04/15 07:10:45 joy Exp $

function checkPasswordStrength(field1, field2) {
	var err = false;
	var field;
	var uname = '';

	if (!field1 || !field2)
		return !err;

	if (field1.form.elements.namedItem('password_is_modified') && field1.form.elements.namedItem('password_is_modified').value != 'Y')
		return !err;

	if (field1.value != field2.value) {
		alert(txt_password_match_error);
		field2.focus();
		field2.select();
		return err;
	}
	else
		field = field1;

	if (field.form.elements.namedItem('uname'))
		uname = field.form.elements.namedItem('uname').value;
	if (field.form.elements.namedItem('username') && uname == '')
		uname = field.form.elements.namedItem('username').value;

	if (!(field.value.match(/.{7,}/) && field.value.match(/[a-z]/i) && field.value.match(/[0-9]/) && field.value.match(/\S/)) || uname == '' || field.value == uname) {
		err = true;
	}
	
	if (err) {
		alert(txt_simple_password);
		field.focus();
		field.select();
	}

	return !err;
}

