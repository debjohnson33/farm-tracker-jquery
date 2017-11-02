$(document).ready(function() {
	clickHandlers();
})

const clickHandlers = () => {
	$(document).on('click', 'a.load_animals', function(e) {
		e.preventDefault();

		$.get(this.url, function(data) {
			var $ol = $("#animals_list ol")
			if (data.animals.length === 0) {
				let animalHtml = `No animals yet`
				$ol.append(animalHtml);
			} else {
				
				
				$ol.html("")

				data.animals.forEach(function(animal) {
					let newAnimal = new Animal(animal)
					let animalHtml = newAnimal.formatIndex()
					$ol.append(animalHtml);
				})
			}
		})
	})

	$(document).on('click', 'a.show_animal', function(e) {
		e.preventDefault();

		history.pushState({}, '', $(this).attr("href"))

		let id = parseInt($(this).attr('data-id'))
		$.get(`/animals/${id}.json`, function(animal) {
			$(".body-container").html('')
			let newAnimal = new Animal(animal)
			let animalHtml = newAnimal.formatShow()
			//debugger
			$(".body-container").append(animalHtml)
			
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
	this.area = animal.area
}

Animal.prototype.formatIndex = function() {
	let animalHtml = `
		<li><a href="/animals/${this.id}" data-id="${this.id}" class="show_animal">${this.name} - ${this.animal_type}</a></li>
	`
	return animalHtml
}

Animal.prototype.formatShow = function() {
	let bredDate = new Date(this.date_bred)
	let estDueDate = new Date(this.estimated_due_date)
	let animalHtml = `
		<h2>Your Animal:<h2>
		<h3>${this.name}<h3>
		<p>Age: ${this.age}</p>
		<p>Sex: ${this.sex}</p>
		<p>Color: ${this.color}</p>
		<p>Weight: ${this.weight}</p>
		<p>Type: ${this.animal_type}</p>
		<p>Pregnant?: ${this.pregnant}</p>
		<p>Date bred: ${bredDate.toDateString()}</p>
		<p>Estimated due date: ${estDueDate.toDateString()}</p>
		<p>Area: ${this.area.name}</p><br>
		<a href="/farms/${this.area.farm_id}">Back to Farm</a><br><br>
		<a href="/animals/${this.id}/edit">Edit Animal</a><br><br>
		<a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/farms/${this.id}">Delete</a>
	`
	return animalHtml
}


