class MainController < ApplicationController
  
  def fetch
    #@current_user ||= Student.find_by(id: session[:id])
    if params[:id].to_s==session[:id].to_s
      @user = Student.find(params[:id])
    else
      redirect_to '/login'
    end
  end

end
