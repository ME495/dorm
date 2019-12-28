class CreateSuites < ActiveRecord::Migration[5.1]
  def change
    create_table :suites do |t|
      t.string :name, index: {unique: true}
      t.string :apartment
      t.integer :unit
      t.integer :floor
      t.integer :number
      t.string :gender
      t.string :layout
    end
  end
end
