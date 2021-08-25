class RoomUsersController < ApplicationController
  def destroy
    @room = Room.find(params[:room_id])
    @room_user = RoomUser.find(params[:id])
    @room_user.destroy!
    redirect_to room_path(@room)
  end

  private

  def room_user_params
    params.permit(:room_id, :user_id)
  end
end
