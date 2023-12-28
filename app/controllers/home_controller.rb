class HomeController < ApplicationController
  def index
    @user = current_user
    @rooms = Room.all
    @q = Room.ransack(params[:q])
  end

end
