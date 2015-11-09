class NewestController < ApplicationController
   def index
    @protos = Proto.includes(:user, :tags, :proto_images).order(updated_at: :desc).limit(20)
  end
end
