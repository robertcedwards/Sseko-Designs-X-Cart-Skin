/*
$Id: vote_bar.js,v 1.2 2009/06/08 06:06:34 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*/
var creviews_hover_loaded;
if ($.browser.msie && !creviews_hover_loaded && parseInt($.browser.version) < 7) {
  creviews_hover_loaded = true;

  $(document).ready(
    function() {
      $('.creviews-rating-box .allow-add-rate li a').hover(
        function() {
          if (!this._parents)
            this._parents = $(this).parents('li').children('a');

          this._parents.addClass('over');
        },
        function() {
          if (!this._parents)
            this._parents = $(this).parents('li').children('a');

          this._parents.removeClass('over');
        }
      );

      return true;
    }
  );
}
