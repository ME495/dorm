class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :student_number, null: false, index: {unique: true}
      t.string :password, null: false
      t.string :student_name, null: false
      t.string :gender, null: false
      t.string :department, null: false
      t.references :room, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
