class LoginController < ApplicationController

  include LoginHelper

  def login

  end

  def create
    user = Student.where("student_number=?",params[:session][:student_number]).first
    if user && user.password==params[:session][:password]
        # 登录成功操作
        #flash.now[:danger] = "登录成功，用户名/密码正确！"
        log_in user
        x=user.id.to_s
        redirect_to '/main/'+x
    else
        flash.now[:danger] = "登录失败，用户名/密码错误！"
        render :login
    end
  end

  def destroy
    # 登出当前用户，并跳转至登录页
    log_out
    redirect_to :login
  end
end
