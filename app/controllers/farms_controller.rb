class FarmsController < ApplicationController
	before_action :set_farm, except: %i[index new create]

	def index
		@farms = current_user.farms
		respond_to do |f|
			f.json { render json: @farms, :layout => false}
			f.html
		end
	end

	def show
		if current_user.id == @farm.user_id
			respond_to do |f|
				f.json { render json: @farm }
				f.html
			end
		else
			redirect_to farms_path
		end
	end

	def new
		@farm = Farm.new
		@user = current_user
		@farm.areas.build
	end

	def create
		@farm = Farm.new(farm_params)
		if @farm.save
			flash[:notice] = "Farm was created."
			redirect_to farm_path(@farm)
		else
			render :new
		end
	end

	def edit
		if current_user.id == @farm.user_id
			if @farm.areas.count < 1
				@farm.areas.build
			end
			render :edit
		else
			redirect_to farms_path
		end

	end

	def update
		if @farm.update(farm_params)
			flash[:notice] = "Farm was updated."
			redirect_to farm_path(@farm)
		else
			render :edit
		end
	end

	def destroy
		@areas = @farm.areas
		@areas.destroy
		@farm.destroy
		flash[:alert] = "Farm and areas were deleted."
		redirect_to farms_path
	end


	private

	def farm_params
		if params[:action] == "new" || params[:action] == "create"
			params.require(:farm).permit(
				:name,
				:user_id, 
				:areas_attributes => [
					:id,
					:name, 
					:area_type,
					:capacity, 
					:quantity,
					:farm_id
				]
			)
		else
			params.require(:farm).permit(:name, :user_id)
		end
	end

	def set_farm
		@farm = Farm.find(params[:id])
	end
end