class Protos::LikesController < ApplicationController
  def create
  unless Like.find_by(user_id: current_user.id)
    Like.create(create_params)
  end
    @proto = Proto.find(params[:like][:proto_id])
    @likes = @proto.likes
    @like = Like.new
  end

  def destroy
  like = Like.find(params[:id])
    if like.user_id == current_user.id
      like.destroy
    end
  @proto = Proto.find(params[:proto_id])
  @likes = @proto.likes
  @like = Like.new
  end

  private
  def create_params
    params.require(:like).permit(:proto_id).merge(user_id: current_user.id)
  end
end
