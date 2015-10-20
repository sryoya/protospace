class AddProtoToProtoImages < ActiveRecord::Migration
  def change
    add_reference :proto_images, :proto, index: true, foreign_key: true
  end
end
