class RoomsController < ApplicationController
  before_action :move_to_index, only: [:create, :edit, :destroy, ]
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

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to root_path
    else
      render action: :edit
    end 
  end

  def search
    @rooms = Room.search(params[:keyword])
  end

  private
  def room_params
    params.require(:room).permit(:name,:password, user_ids: [] ).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
