require 'rails_helper'

feature 'Add a Farm' do
	scenario 'able to create a farm' do
		#1 Go to home page and find a sign in link
		visit '/'
		#2 Click on link "Sign in" and get to sign in page
		click_link "Sign in"
		fill_in "user_email", with: "test@email.com"
		fill_in "user_password", with: "password"
		#3 Click on "Sign in" button and get to farms index
		click_button "Log in"
		#4 Click on "Add farm" and get to new farm form
		click_link "Add Farm"

		#5 Fill in the farm name field
		fill_in "farm_name", with: "Phil's Farm"
		#5 Click on "Create Farm" and get to farm view
		click_button "Create Farm"
		#6 Farm view should have name (more after nested form is implemented)
		expect(page).to have_content("Phil's Farm")
	end
end