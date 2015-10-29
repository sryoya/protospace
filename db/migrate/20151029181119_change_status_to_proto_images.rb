class ChangeStatusToProtoImages < ActiveRecord::Migration
   def up
    change_column :proto_images, :status, :integer, null: false, default: 1
  end

  def down
    change_column :proto_images, :status, :string
  end
end
