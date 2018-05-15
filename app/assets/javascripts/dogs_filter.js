


function filter_dogs() {
	var breed = $("#filter_breed").val()
	if(breed == ""){
		return
	}

	$.ajax({
    url: '/api/v1/dogs?breed=' + breed,
	    success: function(respuesta) {
	        console.log(respuesta);
	    },
	    error: function() {
	        console.log("No se ha podido obtener la información");
	    }
	});
}


