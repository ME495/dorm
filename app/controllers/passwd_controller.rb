class PasswdController < ApplicationController

  skip_before_action :require_student_login

  def passwd
  end

  def create
    #if params[:session][:type].to_s=="学生"
    #  user = Student.where("student_number=?",params[:session][:number]).first
      user = Student.find_by_number(params[:session][:number])
      if !user.nil? 
          if user.email==params[:session][:email]
            # 修改密码
            if params[:session][:password]==params[:session][:cfm]
              user.update(password:params[:session][:cfm])
              flash[:warning] = "密码修改成功！"
              redirect_to :login
            else
              flash.now[:danger] = "两次密码输入不一致！"
              render :passwd
            end
          else
            flash.now[:danger] = "邮箱输入不正确！"
            render :passwd
          end
      else
          flash.now[:danger] = "学号输入不正确！"
          render :passwd
      end
    #elsif params[:session][:type].to_s=="管理员"
    #  user = Admin.where("account=?",params[:session][:student_number]).first
    #  if !user.nil?
    #    if user.email==params[:session][:email]
    #      # 修改密码
    #      if params[:session][:password]==params[:session][:cfm]
    #        user.update(password:params[:session][:cfm])
    #        flash[:warning] = "密码修改成功！"
    #        redirect_to :login
    #      else
    #        flash.now[:danger] = "两次密码输入不一致！"
    #        render :passwd
    #      end
    #    else
    #      flash.now[:danger] = "邮箱输入不正确！"
    #      render :passwd
    #    end
    #  else
    #      flash.now[:danger] = "用户名输入不正确！"
    #      render :passwd
    #  end
    #else
    #  flash.now[:danger] = "修改密码失败，请选择身份！"
    #  render :passwd
    #end
  end
end

