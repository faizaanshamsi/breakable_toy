class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :quantity, null: false, default: 0
      t.integer :user_id
      t.integer :team_id
      t.integer :accomplishment_id

      t.timestamps
    end
  end
end
