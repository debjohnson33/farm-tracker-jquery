class AnimalsController < ApplicationController
	def index
		@farm = Farm.find(params[:id])
		@animals = @farm.animals
	end
end