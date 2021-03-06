class StudentsController < ApplicationController

  skip_before_action :require_student_login
  skip_before_action :verify_authenticity_token

  def index
    #@students = Student.all
    @students = Student.paginate(page:params[:page], per_page:15)
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
  end

  def edit
    @student = Student.find(params[:id])
    puts @student.name
  end

  def create
    team = Team.find_by_name(student_params[:team_name])
    if team.nil?
      flash.now[:alert] = '请填写有效的班级!'
      render "new"
    else
      @student = Student.new(number: student_params[:number],
                             password: student_params[:password],
                             name: student_params[:name],
                             gender: student_params[:gender],
                             team_id: team.id,
                             email: student_params[:email])
      if @student.save
        p student_path(@student.id)
        redirect_to student_path(@student.id)
      else
        p @student.errors
        render "new"
      end
    end
  end

  def update
    @student = Student.find(params[:id])
    team = Team.find_by_name(student_params[:team_name])
    room = Room.find_by_name(student_params[:room_name])
    if team.nil?
      flash.now[:alert] = '请填写有效的班级!'
      render "edit"
    elsif room.nil?
      flash.now[:alert] = '请填写有效的房间号！'
      render "edit"
    else
      if @student.update(id: params[:id],
                         number: student_params[:number],
                         password: student_params[:password],
                         name: student_params[:name],
                         gender: student_params[:gender],
                         team_id: team.id,
                         room_id: room.id,
                         email: student_params[:email])
        redirect_to @student
      else
        render "edit"
      end
    end
    #@student = Student.find(params[:id])
    #if @student.update(student_params)
    #  redirect_to @student
    #else
    #  render 'edit'
    #end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:id, :number, :password, :name, :gender, :team_name, :room_name, :email)
  end
end

