jQuery(function($){
   	$.get(Symphony.WEBSITE + '/symphony/extension/sitemap_xml/raw/', function(data) {
		$('pre').text(data).html();
	});
   	
	$('a[rel=source]').live("click", function () {
	    window.open("view-source:" + $(this).attr('href'));
	    return false;
	})
	$('a[rel=ping]').live("click", function () {
	    window.open($(this).attr('href'));
	    return false;
	})
});