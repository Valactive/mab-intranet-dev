$(document).ready(function(){

	// ******************************************************************************************
	// CHECK IF POPUP DIRECT FROM REQUEST OR NOT
	// ******************************************************************************************
		if (window.location.href.indexOf('overlay') === true) {
				return;
			}

		else if ((window.location.href.indexOf("popup") === true )) {
			window.location="/#overlay?"+location.href;
		} else {
			return;
		};
	// ******************************************************************************************
	// OVERIDE DEFAULT SCROLLBARS
	// ******************************************************************************************
	$('#scrollbars').jScrollPane();

});