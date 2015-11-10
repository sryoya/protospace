class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :proto, :counter_cache => true
end
