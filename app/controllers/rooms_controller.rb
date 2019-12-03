class RoomsController < ApplicationController
	def index
		@rooms = Room.all
	end

	def show
		@room = Room.find(params[:id])
	end

	def new
		@room = Room.new
	end

	def edit
		@room = Room.find(params[:id])
	end

	def create
#		render plain: params[:room].inspect
		@room = Room.new(room_params)
		if @room.save
			redirect_to @room
		else
			render 'new'
		end
	end

	def update
		@room = Room.find(params[:id])
		if @room.update(room_params)
			redirect_to @room
		else
			render 'edit'
		end
	end
	
	def destroy
		@room = Room.find(params[:id])
		@room.destroy
		redirect_to rooms_path
	end

	private
		def room_params
			params.require(:room).permit(:room_number,:apartment,:unit,:capacity,:amount,:gender,:floor,:department,:suite)
		end
end
