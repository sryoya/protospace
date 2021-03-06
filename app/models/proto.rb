class Proto < ActiveRecord::Base
  paginates_per 8
  belongs_to :user
  has_many :proto_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, :catch_copy, :concept, presence: true
  accepts_nested_attributes_for :proto_images, allow_destroy: true, reject_if: :reject_proto_images
  validates :proto_images, presence: true
  acts_as_taggable

  def reject_proto_images(attributed)
    attributed[:image].blank?
  end
end
