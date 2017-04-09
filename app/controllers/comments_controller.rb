class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@event = Event.find(params[:event_id])
		@comment = Comment.create(params[:comment].permit(:body, :name))
		@comment.user_id = current_user.id
		@comment.event_id = @event.id

		if @comment.save
			redirect_to event_path(@event)
		else
			render 'new'
		end
	end
end
