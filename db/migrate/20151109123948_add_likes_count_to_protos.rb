class AddLikesCountToProtos < ActiveRecord::Migration
  def change
    add_column :protos, :likes_count, :integer, :null => false, :default => 0

    Proto.all.each do |proto|
    Proto.update_counters(proto.id, likes_count: proto.likes.count)
    end
  end
end
