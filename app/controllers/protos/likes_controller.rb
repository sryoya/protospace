class Protos::LikesController < ApplicationController
  def create
    Like.create(create_params)
    proto = Proto.find(params[:like][:proto_id])
    @likes = proto.likes
    redirect_to proto_path(params[:like][:proto_id]) and return
  end

  def destroy
    like = Like.find(params[:id])
    if like.user_id == current_user.id
      like.destroy
    end
  redirect_to proto_path(like.proto_id) and return
  end

  private
  def create_params
    params.require(:like).permit(:proto_id).merge(user_id: current_user.id)
  end
end
