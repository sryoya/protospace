class Protos::NewestController < ApplicationController
   def index
    @protos = Proto.includes(:user, :tags, :proto_images).order(updated_at: :desc).page(params[:page])
  end
end
