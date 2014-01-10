class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.integer :captain_id, null: false

      t.timestamps
    end
  end
end
