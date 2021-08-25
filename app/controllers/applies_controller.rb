class AppliesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @apply = Apply.new(room_id: @room.id, user_id: current_user.id)
    @apply.save
    redirect_to room_path(@room)
  end

  def allow
    @room = Room.find(params[:room_id])
    @applies = @room.applies.includes(:user)
    @apply = @applies.find_by(params[:id])
    @user = User.find_by(id: @apply.user_id)
    @room_user = RoomUser.new(room_id: @room.id, user_id: @user.id)
    @room_user.save
    @apply.destroy
    redirect_to room_applies_path(@room)
  end

  def refuse
    @room = Room.find(params[:room_id])
    @applies = @room.applies.includes(:user)
    @apply = @applies.find_by(params[:id])
    @apply.destroy
    redirect_to room_applies_path(@room)
  end

  def destroy
    @room = Room.find(params[:room_id])
    @applies = @room.applies.includes(:user)
    @apply = @applies.find_by(params[:id])
    @apply.destroy!
    redirect_to room_path(@room)
  end

  def index
    @room = Room.find(params[:room_id])
    @applies = @room.applies.includes(:user)
  end

  private

  def apply_params
    params.require(:apply).permit(:room_id, :user_id).merge(user_id: current_user.id, room_id: current_room.id)
  end
end
