$(document).ready(function() {
	$('a.load_animals').on('click', (e) => {
		e.preventDefault();
		console.log('Clicked on Animals Link!')
		//$.get(this.href).success(function(json) {
		//	var $ol = $("#animals_list ol")
		//	$ol.html("")

		//	json.forEach(function(animal) {
		//		$ol.append("<li>" + animal.name + "</li>");
		//	})
		})
	})
})