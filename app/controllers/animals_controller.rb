class AnimalsController < ApplicationController
	def index
		#raise params.inspect
		@farm = Farm.find(params[:farm_id])
		@animals = @farm.animals
	end

	def new
		@farm = Farm.find([params[:farm_id]])
		@animal = @farm.animals.new
	end
end