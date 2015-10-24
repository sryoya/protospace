class CreateProtoImages < ActiveRecord::Migration
  def change
    create_table :proto_images do |t|
      t.text :image
      t.string :status
      t.timestamps
    end
  end
end
