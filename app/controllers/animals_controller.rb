class AnimalsController < ApplicationController
	def index
		@farm = Farm.find(params[:farm_id])
		@animals = @farm.animals
	end

	def show
		@animal = Animal.find(params[:id])
	end

	def new
		@farm = Farm.find(params[:farm_id])
		@areas = @farm.areas.all
		@animal = Animal.new
		@animal.baby_animals.build
	end

	def create
		@farm = Farm.find(params[:farm_id])
		@animal = Animal.new(animal_params)
		area = Area.find(params[:animal][:area_id])
		
		if area.quantity < area.capacity
			area.quantity += 1
		end
		
		area.save
		
		if @animal.save
			redirect_to animal_path(@animal)
		else
			render farm_animals_path(@animal)
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
		)
	end
end