class ChangeLectures < ActiveRecord::Migration[5.1]
  def change
    change_column_null :lectures, :title, true
    change_column_null :lectures, :start_time, true
    change_column_null :lectures, :end_time, true
    change_column_null :lectures, :category, true
    change_column_null :lectures, :content, true
    change_column_null :lectures, :suite, true
    change_column_null :lectures, :created_at, true
    change_column_null :lectures, :updated_at, true

    remove_column :lectures, :created_at, :datetime
    remove_column :lectures, :updated_at, :datetime
  end
end