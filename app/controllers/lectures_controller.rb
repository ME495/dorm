class LecturesController < ApplicationController

	include LoginHelper

  def index
    #@lectures = Lecture.all
		@lectures = Lecture.paginate(page:params[:page], per_page:15)
  end

  def show
    @lecture = Lecture.find(params[:id])
    @student = Student.find(@lecture.student_id)
	end

 	def new
		@student = current_user
	end

	def create

		@student = current_user
		@lecture = @student.lectures.new(title: params[:title],
																		 start_time: params[:start_time],
																		 end_time: params[:end_time],
																		 category: params[:category],
																		 content: params[:content],
																		 suite: @student.room.suite.name);
		#puts @lecture.title, @lecture.start_time, @lecture.end_time, @lecture.content
		if @lecture.save
			render json: {message: 'ok', lecture_id: @lecture.id}.to_json
		else
			render json: {message: '发布宿舍小讲堂失败'}
		end
	end

	private
	def lecture_params
		params.require(:lecture).permit(:title,:start_time,:end_time,:category,:student_id,:content,:suite)
	end
end
