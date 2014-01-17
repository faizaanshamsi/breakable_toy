class CreateAccomplishments < ActiveRecord::Migration
  def change
    create_table :accomplishments do |t|
      t.integer :user_activity_id, null: false
      t.integer :duration

      t.timestamps
    end
  end
end
