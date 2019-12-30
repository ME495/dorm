class AddGenderToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :gender, :string
  end
end
