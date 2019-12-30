# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
### suite
套间

| 属性 | 数据类型 | 主键 | 参照表 | 约束 | 空值 | 意义 |
|-|-|-|-|-|-|-|
| id | 整数 | 是 | | | 非空 | 自增主键 |
| name | 字符串 | | | unique | 非空 | 套间名，如"雁5-153"表示雁5公寓1单元5楼3号套间 |
| apartment | 字符串 | | | | 非空 | 公寓，如"雁5" |
| unit | 整数 | | | | 非空 | 楼栋单元 |
| floor | 整数 | | | | 非空 | 楼层 |
| number | 整数 | | | | 非空 | 编号 |
| gender | 字符串 | | | | 非空 | 性别 |
| layout | 字符串 | | | | 非空 | 布局 |

### team
班级

| 属性 | 数据类型 | 主键 | 参照表 | 约束 | 空值 | 意义 |
|-|-|-|-|-|-|-|
| id | 整数 | 是 | | | 非空 | 自增主键 |
| name | 字符串 | | | unique | 非空 | 班级名称 |
| department | 字符串 | | | | 非空 | 所属院系 |


### student
学生

| 属性 | 数据类型 | 主键 | 参照表 | 约束 | 空值 | 意义 |
|-|-|-|-|-|-|-|
| id | 整数 | 是 | | | 非空 | 自增主键 |
| number | 字符串 | | | unique | 非空 | 学号 |
| password | 字符串 | | | | 非空 | 密码 |
| name | 字符串 | | | | 非空 | 学生姓名 |
| gender | 字符串 | | |"male" or "female" | 非空 | 性别 |
| team_id | 字符串 | | team | | 非空 | 学生所属班级 |
| room_id | 字符串 | |room | | | 房间号 |
| email | 字符串 | | | | | email用于重置修改密码 |

### room
房间

| 属性 | 数据类型 | 主键 | 参照表 | 约束 | 空值 | 意义 |
|-|-|-|-|-|-|-|
| id | 整数 | 是 | | | 非空 | 自增主键 |
| name | 字符串 | | | unique | 非空 | 房间名，如"雁5-153-1" |
| suite_id | 整数 | | suite | | 非空 | 所属套间 |
| number | 整数 | | | | 非空 | 房间编号 |
| capacity | 整数 | | | | 非空 | 房间所能容纳的人数 |
| amount | 整数 | | | 不大于capacity | 非空 | 房间已住人数 |
| gender | 字符串 | | |"male" or "female" | 非空 | 性别 |
| team_id | 整数 | | team | | | 拥有该房间的班级 |

### lecture
宿舍小讲堂

| 属性 | 数据类型 | 主键 | 参照表 | 约束 | 空值 | 意义 |
|-|-|-|-|-|-|-|
| id | 整数 | 是 | | | 非空 | 自增主键 |
| title | 字符串 | | | | 非空 | 标题 |
| start_time | 时间 | | | | 非空 | 开始时间 |
| end_time | 时间 | | | | 非空 | 结束时间 |
| category | 字符串 | | | | 非空 | 小讲堂的类别 |
| content | 字符串 | | | | 非空 | 内容 |
| suite | 字符串 | | | 与学生所在的套间名字相同 | 非空 | 举办小讲堂的套间的名字 |
| student_id | 整数 | | student | | 非空 | 发布小讲堂的学生 |

### admin
宿舍管理员

| 属性 | 数据类型 | 主键 | 参照表 | 约束 | 空值 | 意义 |
|-|-|-|-|-|-|-|
| id | 整数 | 是 | | | 非空 | 自增主键 |
| account | 字符串 | | | unique | 非空 | 账号 |
| password | 字符串 | | | | 非空 | 密码 |
| email | 字符串 | | | | 非空 | email用于重置密码 |

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
