class ProtoImage < ActiveRecord::Base
  belongs_to :proto
  enum status: %i(main sub)
  mount_uploader :image, ProtoImageUploader
end
