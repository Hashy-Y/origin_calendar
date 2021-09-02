class RoomUsersController < ApplicationController
  
  def index
    @room = Room.find(params[:room_id])
    @room_users = @room.room_users.includes(:user)
  end

  def destroy
    @room = Room.find(params[:room_id])
    @room_users = @room.room_users.includes(:user)
    @room_user = @room_users.find_by(params[user_id: current_user.id, room_id: @room.id])
    @room_user.destroy!
    redirect_to room_path(@room)
  end

  private

  def room_user_params
    params.require(:room_user).permit(:room_id, :user_id).merge(user_id: current_user.id)
  end
end
