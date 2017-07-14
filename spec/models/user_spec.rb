require 'rails_helper'

RSpec.describe User, type: :model do
	before(:each) do
		@user = User.create(email: "test@email.com", password: "password")
		@sapps = Farm.create(name: "Sapps Farm", user_id: @user.id)
		@roberts = Farm.create(name: "Roberts Farm", user_id: @user.id)
		@goat_pen = Area.create(name: "Goat Pen", farm_id: @sapps.id, area_type: "Pen", capacity: 20, quantity: 16)
		@cocoa = Animal.create(
			name: "Cocoa", 
			age: "1 year", 
			sex: "female", 
			color: "white and tan", 
			weight: 120, 
			pregnant: true, 
			date_bred: 20170407, 
			estimated_due_date: 20171010, 
			area_id: @goat_pen.id,
			animal_type: "goat" 
			)

		@cocoa2 = Animal.create(
			name: "Cocoa2", 
			age: "1 year", 
			sex: "female", 
			color: "white and tan", 
			weight: 120, 
			pregnant: true, 
			date_bred: 20170407, 
			estimated_due_date: 20171010, 
			area_id: @goat_pen.id,
			animal_type: "goat" 
			)
		@user_animal1 = UserAnimal.create(@user.id, @cocoa.id)
		@user_animal2 = UserAnimal.create(@user.id, @cocoa2.id)
	end

	it "is valid with an email and password" do
		expect(@user).to be_valid
	end

	it "is not valid without a password" do
		expect(User.new(email: "email@mail.com")).not_to be_valid
	end		


	context 'associations' do
		
		it "has many farms" do
			expect(@user.farms.count).to eq(2)
		end

		it "has many animals through user animals" do
			expect(@user.animals.first).to eq(@cocoa)
			expect(@user.animals.second).to eq(@cocoa2)
		end

	end


end