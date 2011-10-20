/*
$Id: iepngfix.js,v 1.1 2008/12/02 08:03:18 max Exp $
vim: set ts=2 sw=2 sts=2 et:
*/
$.event.add(
	window,
	"load",
	function() {
		$('img.png-image').each(
			function() {
				if (this.src && this.src.search(/\.png($|\?)/) != -1) {
          if (this.currentStyle.width == 'auto')
            this.style.width = this.offsetWidth + 'px';

          if (this.currentStyle.height == 'auto')
            this.style.height = this.offsetHeight + 'px';

          pngFix(this);
				}
			}
		);
	}
);
