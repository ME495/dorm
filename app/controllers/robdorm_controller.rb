class RobdormController < ApplicationController
  def index
    @user = Student.find(params[:id])
    @rooms = Room.all
  end

  def show
  end

  def create
    robroom = Room.where("apartment=? and unit=? and floor=? and suite=? and room_number=?",params[:robroom][:apartment],params[:robroom][:unit],params[:robroom][:floor],params[:robroom][:suite],params[:robroom][:room_number]).first
    if robroom && robroom.amount<robroom.capacity
      @robroom = Room.find(robroom.id)
      @student = Student.find(session[:id])
      x = robroom.amount
      if @robroom.update(amount:x+1) &&@student.update(room_id: robroom.id)
        redirect_to '/rooms'
      else
        render :index
      end
    else
      flash.now[:danger] = "啊哦手慢了~ 换一间吧"
      render :index
    end
  end

  private
  def room_params
    params.require(:robroom).permit(:room_number,:apartment,:unit,:capacity,:amount,:gender,:floor,:department,:suite)
  end

end
