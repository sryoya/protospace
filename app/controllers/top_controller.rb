class TopController < ApplicationController
  def index
    @protos = Proto.includes(:user, :tags, :proto_images).limit(20)
  end
end
