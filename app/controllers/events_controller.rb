class EventsController < ApplicationController
  def index
    @event = Event.new
    @room = Room.find(params[:room_id])
    @events = @room.events.includes(:user)
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @room = Room.find(params[:room_id])
    @event = @room.events.new(events_params)
    if @events.save
      redirect_to room_events_path(@room)
    else
      @events = @room.events.includes(:user)
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice:"削除しました"
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :start_time).merge(user_id: current_user.id)
  end

end