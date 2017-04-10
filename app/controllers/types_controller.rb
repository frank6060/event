class TypesController < ApplicationController
	def new
		@type = Type.new
	end

	def show
		@type = Type.find(params[:id])
	end

	def create
		@type = Type.new(type_params)
		if @type.save
			redirect_to @type
		else
			render 'new'
		end
		
	end

	private
	def type_params
		params.require(:type).permit(:name)
		
	end

end