$(document).ready(function() {
	$('a.load_animals').on('click', function(e) {

		$.ajax({
			method: 'GET',
			url: this.href
		}).success(function(data) {
	
			var $ol = $("#animals_list ol")
			$ol.html("")

			data.forEach(function(animal) {
				$ol.append("<li>" + animal.name + "</li>");
			})
		})
		e.preventDefault();
	})
})