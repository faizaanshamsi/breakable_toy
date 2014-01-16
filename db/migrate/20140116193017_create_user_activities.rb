class CreateUserActivities < ActiveRecord::Migration
  def change
    create_table :user_activities do |t|
      t.integer :user_id, null: false
      t.integer :activity_id, null: false

      t.timestamps
      t.index [:user_id, :activity_id], unique: true
    end
  end
end
