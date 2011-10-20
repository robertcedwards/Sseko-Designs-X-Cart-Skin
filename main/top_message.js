/* $Id: top_message.js,v 1.4 2009/05/15 12:17:09 joy Exp $ */

function show_top_message(type, content) {
	$("#dialog_message").hide();
	$("#dialog_message_icon").attr({src: top_message_icon[type]});
	$("#dialog_message_title").html(top_message_title[type]);
	$("#dialog_message_content").html(content);
	$("#dialog_message").show();
}

function show_ajax_message(type, content) {
	show_top_message(type, content);
	type = type.toLowerCase();
	if (type == "")
		type = "i";

	$("#ajax_message").hide();
	$("#ajax-dialog-main").addClass("message-" + type);
	$("#ajax-dialog-img").addClass("close-img-" + type);
	$("#ajax-dialog-content").html(content);
	$("#ajax_message").show();
}
