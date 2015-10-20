class Proto < ActiveRecord::Base
  belongs_to :user
  has_many :images
  attr_accessor :tag1, :tag2, :tag3
end
