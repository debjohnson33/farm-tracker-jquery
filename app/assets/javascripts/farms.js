$(document).ready(function() {
	bindClickHandlers();
})

const bindClickHandlers = () => {
	$('all_user_farms').on('click', (e) => {
		e.preventDefault()
		alert('Clicked on Farms')
	})
}