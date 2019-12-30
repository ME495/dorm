require 'set'

class SelectRoomController < ApplicationController

  include LoginHelper
  include SelectRoomHelper

  def select
    @student = current_user
    if @student.room_id.nil?
      @suites = get_suite(@student)
    end
  end

  def get_room
    @student = current_user
    suite = Suite.find(params[:suite_id])
    rooms = []
    for room in suite.rooms
      if room.gender==@student.gender and room.team_id==@student.team_id and room.amount<room.capacity
        rooms.push({room_id: room.id, room_name: room.name})
      end
    end
    #puts rooms.to_json
    render json: rooms.to_json
  end

  def allocate_room
    room = Room.find(params[:room_id])
    if room.amount<room.capacity
      room.amount += 1
      room.save!
      student = current_user
      student.room = room
      student.save!
      render json: {message: 'ok'}.to_json
    else
      render json: {message: '该房间已经被抢了！'}.to_json
    end
  end
end
