class StudentsController < ApplicationController
        def index
        end

        def show
                @student = Student.find(params[:id])
        end

        def new
        end

        def create
                render plain: params[:student].inspect
               if @student = Student.new(student_params)
                   if  @student.save
               		redirect_to @student
                   end
                end
#               if @student.save
#                       redirect_to @student
#               else
#                       redirect_to url:student_path
#               end
       end
        private
                def student_params
                        params.require(:student).permit(:student_number,:password,:student_name,:gender,:department,:room_id,:email)
                end
end

