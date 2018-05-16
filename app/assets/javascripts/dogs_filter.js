


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
