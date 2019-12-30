module SelectRoomHelper
  def get_suite(student) #获得学生所能选择的套间
    rooms = student.team.rooms
    suites = []
    suite_set = Set.new
    for room in rooms
      if room.gender==student.gender and not suite_set.include?(room.suite_id)
        suites.push(room.suite)
        suite_set.add(room.suite_id)
      end
    end
    return suites
  end
end
