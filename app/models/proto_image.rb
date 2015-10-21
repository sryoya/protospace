class ProtoImage < ActiveRecord::Base
  belongs_to :proto
  mount_uploader :image, ProtoImageUploader
end
