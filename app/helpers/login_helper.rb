module LoginHelper
    def log_in(user)
        session[:id] = user.id
     end
   
     # 返回当前系统登录用户
     def current_user
        @current_user ||= Student.find_by(id: session[:id])
     end
   
     # 返回当前是否存在已登录用户
     def logged_in?
        !current_user.nil?
     end
   
     # 对当前用户做登出操作
     def log_out
        session.delete(:id)
        @current_user = nil	 
     end
end
