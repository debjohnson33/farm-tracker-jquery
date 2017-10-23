$(document).ready(function() {
	bindClicks();
})

const bindClicks = () => {
	$('.all_user_farms').on('click', function(e) {
		console.log('Clicked on Farms')

		$.ajax({
			method: 'GET',
			url: this.href
		}).success(function(data) {
			console.log(data)
			debugger
			//var $ol = $("#animals_list ol")
			//$ol.html("")

			//data.forEach(function(animal) {
			//	$ol.append("<li>" + animal.name + "</li>");
			//})
		})
		e.preventDefault()
	})
}