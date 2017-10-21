$(document).ready(function() {
	bindClicks();
})

const bindClicks = () => {
	$('.all_user_farms').on('click', (e) => {
		e.preventDefault()
		console.log('Clicked on Farms')
	})
}