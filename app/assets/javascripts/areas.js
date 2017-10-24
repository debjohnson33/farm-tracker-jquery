$(document).ready(function() {
	bindClickHandlers();
})

const bindClickHandlers = () => {
	$('.js-next').on('click', function() {
		
		console.log('Clicked on Next Area')
		var nextId = parseInt($(".js-next").attr(data-id)) + 1;
		debugger
	})
}