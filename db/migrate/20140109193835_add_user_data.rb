class AddUserData < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :age, :integer, null: false
    add_column :users, :gender, :string, null: false
    add_column :users, :height, :integer, null: false
    add_column :users, :weight, :integer, null: false
    add_column :users, :date_of_birth, :date, null: false
  end
end
