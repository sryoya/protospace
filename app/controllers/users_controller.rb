class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @protos = @user.protos.eager_load(:proto_images, :tags).page(params[:page])
  end
end
