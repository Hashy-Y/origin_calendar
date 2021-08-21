class RoomsController < ApplicationController
  before_action :move_to_index, only: [:create]
  def index
    @rooms = Room.all
  end
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:name,:password, user_ids: [] )
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
