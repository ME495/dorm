class CreateLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :lectures do |t|
      t.string :title, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.string :category, null: false
      t.text :content, null: false
      t.references :student, foreign_key: true, null: false
      t.string :suite, null: false

      t.timestamps
    end
  end
end
