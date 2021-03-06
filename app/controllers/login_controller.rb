class LoginController < ApplicationController

  skip_before_action :require_student_login

  include LoginHelper

  def login

  end

  def create
    if params[:session][:type].to_s=="学生"
      user = Student.find_by_number(params[:session][:number])
      if user && user.password==params[:session][:password]
          # 登录成功操作
          #flash.now[:danger] = "登录成功，用户名/密码正确！"
          log_in user
          x=user.id.to_s
          redirect_to '/welcome'
      else
          flash.now[:danger] = "登录失败，学号/密码错误！"
          render :login
      end
    elsif params[:session][:type].to_s=="管理员"
      user = Admin.find_by_account(params[:session][:number])

      if user && user.password==params[:session][:password]
        log_in user
        redirect_to '/welcome/admin'
      else
          flash.now[:danger] = "登录失败，用户名/密码错误！"
          render :login
      end
    else
      flash.now[:danger] = "登录失败，请选择身份！"
      render :login
    end
  end

  def destroy
    # 登出当前用户，并跳转至登录页
    log_out
    redirect_to :login
  end
end
