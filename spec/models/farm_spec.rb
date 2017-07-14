require 'rails_helper'

RSpec.describe Farm, type: :model do
	before(:each) do
		@user = User.create(email: "test@email.com", password: "password")
		@sapps = Farm.create(name: "Sapps Farm", user_id: @user.id)
		@roberts = Farm.create(name: "Roberts Farm", user_id: @user.id)
		@goat_pen = Area.create(name: "Goat Pen", farm_id: @sapps.id, area_type: "Pen", capacity: 20, quantity: 16)
		@pig_pen = Area.create(name: "Pig Pen", farm_id: @sapps.id, area_type: "Pen", capacity: 6, quantity: 4)
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
	end

	it "is valid with a name and user_id" do
		expect(@user).to be_valid
	end

	it "is not valid without a user_id" do
		expect(Farm.new(name: "Sipsee Farm")).not_to be_valid
	end		


	context 'associations' do
		
		it "belongs to user" do
			expect(@user.farms.count).to eq(2)
		end

		it "has many areas" do
			expect(@sapps.areas.count).to eq(2)
		end

		it "has many animals through areas" do
			expect(@sapps.areas.first.animals.count).to eq(2)
			
		end

	end


end