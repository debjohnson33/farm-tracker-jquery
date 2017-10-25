$(document).ready(function() {
	bindClickHandlers();
})

const bindClickHandlers = () => {
	$('.js-next').on('click', function() {
		console.log('Clicked Next')
		var nextId = parseInt($(".js-next").attr("data-id")) + 1;
		$.get("/areas/" + nextId + ".json", function(area) {
			$(".body-container").html('')
			let newArea = new Area(area)
			let areaHtml = newArea.formatShow()
			$(".body-container").append(areaHtml)
		})
	})
}

// JS Model Object
function Area(area) {
	this.id = area.id
	this.name = area.name
	this.area_type = area.area_type
	this.capacity = area.capacity
	this.quantity = area.quantity
	this.availability = area.availability
}
// Prototype Method
Area.prototype.formatShow = function() {
	let areaHtml = `
		<h1>Area</h1>
		<h2>Name: ${this.name}</h2>
		<p>Capacity: ${this.capacity}</p>
		<p>Quantity: ${this.quantity}</p>
	`
	return areaHtml
}