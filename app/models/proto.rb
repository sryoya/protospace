class Proto < ActiveRecord::Base
  belongs_to :user
  has_many :proto_images
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  accepts_nested_attributes_for :proto_images, allow_destroy: true, reject_if: :reject_proto_images
  validates :proto_images, presence: true
  attr_accessor :tag1, :tag2, :tag3

  def reject_proto_images(attributed)
    attributed[:image].blank?
  end
end
