require 'rails_helper'

RSpec.describe Area, type: :model do
	before(:each) do
		@user = User.create(email: "test@email.com", password: "password")
		@sapps = Farm.create(name: "Sapps Farm", user_id: @user.id)
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

		@baby_cocoa = BabyAnimal.create(
			name: "Baby Cocoa", 
			age: "1 year", 
			sex: "female", 
			color: "white and tan", 
			weight: 120,  
			animal_id: @cocoa.id,
			animal_type: "goat" 
			)

		@baby_cocoa2 = BabyAnimal.create(
			name: "Baby Cocoa2", 
			age: "1 year", 
			sex: "female", 
			color: "white and tan", 
			weight: 120, 
			animal_id: @cocoa.id,
			animal_type: "goat" 
			)		
	end

	it "is valid with a name and farm_id" do
		expect(@goat_pen).to be_valid
	end

	it "is not valid without a farm_id" do
		expect(Area.create(name: "Goat Pen")).not_to be_valid
	end		


	context 'associations' do
		
		it "belongs to farm" do
			expect(@sapps.areas.count).to eq(2)
		end

		it "has many animals" do
			expect(@sapps.areas.first.animals.count).to eq(2)
		end

		it "has many baby animals through animals" do
			expect(@goat_pen.animals.first.baby_animals.count).to eq(2)
			
		end

	end


end