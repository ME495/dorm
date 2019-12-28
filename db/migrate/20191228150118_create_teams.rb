class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name, index: {unique: true}
      t.string :department
    end
  end
end
