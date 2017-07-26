class BabyAnimalsController < ApplicationController
	def index
		@farm = Farm.find(params[:id])
		@baby_animals = @farm.baby_animals
	end

	def edit
		
	end
end