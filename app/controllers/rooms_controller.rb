class RoomsController < ApplicationController
  def new
    @room = room.new
    @room.users << current_user
  end

  def create
    @room = room.new(room_params)
    if @room.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:name, user_ids: [] )
  end
end
