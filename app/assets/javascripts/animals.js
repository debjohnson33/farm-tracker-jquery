$(document).ready(function() {
	$('a.load_animals').on('click', (e) => {
		e.preventDefault();
		console.log('Clicked on Animals Link!')
		$.get(this.url).success(function(data) {
			var $ol = $("#animals_list ol")
			$ol.html("")

			data.forEach(function(animal) {
				$ol.append("<li>" + animal.name + "</li>");
			})
		})
	})
})