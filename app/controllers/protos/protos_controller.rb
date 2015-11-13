class Protos::ProtosController < ApplicationController
  def show
    @proto = Proto.includes(:proto_images, :user, :tags).find(params[:id])
    @comment = Comment.new
    @comments = @proto.comments.includes(:user)
    @likes = @proto.likes
    @like = Like.where(proto_id: @proto.id, user_id: current_user.id)
  end
  def new
    @proto = Proto.new
    @proto.proto_images.build
  end

  def create
    Proto.create(create_params)
    redirect_to :root and return
  end

  def index
    @protos = Proto.includes(:user, :tags, :proto_images).order(likes_count: :desc).page(params[:page]).per(8)
  end

  private
    def create_params
      params.require(:proto).permit(:title, :catch_copy, :concept, tag_list: [], proto_images_attributes: [:image, :status]).merge(user_id: current_user.id)
    end
end
