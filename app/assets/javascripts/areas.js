$(document).ready(function() {
	bindClickHandlers();
})

const bindClickHandlers = () => {
	$('').on('click', (e) => {
		e.preventDefault()
		console.log('Clicked on Areas')
	})
}