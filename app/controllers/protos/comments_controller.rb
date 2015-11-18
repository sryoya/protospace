class Protos::CommentsController < ApplicationController
  def create
    Comment.create(create_params) if user_signed_in?
    proto = Proto.find(params[:comment][:proto_id])
    @comments = proto.comments.eager_load(:user)
  end

  private
  def create_params
    params.require(:comment).permit(:comment, :proto_id).merge(user_id: current_user.id)
  end

end
