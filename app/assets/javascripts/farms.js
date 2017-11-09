$(document).ready(function() {
	bindClicks();
})

const bindClicks = () => {
	$(document).on('click', '.all_user_farms', function(e) {
		e.preventDefault();
		history.pushState({}, '', $(this).attr("href"))

		$.get(this.href, function(data) {
			$(".main-body").html(farmHeader)
			
			data.sort(function (a, b) {
				return a.areas.length - b.areas.length
		
			})
			.forEach(function(farm) {
				let newFarm = new Farm(farm)
				let farmHtml = newFarm.formatIndex()
				$(".main-body").append(farmHtml)
			})
			$(".main-body").append(farmFooter)
		})
		
	})

	$(document).on('click', ".show_link", function(e) {
		e.preventDefault()
		history.pushState({}, '', $(this).attr("href"))

		let id = parseInt($(this).attr('data-id'))
		$.get(`/farms/${id}.json`, function(farm){
			$(".main-body").html('')
				let newFarm = new Farm(farm)
				let farmHtml = newFarm.formatShow()
				$(".main-body").append(farmHtml)

				farm.areas.forEach(function(area) {
					let newArea = new Area(area)
					let areaHtml = newArea.formatShow()
					$(".main-body").append(areaHtml)
				})
				let animalCount = newFarm.formatAnimalCount()
				$(".main-body").append(animalCount)
				let farmLinks = newFarm.formatFarmLinks()
				$(".main-body").append(farmLinks)		
		})
	})


	$('.new_farm').on('submit', function(e) {
		console.log()
		e.preventDefault();
		//history.pushState({}, '', $(this).attr("href"))
		
		$.post(this.action, $(this).serialize(), function(farm) {
			$(".main-body").html('')
			let newFarm = new Farm(farm)
			let farmHtml = newFarm.formatShow()
			$(".main-body").append(farmHtml)
			farm.areas.forEach(function(area) {
					let newArea = new Area(area)
					let areaHtml = newArea.formatShow()
					$(".main-body").append(areaHtml)
			})	
				let animalCount = newFarm.formatAnimalCount()
				$(".main-body").append(animalCount)
				let farmLinks = newFarm.formatFarmLinks()
				$(".main-body").append(farmLinks)	
		})
	})
}

// JS Model Object
function Farm(farm) {
	this.id = farm.id
	this.name = farm.name
	this.areas = farm.areas
	this.animals = farm.animals
}
// Prototype Method
Farm.prototype.formatIndex = function() {
	let farmHtml = `
		<a href="/farms/${this.id}" data-id=${this.id} class="show_link">${this.name}</a><br>		
	`
	return farmHtml
}

Farm.prototype.formatShow = function() {
	let farmHtml = `
		<h2>Farm</h2>
		<p>Name: ${this.name}</p>
	`
	return farmHtml
}

function Area(area) {
	this.id = area.id
	this.name = area.name
}

Area.prototype.formatShow = function() {
	let areaHtml = `
		<li><a href="/areas/${this.id}">${this.name}</a></li>
	`
	return areaHtml
}

function farmHeader() {
	return `<h1>Farms</h1>`
}

function farmFooter() {
	let farmFooter = `
		<br><br>
		<a href="/farms/new" class="add_farm_link">Add Farm</a>
	`	
	return farmFooter
}

Farm.prototype.formatAnimalCount = function() {
	let animalCount = `
		<br>
		<p>Total Animals: ${this.animals.length}</p>
	`
	return animalCount
}

Farm.prototype.formatFarmLinks = function() {
	let farmLinks = `
		<div id="animals_list">
		<ol></ol>
		</div>
		<a href="/farms/${this.id}/animals" class="load_animals">Animals</a><br><br>
		<a href="/farms/${this.id}/areas/new">Add Area</a><br><br>
		<a href="/farms/${this.id}/animals/new">Add Animal</a><br><br>
		<a href="/farms/${this.id}/edit">Edit Farm</a><br><br>
		<a href="/farms/${this.id}/areas/new">Add Area</a><br><br>
		<a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/farms/${this.id}">Delete</a>
	`
	return farmLinks
}

