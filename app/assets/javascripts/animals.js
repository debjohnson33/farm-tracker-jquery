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
		$.get(`/animals/${id}.json`, function(animal) {
			$(".body-container").html('')
			let newAnimal = new Animal(animal)
			let animalHtml = newAnimal.formatShow()
			$(".body-container").append(animalHtml)
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

Animal.prototype.formatShow = function() {
	let animalHtml = `
		<h2>Your Animal:<h2>
		<h3>${this.name}<h3>
		<p>Age: ${this.age}</p>
		<p>Sex: ${this.sex}</p>
		<p>Color: ${this.color}</p>
		<p>Weight: ${this.weight}</p>
		<p>Type: ${this.animal_type}</p>
		<p>Pregnant?: ${this.pregnant}</p>
		<p>Date bred: ${this.date_bred}</p>
		<p>Estimated due date: ${this.estimated_due_date}</p>
		<p>Area: ${this.area}</p>
	`
	return animalHtml
}