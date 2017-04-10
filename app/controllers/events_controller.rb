class EventsController < ApplicationController
	
	before_action :find_event, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		if params[:type].blank?
			@events = Event.all.order("created_at DESC")
		else
			@type_id = Type.find_by(name: params[:type]).id
			@events = Event.where(type_id: @type_id).order("created_at DESC")
		end
	end

	def show
		@comments = Comment.where(event_id: @event)
		@random_event = Event.where.not(id: @event).order("RANDOM()").first

	end

	def new
		@event = current_user.events.build
	end

	def create
		@event = current_user.events.build(event_params)

		if @event.save
			redirect_to @event
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @event.update(event_params)
			redirect_to @event
		else
			render 'edit'
		end
	end

	def destroy
		@event.destroy
		redirect_to root_path
	end

	def upvote
		@event.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@event.downvote_from current_user
		redirect_to :back
	end

	private

	def find_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:state, :address, :image, :city, :phone, :email, :dress, :name)
	end
end
