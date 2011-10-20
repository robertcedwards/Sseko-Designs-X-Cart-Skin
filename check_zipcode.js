/*
$Id: check_zipcode.js,v 1.5.2.3 2010/01/22 15:53:22 aim Exp $
vim: set ts=2 sw=2 sts=2 et:
*/

// check_zip_code_rules is defined in check_zipcode_js.tpl

function check_zip_code_field(cnt, zip, address) {
	var zip_error = false;
	var rules = {};
	var message = true;

	if (!isset(address))
		var address = '';

	if (!zip || zip.value == "")
		return true;

  zip.value = zip.value.replace(/^\s+/g, '').replace(/\s+$/g, '');

	var c_code = config_default_country;
	if (cnt && cnt.options) {
		if ((cnt.options.length > 0) && (cnt.selectedIndex < cnt.options.length)) {
			c_code = cnt.options[cnt.selectedIndex].value;
		}
	}

  // bt:83803 According http://en.wikipedia.org/wiki/Postal_codes#Character_sets
  if (!isset(check_zip_code_rules[c_code]) && c_code != 'UA' && isset(txt_error_common_zip_code)) {
    check_zip_code_rules[c_code] = {
      error: txt_error_common_zip_code, 
      rules: [/^([ a-z0-9-]+)$/gi]
    };
  }

	if (c_code && typeof(window.check_zip_code_rules) != 'undefined' && typeof(check_zip_code_rules[c_code]) != 'undefined') {
		var rule = check_zip_code_rules[c_code];
		if (rule && rule.rules && rule.rules.constructor == Array && rule.rules.length > 0) {
			zip_error = true;
			for (var i = 0; i < rule.rules.length && zip_error; i++) {
				if (zip.value.search(rule.rules[i]) != -1)
					zip_error = false;
			}
		}
	}

	if (zip_error) {
		if (rule && rule.error && rule.error.length > 0) {
			message = rule.error.replace(/{{address}}/, address);
			if (!isset(check_zip_code_posted_alert) || check_zip_code_posted_alert.indexOf('<' + message + zip.value + '>') == -1) {
				alert(message);
				check_zip_code_posted_alert = check_zip_code_posted_alert + '<' + message + zip.value + '>';
			}
		}  

		if (zip.focus)
			zip.focus();
	}

	return !zip_error;
}

function check_zip_code() {
  var b_zip = check_zip_code_field(document.forms["registerform"].b_country, document.forms["registerform"].b_zipcode, lbl_billing_address);
  var s_zip = true;

  var s_check = document.getElementById('ship2diff');
  if (s_check && s_check.checked)
    s_zip = check_zip_code_field(document.forms["registerform"].s_country, document.forms["registerform"].s_zipcode,lbl_shipping_address);

  return b_zip && s_zip; 
}
