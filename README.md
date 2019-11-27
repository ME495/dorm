# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
### student
学生表

| 属性 | 数据类型 | 主键 | 参照表 | 约束 | 空值 | 意义 |
|-|-|-|-|-|-|-|
| student_id | 字符串 | 是 | | | 非空 | 学生id，一般为学号 |
| password | 字符串 | | | | 非空 | 密码 |
| student_name | 字符串 | | | | 非空 | 学生姓名 |
| gender | 字符串 | | |"male" or "female" | 非空 | 性别 |
| department | 字符串 | | |要与room_id对应的department相同 | 非空 | 学生所属院系 |
| room_id | 字符串 | |room | | 非空 | 房间号 |
| email | 字符串 | | | | 非空 | email用于重置修改密码 |

### room
房间

| 属性 | 数据类型 | 主键 | 参照表 | 约束 | 空值 | 意义 |
|-|-|-|-|-|-|-|
| room_id | 字符串 | 是 | | | 非空 | 房间号 |
| apartment | 字符串 | | | | 非空 | 所属公寓名称 |
| unit | 整数 | | | | 非空 | 房间所在的楼栋单元 |
| capacity | 整数 | | | | 非空 | 房间所能容纳的人数 |
| real_number | 整数 | | | 不大于capacity | 非空 | 房间已经住了多少人 |
| gender | 字符串 | | | "male" or "female" | 非空 | 性别 |
| floor | 整数 | | | | 非空 | 房间所在楼层 |
| department | 字符串 | | | | 非空 | 拥有该房间的院系 |
| suite | 字符串 | | | | 非空 | 房间所在的套间 v

### forum
宿舍小讲堂

| 属性 | 数据类型 | 主键 | 参照表 | 约束 | 空值 | 意义 |
|-|-|-|-|-|-|-|
| forum_id | 字符串 | 是 | | | 非空 | 小讲堂编号 |
| title | 字符串 | | | | 非空 | 标题 |
| start_time | 时间 | | | | 非空 | 开始时间 |
| end_time | 时间 | | | | 非空 | 结束时间 |
| suite | 字符串 | | | | 非空 | 举办小讲堂的套间 |
| class | 字符串 | | | | 非空 | 小讲堂的类别 |
| content | 字符串 | | | | 非空 | 内容 |
| student_id | 字符串 | | student | | 非空 | 发布小讲堂的学生 |

### admin
宿舍管理员

| 属性 | 数据类型 | 主键 | 参照表 | 约束 | 空值 | 意义 |
|-|-|-|-|-|-|-|
| admin_id | 字符串 | 是 | | | 非空 | 宿舍管理员的id |
| password | 字符串 | | | | 非空 | 密码 |
| email | 字符串 | | | | 非空 | email用于重置密码 |

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
