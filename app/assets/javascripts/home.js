$(document).ready(function() {
	onClickHandlers();
})

const onClickHandlers = () => {
	$(document).on('click', 'a.navbar-brand', function(e) {
		e.preventDefault();
		$(".body-container").html('')
		$(".body-container").append(formatHome());
	})
}

function formatHome() {
	let homeHtml = `
		<br><br>
		<div class=notice id=notice><div>
		<div class=alert id=alert><div>
		<h1>Welcome to the Farm Tracker!</h1>
		<h2>Click on one of the links</h2>
		<h2>at the top of the page to sign up or sign in</h2>
	`
	return homeHtml
}