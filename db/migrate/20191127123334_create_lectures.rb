class CreateLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :lectures do |t|
      t.int :lecid
      t.string :time
      t.string :suite
      t.string :type
      t.string :text
      t.int :userid

      t.timestamps
    end
  end
end
