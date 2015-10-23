class Proto < ActiveRecord::Base
  belongs_to :user
  has_many :proto_images
  accepts_nested_attributes_for :proto_images, allow_destroy: true, reject_if: :reject_proto_images
  attr_accessor :tag1, :tag2, :tag3

  def reject_proto_images(attributed)
    attributed[:image].blank?
  end
end
