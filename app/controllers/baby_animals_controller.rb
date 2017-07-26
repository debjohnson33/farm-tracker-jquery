class BabyAnimalsController < ApplicationController
	def index
		@farm = Farm.find(params[:farm_id])
		@animals = @farm.animals
	end

	def edit
		
	end
end