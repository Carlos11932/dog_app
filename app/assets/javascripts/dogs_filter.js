


function filter_dogs() {
	var breed = $("#filter_breed").val()
	if(breed == ""){
		return
	}

	$.ajax({
    url: '/api/v1/dogs?breed=' + breed,
	    success: function(data) {
	        print_with_filter(data)
	    },
	    error: function() {
	        console.log("No se ha podido obtener la información");
	    }
	});
}

function print_with_filter(data){
	$("#profiles_container").empty()
	for (var i = data.length - 1; i >= 0; i--) {
		$("#profiles_container").html(
		'<div style="margin-bottom: 1%; padding-top: 1%">'+
				'<a href="dogs/'+data[i].id+'" style="text-decoration:none;color:black">'+
					'<div class="container" style="background-color:#fff">'+
						'<div class="row">'+
							'<div class="col-2" style="padding: 2%">'+
								'<img src="" width="200px" height="200px">'+
							'</div>'+
							'<div class="col-10">'+
								'<div style="padding-left: 5%;padding-top: 2%">'+
									'<h4>'+data[i].name+'</h4>'+
									'<p>'+data[i].birth_date+'</p>'+
									'<p>'+data[i].description+'</p>'+
								'</div>'+
							'</div>'+
						'</div>'+
					'</div>'+
				'</a>'+
			'</div>'
		)
	}	
}


function get_dog_direction_query(event) {
	console.log(event);
	event.preventDefault();

	var adress = $("#get_dog_direction").val()
	if(adress == ""){
		return
	}
	var country = "Spain"
	var city = $("#get_dog_city").val()	
	var adress = $("#get_dog_direction").val()
	var direction = adress+'+'+city+'+'+country

	$.ajax({
    url: '/api/v1/dogs/location?direction='+direction,
	    success: function(data) {
	        get_lat_lng(data)
	    },
	    error: function() {
	        console.log("No se ha podido obtener la información");
	    }
	});
}

function get_lat_lng(data){
	var lng_input = $("#lng_id")
	var lat_input = $("#lat_id")

	var lat = data.results[0].geometry.location.lat
	var lng = data.results[0].geometry.location.lng

	lng_input.val(lng)
	lat_input.val(lat)
	get_dog_map()
}

function get_dog_map() {

	var lng = $("#lng_id").val()
	var lat = $("#lat_id").val()
	var google_api_key = 'AIzaSyCco2s5skJ5_l7uB4vpIHfCYEtrJu7dE5I'
	var url = 'https://maps.googleapis.com/maps/api/staticmap?center='+lat+','+lng+'&zoom=13&size=400x400&maptype=roadmap&key='+google_api_key
	$("#google_map").html(
				'<img src='+url+'>'
				)
}






