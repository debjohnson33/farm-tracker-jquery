class AnimalsController < ApplicationController
	def index
		#raise params.inspect
		@farm = Farm.find(params[:farm_id])
		@animals = @farm.animals
	end

	def new
		@farm = Farm.find([params[:farm_id]])
	end

	def create
		@animal = Animal.new(animal_params)
		if @animal.save
			redirect_to animal_path(@animal)
		else
			render new_farm_animal_path(@animal)
		end
	end


	private

	def animal_params
		params.require(:animal).permit(
			:id,
			:name,
			:area_id, 
			:age,
			:sex, 
			:color,
			:weight, 
			:animal_type,
			:pregnant,
			:date_bred,
			:estimated_due_date,
			:area_id
			]
		)
	end
end