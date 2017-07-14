require 'rails_helper'

RSpec.describe User, type: :model do
	before(:each) do
		@user = User.create(email: "test@email.com", password: "password")
		@sapps = Farm.create(name: "Sapps Farm", user_id: @user.id)
		@roberts = Farm.create(name: "Roberts Farm", user_id: @user.id)
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

	end


end