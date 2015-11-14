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
    @protos = Proto.includes(:user, :tags, :proto_images).order(likes_count: :desc).page(params[:page])
  end

  def edit
    @proto = Proto.includes(:proto_images, :user, :tags).find(params[:id])
  end

  def update
    proto = Proto.find(params[:id])
    if proto.user_id == current_user.id
      proto.update(update_params)
    end
    redirect_to :root and return
  end

  def destroy
    proto = Proto.find(params[:id])
    if proto.user_id == current_user.id
      proto.destroy
    end
    redirect_to :root and return
  end

  private
    def create_params
      params.require(:proto).permit(:title, :catch_copy, :concept, tag_list: [], proto_images_attributes: [:image, :status]).merge(user_id: current_user.id)
    end

    def update_params
      params.require(:proto).permit(:title, :catch_copy, :concept, tag_list: [], proto_images_attributes: [:image, :status])
    end
end
