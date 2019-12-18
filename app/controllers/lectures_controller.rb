class LecturesController < ApplicationController
 	def new
		@lecture = Lecture.new
	end
	def create
		# render plain: params[:lecture].inspect
		
		@lecture = Lecture.new(lecture_params)
		@lecture.student_id = session[:id]
		@student = Student.find(session[:id])
		@room = Room.find(@student.room_id)
		@lecture.suite = @room.suite
		puts @lecture.suite
		if @lecture.save!
			render 'show'
		end
	end
	private
	def lecture_params
		params.require(:lecture).permit(:title,:start_time,:end_time,:category,:student_id,:content,:suite)
	end	
end
