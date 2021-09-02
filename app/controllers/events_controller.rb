class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:edit, :destroy, :update]

  def index
    @room = Room.find(params[:room_id])
    @events = @room.events.includes(:user)
  end

  def new
    @room = Room.find(params[:room_id])
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @room = Room.find(params[:room_id])
    @event = @room.events.new(event_params)
    if @event.save
      redirect_to room_events_path(@room)
    else
      @events = @room.events.includes(:user)
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to room_events_path(@event.room_id)
  end

  def edit
    @room = Room.find(params[:room_id])
    @event = Event.find(params[:id])
  end

  def update
    @room = Room.find(params[:room_id])
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to room_events_path(@room)
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :start_time).merge(user_id: current_user.id)
  end

  def move_to_index
    @room = Room.find(params[:room_id])
    unless current_user.id == @room.user_id
      redirect_to root_path
    end
  end

end