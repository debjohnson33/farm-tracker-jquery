$(document).ready(function() {
	bindClickHandlers();
})

const bindClickHandlers = () => {
	$(document).on('click', '.js-next', function() {
		var nextId = parseInt($(".js-next").attr("data-id")) + 1;
		$.get("/areas/" + nextId + ".json", function(data) {
			formatShow(data)
			
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

function formatShow(data) {
	$(".areaName").text(data["name"])
	$(".areaType").text(data["type"])
	$(".areaCapacity").val(data["capacity"])
	$(".areaQuantity").val(data["quantity"])
	$(".areaAvailability").val(data["availability"])
}