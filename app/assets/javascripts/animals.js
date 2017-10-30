$(document).ready(function() {
	clickHandlers();
})

const clickHandlers = () => {
	$('a.load_animals').on('click', function(e) {
		e.preventDefault();

		$.get(this.url, function(data) {
	
			var $ol = $("#animals_list ol")
			$ol.html("")

			data.animals.forEach(function(animal) {
				let newAnimal = new Animal(animal)
				let animalHtml = newAnimal.formatIndex()
				$ol.append(animalHtml);
			})
		})
	})
}

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

Animal.prototype.formatIndex = function() {
	let animalHtml = `
		<li>${this.name} - ${this.animal_type}</li>
	`
	return animalHtml
}