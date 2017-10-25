$(document).ready(function() {
	bindClickHandlers();
})

const bindClickHandlers = () => {
	$('.js-next').on('click', function() {
		
		var nextId = parseInt($(".js-next").attr("data-id")) + 1;
		$.get("/areas/" + nextId + ".json", function(data) {
			//debugger
			$(".areaName").text(data["name"])
			$(".areaType").text(data["type"])
			$(".areaCapacity").text(data["capacity"])
			$(".areaQuantity").text(data["quantity"])
			$(".areaAvailability").text(data["availability"])
		})
	})
}

// JS Model Object
function Area(area) {
	this.id = area.id
	this.name = area.name
	this.area_type = area.area_type
	this.area_capacity = area.area_capacity
	this.quantity = area.quantity
	this.availability = area.availability
}
// Prototype Method
Area.prototype.formatShow = function() {
	let areaHtml = `
		<h1>Area</h1>
		<h2>Name: ${this.name}</h2>
		<p>Type: ${this.area_type}</p>
		<p>Capacity: ${this.capacity}</p>
		<p>Quantity: ${this.quantity}</p>
		<p>Availability: ${this.availability}</p>
	`
}