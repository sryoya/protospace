class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @protos = @user.protos.includes(:proto_images, :tags).page(params[:page])
  end
end
