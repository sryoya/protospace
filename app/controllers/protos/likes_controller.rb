class Protos::LikesController < ApplicationController
  def create
  unless Like.find_by(user_id: current_user.id)
    Like.create(create_params)
  end
    @proto = Proto.find(params[:proto_id])
    @likes = Like.where(proto_id: params[:proto_id])
    @like = Like.where(proto_id: params[:proto_id], user_id: current_user.id)
  end

  def destroy
  like = Like.find(params[:id])
  if like.user_id == current_user.id
    like.destroy
  end
  @proto = Proto.find(params[:proto_id])
  @likes = Like.where(proto_id: params[:proto_id])
  @like = Like.where(proto_id: params[:proto_id], user_id: current_user.id)
  end

  private
  def create_params
    params.permit(:proto_id).merge(user_id: current_user.id)
  end
end
