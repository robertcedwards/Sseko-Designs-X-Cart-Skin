/*
$Id: quick_search.js,v 1.8 2009/06/19 11:24:49 joy Exp $
vim: set ts=2 sw=2 sts=2 et:
*/

/*
Registering keys to show/hide Quick Search form
*/

function quick_search_panel(obj, keys, func) {
  this.quick_search_flags = [];

  for (var i in keys) {
    if (hasOwnProperty(keys, i))
      this.quick_search_flags[keys[i]] = false;
  }

  var quick_search_flags = this.quick_search_flags;

  $(obj).bind(
    "keydown",
    function(e) {
      e = e || window.event;
      var k = e.keyCode || e.which;
      var func_call = true;
      for (var key in quick_search_flags) {
        if (!hasOwnProperty(quick_search_flags, key))
          continue;

        if (k == key)
          quick_search_flags[key] = true;

        if (!quick_search_flags[key])
          func_call = false;
      }

      if (func_call) {
        for (var i in quick_search_flags) {
          if (hasOwnProperty(quick_search_flags, i))
            quick_search_flags[i] = false;
        }
        func();
      }
    }
  );

  $(obj).bind(
    "keyup",
    function (e) {
      e = e || window.event;
      var k = e.keyCode || e.which;
      for (var key in quick_search_flags) {
        if (hasOwnProperty(quick_search_flags, key) && k == key)
          quick_search_flags[key] = false;
      }
    }
  );
}

var open_panel = new quick_search_panel(document, ['17', '192'], show_quick_search); // Ctrl + '~' is registered for quick search form
var close_panel = new quick_search_panel(document, ['27'], close_quick_search);
var clear_result = false;
var ajax_quick_search_script = xcart_web_dir + ((current_area == "A") ? "/admin" : "/provider") + "/quick_search.php";
var home_script = xcart_web_dir + ((current_area == "A") ? "/admin" : "/provider") + "/home.php";

function show_quick_search() {
  if ($("#quick_search_panel").css("display") == "none") {
    $("#quick_search_panel").show();
    $("#quick_search_keywords").focus();
  } else {
    $("#quick_search_panel").hide();
  }
}

function close_quick_search() {
  $("#quick_search_body1, #quick_search_results").show();
  $("#quick_search_panel, #quick_search_body2, #quick_search_no_results, #quick_search_no_pattern").hide();
  clear_result = true;
}

function quick_search(query) {
  query = query.replace(/^\s+/g, "").replace(/\s+$/g, "");
  if (query == "") {
    $("#quick_search_results, #quick_search_no_results").hide();
    $("#quick_search_no_pattern").show();

    return false;
  }

  $("#quick_search_no_pattern, #quick_search_no_results").hide();
  $("#quick_search_body1").hide();
  $("#quick_search_body2").show();

  clear_result = false;

  $.getJSON(
    ajax_quick_search_script,
    {
      "mode": "ajax_search",
      "query": query
    },
    function (data, textStatus) {
      if (clear_result || textStatus != "success")
        return false;

      if (data["result"] == "Y") {
        document.location.href = (data["mode"] == "single") ? data["url"] : ajax_quick_search_script + "?mode=search";
      } else if (data["result"] == "not_logged_in") {
        document.location.href = home_script;
      } else {
        $("#quick_search_results, #quick_search_body2").hide();
        $("#quick_search_no_results, #quick_search_body1").show();
        $("#quick_search_keywords").focus();
      }

      return "";
    });

  return "";
}
