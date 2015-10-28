class ProtosController < ApplicationController
  def show
    @proto = Proto.find(params[:id])
    @main_image = @proto.proto_images.find_by(status: "main")
    @sub_images = @proto.proto_images.where(status: "sub")
    @user = @proto.user
    @comment = Comment.new
    @comments = Comment.all
    @tags = @proto.tag_list
  end
  def new
    @proto = Proto.new
    @proto.proto_images.build
  end

  def create
    Proto.create(create_params)
    redirect_to :root and return
  end

  private
    def create_params
      params.require(:proto).permit(:title, :catch_copy, :concept, tag_list: [], proto_images_attributes: [:image, :status]).merge(user_id: current_user.id)
    end
end
