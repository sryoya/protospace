class TopController < ApplicationController
  def index
    @protos = Proto.eager_load(:user, :tags, :proto_images).page(params[:page])
  end
end
