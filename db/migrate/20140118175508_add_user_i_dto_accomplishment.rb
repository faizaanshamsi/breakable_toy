class AddUserIDtoAccomplishment < ActiveRecord::Migration
  def up
    add_column :accomplishments, :user_id, :integer, null: false
  end

  def down
    remove_column :accomplishments, :user_id
  end
end
