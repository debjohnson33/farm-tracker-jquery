$(document).ready(function() {
	bindClicks();
})

const bindClicks = () => {
	$('.all_user_farms').on('click', function(e) {
		e.preventDefault();
		history.pushState(null, null, "farms")

		$.ajax({
			method: 'GET',
			url: this.href
		}).success(function(data) {
			$(".body-container").html('')
			data.forEach(function(farm) {
				let newFarm = new Farm(farm)
				let farmHtml = newFarm.formatIndex()
				$(".body-container").append(farmHtml)
			})
		})
		
	})

	$(document).on('click', ".show_link", (e) => {
		e.preventDefault()
		let id = $(this).attr('data-id')
		$.ajax({
			method:
			url: 
		}).success(function(data) {

		})
	})
}

// JS Model Object
function Farm(farm) {
	this.id = farm.id
	this.name = farm.name
}
// Prototype Method
Farm.prototype.formatIndex = function() {
	let farmHtml = `
		<h1>Farms</h1>
		<a href="/farms/${this.id}" class="show_link"><h2>${this.name}</h2></a>
	`
	return farmHtml
}


