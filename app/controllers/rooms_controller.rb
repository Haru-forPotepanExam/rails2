class RoomsController < ApplicationController

  before_action :set_q, only: [:index, :search]

  def index
    @results = @q.result
    @user = current_user
  end

  def new
    @room = Room.new
    @user = current_user
  end

  def create
    @user = current_user 
    @room = Room.new(params.require(:room).permit(:name, :detail, :fee, :address, :img, :user_id))
    @room.img.attach(params[:room][:img])
    if @room.save
      flash[:notice] ="施設を登録しました"
      redirect_to room_path(@room.id)
    else
      render "new"
    end
  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
    @reservation = Reservation.new(room: @room)
  end

  def search
    @user = current_user
    @results = @q.result
    render :index
  end

  def own
    @user = current_user
    @user_rooms = current_user.rooms
  end

  private

  def room_params
    params.require(:room).permit(:img)
  end

  def set_q
    @q = Room.ransack(params[:q])
  end

end
