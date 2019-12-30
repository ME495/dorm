class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_student_login

  private
  def require_student_login
    if session[:id].nil?
      redirect_to '/login'
    end
  end
end
