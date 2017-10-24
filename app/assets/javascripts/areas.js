$(document).ready(function() {
	bindClickHandlers();
})

const bindClickHandlers = () => {
	$('.js-next').on('click', function() {
		
		console.log('Clicked on Next Area')
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