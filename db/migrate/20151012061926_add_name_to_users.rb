class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :works, :string
    add_column :users, :group, :string
    add_column :users, :profile, :text
  end
end
