class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
    @user = current_user
  end

  def new
    @reservation = Reservation.new
    @room = Room.find(params[:id])
  end

  def create
    @user = current_user
    if user_signed_in?
      @reservation = current_user.reservations.build(reservation_params)
      if @reservation.save
        redirect_to :user_reservations, notice: "予約が完了しました"
      else
        @room = Room.find(@reservation.room_id)
        render 'rooms/show'
      end
    else
      redirect_to :new_user_session, alert: "予約を完了するにはログインが必要です"
    end
  end

  def show
    @user = current_user
    @reservation = Reservation.find(params[:id])
    @stay_days = (@reservation.end_at - @reservation.start_at).to_i
    @sum_fee = @stay_days * @reservation.num_of_guests * @reservation.room.fee
  end

  def edit
    @user = current_user
    @room = current_user.rooms.find(params[:id])
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(params.require(:reservation).permit(:start_at, :end_at, :num_of_guests))
      flash[:notice] = "予約の編集が完了しました"
      redirect_to user_reservations_path(current_user)
    else
      render "edit"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約を取り消しました"
    redirect_to user_reservations_path(current_user)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_at, :end_at,:num_of_guests, :room_id)
  end
end
