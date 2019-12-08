class LecturesController < ApplicationController
  def new
		@lecture = Lecture.new
	end
	def create
		render plain: params[:lecture].inspect
		#@lecture = Lecture.new(lecture_params)
		#if @lecture.save
	#		redirect_to @lecture
	#	else
	#		render 'new'
	#	end
	end
end
