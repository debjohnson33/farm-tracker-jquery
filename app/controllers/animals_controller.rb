class AnimalsController < ApplicationController
	before_action :set_farm, except: %i[show edit update destroy]
	before_action :set_animal, except: %i[index new create]

	def index
		@animals = @farm.animals
		@large_animals = @farm.animals.large
		@small_animals = @farm.animals.small
		respond_to do |f|
			f.html
			f.json { render json: @animals }
		end
	end

	def show
	end

	def new
		@areas = @farm.areas.all
		@animal = Animal.new
	end

	def create
		@animal = Animal.new(animal_params)
		if @animal.name != ''
			area = Area.find(params[:animal][:area_id])
			if area.quantity < area.capacity
				area.quantity += 1
				area.save
			end
		end

		if @animal.save
			flash[:notice] = "Animal was created."
			redirect_to animal_path(@animal)
		else
			@farm = Farm.find(params[:farm_id])
			@areas = @farm.areas
			render :new
		end
	end

	def edit
		@farm = @animal.area.farm
		@areas = @farm.areas	
	end

	def update
		if @animal.update(animal_params)
			flash[:notice] = "Animal was updated."
			redirect_to animal_path(@animal)
		else
			@farm = @animal.area.farm
			@areas = @farm.areas
			render :edit
		end
	end

	def destroy
		@animal.destroy
		@animal.area.quantity -= 1
		flash[:notice] = "Animal was deleted."
		redirect_to farm_path
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
			:estimated_due_date
		)
	end

	def set_farm
		@farm = Farm.find(params[:farm_id])
	end

	def set_animal
		@animal = Animal.find(params[:id])
	end
end