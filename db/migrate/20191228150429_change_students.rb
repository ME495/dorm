class ChangeStudents < ActiveRecord::Migration[5.1]
  def change
    change_column_null :students, :student_number, true
    change_column_null :students, :password, true
    change_column_null :students, :student_name, true
    change_column_null :students, :gender, true
    change_column_null :students, :department, true
    change_column_null :students, :created_at, true
    change_column_null :students, :updated_at, true

    remove_column :students, :created_at, :datetime
    remove_column :students, :updated_at, :datetime
    rename_column :students, :student_number, :number
    rename_column :students, :student_name, :name
    remove_column :students, :department, :string
    add_reference :students, :team, foreign_key: true
  end
end