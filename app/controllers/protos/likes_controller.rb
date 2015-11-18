class Protos::LikesController < ApplicationController
  def create
    Like.where(user_id: current_user.id, proto_id: params[:proto_id]).first_or_create if user_signed_in?
    get_proto_and_likes
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy if like.user_id == current_user.id
    get_proto_and_likes
  end

  private
  def get_proto_and_likes
    @proto = Proto.find(params[:proto_id])
    @likes = Like.where(proto_id: params[:proto_id])
    @like = Like.where(proto_id: params[:proto_id], user_id: current_user.id)
  end

end
