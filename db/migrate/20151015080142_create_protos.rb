class CreateProtos < ActiveRecord::Migration
  def change
    create_table :protos do |t|
      t.string :title
      t.string :catch_copy
      t.text :concept
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
