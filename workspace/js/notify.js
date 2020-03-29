var settings = {
	style:"info",
	message:"hello :)",
	position:"top",
	start:500,
	speed:500,
	duration:4500
};

function jnotif(opts){
	var opts = $.extend(settings,opts);
	
	// on vérifie si il y'a déjà une div de notification
	if($("#jnotif").length == 0){
		$("body").append('<div id="jnotif"><p id="jnotif-message"></p></div>');
	}
	
	var $jnotif = $("#jnotif");

	// on positionne la notification
	switch(opts.position){
		case "top":
			$jnotif.css({top:0,bottom:""});
		break;
		case "bottom":
			$jnotif.css({bottom:0,top:""});
		break;
	}
	
	// on y ajoute le message
	// et on précise la classe (type)	
	$jnotif
		.attr("class","")
		.addClass(opts.style)
		.find("#jnotif-message")
			.empty()
			.append(opts.message);
	
	// tout est prêt, on anime la notification
	$jnotif
		.delay(opts.start)
		.fadeIn(opts.speed)
		.delay(opts.duration)
		.fadeOut(opts.speed);
}

$(function(){
	$("#button-info").bind("click",function(){
		if($("#to-Bottom:checked").length == 0){
			jnotif({
				style:"info",
				message:"Ceci est pour votre information",
				position:"top"
			});
		}else{
			jnotif({
				style:"info",
				message:"Ceci est pour votre information",
				position:"bottom"
			});
		}
	});
	
	$("#button-ok").bind("click",function(){
		if($("#to-Bottom:checked").length == 0){
			jnotif({
				style:"ok",
				message:"Super! Tout s'est bien pass&eacute;! :D",
				position:"top"
			});
		}else{
			jnotif({
				style:"ok",
				message:"Super! Tout s'est bien pass&eacute;! :D",
				position:"bottom"
			});
		}
	});
	
	$("#button-alert").bind("click",function(){
		if($("#to-Bottom:checked").length == 0){
			jnotif({
				style:"alert",
				message:"Attention, il peut y avoir un probl&egrave;me",
				position:"top"
			});
		}else{
			jnotif({
				style:"alert",
				message:"Attention, il peut y avoir un probl&egrave;me",
				position:"bottom"
			});
		}
	});
	
	$("#button-nok").bind("click",function(){
		if($("#to-Bottom:checked").length == 0){
			jnotif({
				style:"nok",
				message:"Oups ! Il y'a eut un incident :(",
				position:"top"
			});
		}else{
			jnotif({
				style:"nok",
				message:"Oups ! Il y'a eut un incident :(",
				position:"bottom"
			});
		}
	});

});