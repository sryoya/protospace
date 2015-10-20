class AddIndexToProtos < ActiveRecord::Migration
  def change
    add_index :protos, :user_id
  end
end
