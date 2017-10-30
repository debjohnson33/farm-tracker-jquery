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

function Animal(animal) {
	this.id = animal.id
	this.name = animal.name
	this.age = animal.age
	this.sex = animal.sex
	this.color = animal.color
	this.animal_type = animal.animal_type
	this.weight = animal.weight
	this.pregnant = animal.pregnant
	this.date_bred = animal.date_bred
	this.estimated_due_date = animal.estimated_due_date
	this.area_id = animal.area_id
}

