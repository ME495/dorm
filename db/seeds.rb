# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(account: 'admin1', password: '123456', email: 'admin1@example.com')

st1 = '赵钱孙李周吴郑王冯陈褚卫蒋沈韩杨朱秦尤许何吕施张孔曹严华金魏陶姜戚谢邹喻柏水窦章云苏潘葛奚范彭郎鲁韦昌马苗凤花方'
st2 = '乙一刁二又人入七十乃口弋巳兀三下上收壬少心手日氏水尤古仟册加去只叫求正甲申伉再冲刑向在夙如宅守字佘冶吾吟吴吻完尾巫役忘供侃刻卦固坤姑官冈庚快拓拙拉昭架柱柳注治炭界皆突'
srand 1

for apartment in 1..5
  for unit in 1..4
    for floor in 1..9
      for number in 1..4
        gender = 'male'
        if apartment<=2
          gender = 'female'
        end
        suite = Suite.create!(name: "雁#{apartment}-#{unit}#{floor}#{number}",
                              apartment: "雁#{apartment}",
                              unit: unit,
                              floor: floor,
                              number: number,
                              gender: gender,
                              layout: number)
        for room_number in 1..5
          room = suite.rooms.create!(name: "#{suite.name}-#{room_number}",
                                     number: room_number,
                                     capacity: 1,
                                     amount: 0,
                                     gender: gender)
        end
      end
    end
  end
end

team = Team.create!(name: '20180708', department: '计算机学院')
for i in 1..40
  number = "%011d"%i
  gender = 'male'
  if i<=10
    gender = 'female'
  end
  name = st1[rand st1.size]+st2[rand st2.size]+st2[rand st2.size]
  room = Room.find_by(gender: gender, team_id: nil)
  room.team_id = team.id
  room.amount += 1
  room.save!
  student = team.students.create!(number: "2018#{number}",
                                  password: "123456",
                                  name: name,
                                  gender: gender,
                                  room_id: room.id,
                                  email: 'example@example.com')
  start_time = Time.local(2019,rand(12)+1,rand(28)+1,14,0,0)
  end_time = start_time + 7200
  lecture = student.lectures.create!(title: "ruby",
                                     start_time: start_time,
                                     end_time: end_time,
                                     category: '计算机',
                                     content: "a"*1000,
                                     suite: student.room.suite.name)
  start_time = Time.local(2019,rand(12)+1,rand(28)+1,14,0,0)
  end_time = start_time + 7200
  lecture = student.lectures.create!(title: "二元一次方程求解",
                                     start_time: start_time,
                                     end_time: end_time,
                                     category: '数学',
                                     content: "b"*1000,
                                     suite: student.room.suite.name)
end

team = Team.create!(name: '20190708', department: '计算机学院')
for i in 1..40
  number = "%011d"%i
  gender = 'male'
  if i<=10
    gender = 'female'
  end
  name = st1[rand st1.size]+st2[rand st2.size]+st2[rand st2.size]
  room = Room.find_by(gender: gender, team_id: nil)
  room.team_id = team.id
  room.save!
  student = team.students.create!(number: "2019#{number}",
                                  password: "123456",
                                  name: name,
                                  gender: gender)
end