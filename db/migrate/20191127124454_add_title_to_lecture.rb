class AddTitleToLecture < ActiveRecord::Migration[5.1]
  def change
    add_column :lectures, :title, :string
  end
end
