class CommentsController < ApplicationController
  def create
    Comment.create(create_params)
    proto = Proto.find(params[:comment][:proto_id])
    @comments = proto.comments.includes(:user)
  end

  private
  def create_params
    params.require(:comment).permit(:comment, :proto_id).merge(user_id: current_user.id)
  end

end
