$(document).ready(function() {
	bindClicks();
})

const bindClicks = () => {
	$('.all_user_farms').on('click', function(e) {
		e.preventDefault();
		history.pushState(null, null, "farms")

		$.get(this.href, function(data) {
			$(".body-container").html('')
			data.forEach(function(farm) {
				let newFarm = new Farm(farm)
				let farmHtml = newFarm.formatIndex()
				$(".body-container").append(farmHtml)
			})
		})
		
	})

	$(document).on('click', ".show_link", function(e) {
		e.preventDefault()
		let id = parseInt($(this).attr('data-id'))
		$.get(`/farms/${id}.json`, function(farm){
			$(".body-container").html('')
				let newFarm = new Farm(farm)
				let farmHtml = newFarm.formatShow()
				$(".body-container").append(farmHtml)

				farm.areas.forEach(function(area) {
					let newArea = new Area(area)
					let areaHtml = newArea.formatShow()
					$(".body-container").append(areaHtml)
				})		
		})
	})

	$('.new_farm').on('submit', function(e) {
		e.preventDefault();
		
		//data = {
		//	'authenticity_token': $("input[name='authenticity_token']").val(),
		//	'farm_name': $("input[name='farm[name]']").val(),
		//	'farm_user_id': $("input[name='farm[user_id]']").val(),
		//	'area_name': $("input[name='farm[areas_attributes][0][name]']").val(),
		//	'area_type': $("input[name='farm[areas_attributes][0][area_type]']").val(),
		//	'capacity': $("input[name='farm[areas_attributes][0][capacity]']").val(),
		//	'quantity': $("input[name='farm[areas_attributes][0][quantity]']").val(),
		//	'farm_id': $("input[name='farm[areas_attributes][0][farm_id]']").val()
		//}

		
		$.post(this.action, $(this).serialize(), function(data) {
			console.log(data)
			debugger
		})
	})
}

// JS Model Object
function Farm(farm) {
	this.id = farm.id
	this.name = farm.name
	this.areas = farm.areas
}
// Prototype Method
Farm.prototype.formatIndex = function() {
	let farmHtml = `
		<br><br>
		<div class=notice id=notice><div>
		<div class=alert id=alert><div>
		<h1>Farms</h1>
		<a href="/farms/${this.id}" data-id=${this.id} class="show_link">${this.name}</a><br><br>
		<a href="/farms/new" class="add_farm_link">Add Farm</a>
	`
	return farmHtml
}

Farm.prototype.formatShow = function() {
	let farmHtml = `
		<br><br>
		<div class=notice id=notice><div>
		<div class=alert id=alert><div>
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



