var timers = [];

//create coundown timer
function startTimer(duration, display) {
    var timer = duration;

    timers.push(setInterval(function () {
		days = parseInt(timer / 86400, 10);
		hours = parseInt(timer % 86400 / 3600, 10);
        minutes = parseInt(timer % 3600 / 60, 10);
        seconds = parseInt(timer % 60, 10);

		if (days > 0 ){
			$('#'+display).html(days + "d " + hours + "h");
		} else if (hours > 0) {
			$('#'+display).html(hours + "h " + minutes + "m");
		} else if (minutes > 10) {
			$('#'+display).html(minutes + "m");
		} else if (minutes > 0) {
			 $('#'+display).html(minutes + "m " + seconds +"s");
		} else {
			$('#'+display).html(seconds +"s");
		}

        if (--timer <= 0) {
			//clearInterval(count);
            refreshList();
        }
    }, 1000));
}



function refreshList(){
	//clear all existing timers
	timers.forEach(function(item, index){
		clearInterval(item);
	});
	timers = [];
	
	$("#content").html("<ul>");
	$.getJSON( "getlist.php", { race: "next", count: "5" } )
	  .done(function( data ) {
		$.each( data, function( key, val ) {
			li_str = "<li onclick=\"location.href='race.php?race="+val["raceid"]+"';\">";
			  
			li_str += "<h2>"+val["name"]+"</h2>";
			li_str += val["type"]+" race";
			
			var d = new Date(val["racetime"]);
			li_str += "<br/>"+d.toDateString();
			
			h = d.getHours();
			(h%12==0?12:h%12)
			
			li_str += "<br/>Betting closes: "+("00" + (h%12==0?12:h%12)).slice (-2)+":"+("00" + d.getMinutes()).slice (-2)+(h<12?"am":"pm");
				
			li_str += "<div id='countdown"+val["raceid"]+"'></div>";
			
			li_str += "</li>";
			$("#content").append(li_str);

			
			startTimer(val["countdown"], "countdown"+val["raceid"]);


			
		});
	  })
	  .fail(function( jqxhr, textStatus, error ) {
		var err = textStatus + ", " + error;
		console.log( "Request Failed: " + err );
	});
	
	
	$("#content").append("</ul>");
}

function raceDetails(){
	
}