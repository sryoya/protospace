class TopController < ApplicationController
  def index
    @protos = Proto.includes(:user, :tags, :proto_images).page(params[:page])
  end
end
