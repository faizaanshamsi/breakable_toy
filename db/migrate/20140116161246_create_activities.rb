class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.float :met, null: false
      t.boolean :cardiovascular
      t.boolean :bone_strength
      t.boolean :resistance

      t.timestamps
    end
  end
end
