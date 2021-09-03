class CommentsController < ApplicationController
  def new
    #@room = Room.find(params[:room_id])
    #@event = Event.find(params[:event_id])
    #@comments = Comment.where(params[event_id: @event.id])
    #@comment = Comment.new
  end

  def create
    @room = Room.find(params[:room_id])
    @event = Event.find(params[:event_id])
    @comment = Comment.new(comment_params)
    #@comment.save
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    end
    redirect_to room_event_path(@room, @event)
  end

  def update
    
  end

  def destroy
    
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, room_id: params[:room_id], event_id: params[:event_id])
  end


end
