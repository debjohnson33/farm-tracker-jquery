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

	$(document).on('click', 'a.show_animal', function(e) {
		e.preventDefault();
		let id = parseInt($(this).attr('data-id'))
		$.get(`/animals/${id}.json`, function(data) {
			debugger
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
		<li><a href="/animals/${this.id}" data-id="${this.id}" class="show_animal">${this.name} - ${this.animal_type}</a></li>
	`
	return animalHtml
}