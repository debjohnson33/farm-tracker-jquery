$(document).ready(function() {
	bindClicks();
})

const bindClicks = () => {
	$('.all_user_farms').on('click', function(e) {
		e.preventDefault();
		console.log('Clicked on Farms')

		$.ajax({
			method: 'GET',
			url: this.href
		}).success(function(data) {
			
			//debugger


			//data.forEach(function(animal) {
			//	$ol.append("<li>" + animal.name + "</li>");
			//})
		})
		
	})
}